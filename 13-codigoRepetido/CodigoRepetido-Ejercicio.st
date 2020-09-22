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

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/21/2020 16:27:08'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	
	customerBook := CustomerBook new.
	
	
	self measureOperation: [customerBook addCustomerNamed: 'Jhon Lennon'] shouldNotTakeMoreThan: 50 * millisecond.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/22/2020 16:33:56'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self initializeCustomerBookWithCustomer: paulMcCartney.
	
	self measureOperation: [customerBook removeCustomerNamed: paulMcCartney.] shouldNotTakeMoreThan: 100 * millisecond .
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/22/2020 15:23:55'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	
	self
		tryBlock:  [customerBook addCustomerNamed: '']
		raiseSignal:  Error
		assertionBlock: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage .
			self assert: customerBook isEmpty ]
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/22/2020 16:34:47'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon  := 'John Lennon'.
	customerBook:= self initializeCustomerBookWithCustomer: johnLennon .
	
	self 
		tryBlock: [ customerBook removeCustomerNamed: 'Paul McCartney'.]
		raiseSignal:  NotFound 
		assertionBlock: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/22/2020 16:35:19'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self initializeCustomerBookWithCustomer: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertInCustomerBook: customerBook numberOfActiveCustomers: 0  numberOfSuspendedCustomers: 1.  
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/22/2020 16:35:41'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self initializeCustomerBookWithCustomer: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertInCustomerBook: customerBook numberOfActiveCustomers: 0  numberOfSuspendedCustomers: 0.  
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/22/2020 16:36:17'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon  := 'John Lennon'.
	customerBook:= self initializeCustomerBookWithCustomer: johnLennon .
	
	
	self 
		tryBlock: [ customerBook suspendCustomerNamed: 'George Harrison'.]
		raiseSignal: CantSuspend
		assertionBlock: [:anError | 
				self assert: customerBook numberOfCustomers = 1.
				self assert: (customerBook includesCustomerNamed: johnLennon)] 
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ERMC 9/22/2020 16:36:36'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon  := 'John Lennon'.
	customerBook:= self initializeCustomerBookWithCustomer: johnLennon .
	
	customerBook suspendCustomerNamed: johnLennon.

	self 
		tryBlock: [ customerBook suspendCustomerNamed: johnLennon.]
		raiseSignal: CantSuspend
		assertionBlock: [:anError | 
				self assert: customerBook numberOfCustomers = 1.
				self assert: (customerBook includesCustomerNamed: johnLennon)] ! !


!CustomerBookTest methodsFor: 'utils' stamp: 'ERMC 9/22/2020 16:08:40'!
assertInCustomerBook: aCustomerBook numberOfActiveCustomers: numberOfActiveCustomers numberOfSuspendedCustomers: numberOfSuspendedCustomers

	self assert: numberOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: numberOfActiveCustomers + numberOfSuspendedCustomers equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'utils' stamp: 'ERMC 9/22/2020 16:11:20'!
measureOperation: aTestingClosure shouldNotTakeMoreThan: aTimeLimit

	| millisecondsBeforeRunning millisecondsAfterRunning |

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aTestingClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aTimeLimit)
	
! !

!CustomerBookTest methodsFor: 'utils' stamp: 'ERMC 9/22/2020 15:23:41'!
tryBlock: failingBlock raiseSignal: aSignal assertionBlock: anAssertionsBlock

	[ failingBlock value.
	self fail]
		on: aSignal 
		do: anAssertionsBlock ! !


!CustomerBookTest methodsFor: 'initialization' stamp: 'ERMC 9/22/2020 16:29:05'!
initializeCustomerBookWithCustomer: aCustomerName

	|customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed:  aCustomerName.
	^ customerBook. ! !


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


!CustomerBook methodsFor: 'customer management' stamp: 'ERMC 9/22/2020 15:42:13'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
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

!CustomerBook methodsFor: 'customer management' stamp: 'ERMC 9/22/2020 16:15:35'!
removeCustomerNamed: aName 
 	
	(self removeCustomer: aName from: active)
		ifFalse:[(self removeCustomer: aName from: suspended) 
			ifFalse:[^NotFound signal.]].
		
		"Dos dimos cuenta que podemos usar remove:ifAbsent de Collection pero nos parecio una buena idea usar una propia para ejercirtar además de que ya lo habiamos hecho"
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'ERMC 9/22/2020 15:39:35'!
suspendCustomerNamed: aName 

	(self removeCustomer: aName from: active)
		ifFalse:[ ^ CantSuspend signal ].
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'utils' stamp: 'ERMC 9/22/2020 15:16:45'!
removeCustomer: aCustomer from: aCustomerCollection

	1 to: aCustomerCollection size do: 
	[ :index |
		aCustomer = (aCustomerCollection at: index)
			ifTrue: [
				aCustomerCollection removeAt: index.
				^ true 
			] 
	].
	^ false! !

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
