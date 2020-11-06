!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'test - balance' stamp: 'ERMC 11/6/2020 18:15:49'!
test01APortfolioHaveZeroAsBalanceWhenCreated 

	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'ERMC 11/6/2020 18:16:40'!
test02APortfolioWithOnePortfolioWithNonZeroBalanceHasTheBalanceOfTheAccount

	| portfolio anAccount aPortfolio|
		
	anAccount := ReceptiveAccount new.
	Deposit register: 100 on: anAccount.
	aPortfolio := Portfolio with: anAccount. 
	
	portfolio := Portfolio with: aPortfolio .
	
	self assert: 100 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'ERMC 11/6/2020 18:23:26'!
test03APortfolioWithManyAccountWithNonZeroBalanceHasTheSumOfBalance

	| portfolio anAccount anAccount2 aPortfolioA aPortfolioB |
		
	anAccount := ReceptiveAccount new.
	anAccount2 := ReceptiveAccount new.
	
	Deposit register: 100 on: anAccount.
	Deposit register: 30 on: anAccount2.
	Withdraw register: 50 on: anAccount. 
	aPortfolioA := Portfolio with: anAccount.
	aPortfolioB := Portfolio with: aPortfolioA.
	
	portfolio := Portfolio with: aPortfolioB.
	portfolio add: anAccount2 . 
		
	self assert: 80 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'ERMC 11/6/2020 18:48:31'!
test05PortfolioKnowsRegisteredTransactions 

	| portfolio anAccount  aPortfolio  aDeposit aWithdraw |
		
	anAccount := ReceptiveAccount new.
	aDeposit := Deposit register: 100 on: anAccount.
	aWithdraw := Withdraw register: 50 on: anAccount. 
	aPortfolio := Portfolio with: anAccount.
	
	portfolio := Portfolio with: aPortfolio.
	
	self assert: (portfolio hasRegistered: aDeposit).
	self assert: (portfolio hasRegistered: aWithdraw).
		
! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'ERMC 11/6/2020 19:07:32'!
test06PortfolioWithManyAccountsKnowsRegisteredTransactions 

	| portfolio anAccount anAccount2 anAccount3  aPortfolio1 aPortfolio2  aDeposit aWithdraw  |
		
	anAccount := ReceptiveAccount new.
	aDeposit := Deposit register: 100 on: anAccount.
	aWithdraw := Withdraw register: 50 on: anAccount. 
	aPortfolio1 := Portfolio with: anAccount.
	
	anAccount2 := ReceptiveAccount new.
	Deposit register: 30 on: anAccount.
	
	anAccount3 := ReceptiveAccount new.
	Withdraw register: 60 on: anAccount3 .
	aPortfolio2 := Portfolio with: anAccount3.
	
	portfolio := Portfolio with: aPortfolio1.
	portfolio add: anAccount2.
	portfolio add: aPortfolio2.

	self assert: (portfolio hasRegistered: aDeposit).
	self assert: (portfolio hasRegistered: aWithdraw).
		
! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'ERMC 11/6/2020 19:15:17'!
test07AnEmptyPortfolioHasZeroTransaction

	|  portfolio |
	
	portfolio := Portfolio new. 
	
	self assert: 0 equals:  portfolio transactions size.
! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'ERMC 11/6/2020 19:56:35'!
test08PortfolioWithOneAccountKnewTheAccountTransactions

	|  portfolio anAccount expectedResult aDeposit aWithdraw portfolio2 portfolio3 |
	
	anAccount := ReceptiveAccount new.
	aDeposit := Deposit register: 100 on: anAccount.
	aWithdraw := Withdraw register: 50 on: anAccount. 
	
	portfolio3 := Portfolio with: anAccount. 
	portfolio2 := Portfolio with: portfolio3. 
	portfolio := Portfolio with: portfolio2.  
	
	expectedResult := Set with: aDeposit with: aWithdraw. 
	
	self assert: expectedResult equals:  portfolio transactions.

	! !


!PortfolioTest methodsFor: 'test - hasRegitered' stamp: 'ERMC 11/6/2020 18:37:37'!
test04AnEmptyPortfolioDontKnowAnyTransaction

	| anAccount portfolio |
	portfolio := Portfolio new. 
	
	anAccount := ReceptiveAccount new.
	Deposit register: 100 on: anAccount.
	
	self deny: (portfolio hasRegistered: anAccount)! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:15'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'ERMC 11/2/2020 20:43:47'!
addToBalance: aBalance

	^ aBalance  + value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'ERMC 11/2/2020 20:44:09'!
addToBalance: aBalance

	^ aBalance - value. ! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'accessing' stamp: 'ERMC 11/6/2020 18:27:16'!
add: anAccount

	accounts add: anAccount. ! !

!Portfolio methodsFor: 'accessing' stamp: 'ERMC 11/2/2020 19:51:12'!
addAccount: aReceptiveAccount 
	
	accounts add: aReceptiveAccount.! !

!Portfolio methodsFor: 'accessing' stamp: 'ERMC 11/2/2020 19:56:51'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]
	! !

!Portfolio methodsFor: 'accessing' stamp: 'ERMC 11/2/2020 19:52:04'!
initialize
	
	accounts := OrderedCollection new. ! !

!Portfolio methodsFor: 'accessing' stamp: 'ERMC 11/6/2020 19:53:15'!
transactions
	|transactions|
	
	transactions _ Set new.
	 accounts do: [:anAccount | anAccount transactions do: [:aTransaction | transactions add: aTransaction ]].
		
	^ transactions .! !


!Portfolio methodsFor: 'initialize' stamp: 'ERMC 11/6/2020 18:14:13'!
initializeWith: anAccount 
	
	accounts := OrderedCollection with: anAccount.! !


!Portfolio methodsFor: 'accesing' stamp: 'ERMC 11/6/2020 18:53:57'!
hasRegistered: aTransaction 
	
	^ accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction ] ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'initialization' stamp: 'ERMC 11/6/2020 18:15:28'!
with: anAccount 

	^self new initializeWith: anAccount .! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'ERMC 11/2/2020 20:57:41'!
balance
	|totalBalance|
	
	totalBalance := 0.
	
	totalBalance := transactions sum: [ :aTransaction | aTransaction addToBalance: totalBalance  ] ifEmpty: [ 0 ].
	
	^ totalBalance. 
	
	! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
