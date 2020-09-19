!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/19/2020 11:03:33'!
measureOperation: aClosure shouldNotTakeMoreThan: aTime

	| millisecondsBeforeRunning millisecondsAfterRunning |
	"customerBook := CustomerBook new."
	
	"(anOperation = 'removeCustomerNamed') ifTrue: 
						[paulMcCartney := 'Paul McCartney'.
						customerBook addCustomerNamed: paulMcCartney]."

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aTime * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/19/2020 12:42:56'!
operation: nameTest numbersOfCustomersAfterOperation: n

	
	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	(nameTest = 'removing') ifTrue:[customerBook removeCustomerNamed: paulMcCartney.].
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: n equals: customerBook numberOfSuspendedCustomers.
	self assert: n equals: customerBook numberOfCustomers.
	(nameTest= 'removing') ifTrue:[self deny: (customerBook includesCustomerNamed: paulMcCartney).]
			ifFalse: [self assert: (customerBook includesCustomerNamed: 			paulMcCartney).]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/19/2020 12:07:22'!
renameD: aClosure signal: aSignal assertionBlock: anAssertionsBlock

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/19/2020 12:12:31'!
suspendBlock: aClosure withCustomerBook: aCustomerBook andCustomer: johnLennon
	
		[aClosure]
			on: CantSuspend 
			do: [ :anError | 
				self assert: aCustomerBook numberOfCustomers = 1.
				self assert: (aCustomerBook includesCustomerNamed: johnLennon)]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/19/2020 11:02:45'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	
	customerBook := CustomerBook new.
	
	
	self measureOperation: [customerBook addCustomerNamed: 'Jhon Lennon'] shouldNotTakeMoreThan: 50.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/19/2020 11:05:30'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	"millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook removeCustomerNamed: paulMcCartney.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond."
	
	self measureOperation: [customerBook removeCustomerNamed: paulMcCartney.] shouldNotTakeMoreThan: 100.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HAW 8/28/2017 08:57:25'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/19/2020 12:47:18'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	self operation: 'suspended' numbersOfCustomersAfterOperation: 1. ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/19/2020 12:18:12'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	self operation: 'removing' numbersOfCustomersAfterOperation: 0. 


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/19/2020 12:13:14'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	
	self suspendBlock: [ customerBook suspendCustomerNamed: 'George Harrison'.
	self fail ] withCustomerBook: customerBook andCustomer: johnLennon.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/19/2020 12:13:02'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	self suspendBlock: [ customerBook suspendCustomerNamed: johnLennon
	self fail ] withCustomerBook: customerBook andCustomer: johnLennon.! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'ERMC 9/19/2020 12:57:40'!
removeCustomerNamed: aName 
 
	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^NotFound signal.] ].
	

	"
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].
		
	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal."

! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/17/2020 06:01:49'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/17/2020 06:02:05'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!'! !
