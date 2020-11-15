!classDefinition: #AccountSummaryTest category: 'Portfolio-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryTest methodsFor: 'tests - ReceptiveAccount' stamp: 'G. B. 11/15/2020 18:23:26'!
test01AnEmptyAccountReturnsAnEmptyReport

	| anAccount expectedReport |
	
	anAccount := ReceptiveAccount new.
	expectedReport := OrderedCollection new. 
	expectedReport add: 'Balance = 0'.
	
	self assert: expectedReport equals: (AccountSummary from: anAccount).! !

!AccountSummaryTest methodsFor: 'tests - ReceptiveAccount' stamp: 'G. B. 11/15/2020 18:26:32'!
test02AccountWithOneDepositTransactionReturnsCorrectAccountSummary

	| anAccount expectedReport |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 100 on: anAccount.
	expectedReport := OrderedCollection new.
	expectedReport  add: 'Depósito por 100'.
	expectedReport  add: 'Balance = 100'.
	
	self assert: expectedReport equals: (AccountSummary from: anAccount). ! !

!AccountSummaryTest methodsFor: 'tests - ReceptiveAccount' stamp: 'G. B. 11/15/2020 18:27:05'!
test03AccountWithOneWithdrawTransactionReturnsCorrectlyAccountSummary

	| anAccount expectedReport |
	
	anAccount := ReceptiveAccount new.
	Withdraw register: 100 on: anAccount.
	expectedReport := OrderedCollection new.
	expectedReport  add: 'Extracción por 100'.
	expectedReport  add: 'Balance = -100'.

	
	self assert: expectedReport equals: (AccountSummary from: anAccount). ! !

!AccountSummaryTest methodsFor: 'tests - ReceptiveAccount' stamp: 'G. B. 11/15/2020 18:27:28'!
test04AccountWithMoreThanOneDepositTransactionReturnsCorrectAccountSummary

	| anAccount expectedReport |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 100 on: anAccount.
	Deposit register: 50 on: anAccount.
	
	expectedReport := OrderedCollection new.
	expectedReport  add: 'Depósito por 100'.
	expectedReport  add: 'Depósito por 50'.
	expectedReport  add: 'Balance = 150'.
	
	self assert: expectedReport equals: (AccountSummary from: anAccount). ! !

!AccountSummaryTest methodsFor: 'tests - ReceptiveAccount' stamp: 'G. B. 11/15/2020 18:27:49'!
test05AccountWithOneTransferTransactionReturnsCorrectAccountSummary

	| srcAccount dstAccount aTransfer expectedReportFromSrc expectedReportFromDst aValue|
	
	aValue := 50.
	srcAccount := ReceptiveAccount new.
	dstAccount := ReceptiveAccount new.
	aTransfer := Transfer from: srcAccount to: dstAccount amount: aValue. 
	
	expectedReportFromSrc := OrderedCollection new.
	expectedReportFromSrc add: 'Salida por transferencia de ', aValue asString .
	expectedReportFromSrc add: 'Balance = -', aValue asString.
	
	expectedReportFromDst := OrderedCollection new.
	expectedReportFromDst add: 'Entrada por transferencia de ', aValue asString.
	expectedReportFromDst add: 'Balance = ', aValue asString.

	self assert: expectedReportFromSrc equals: (AccountSummary from: srcAccount). 
	self assert: expectedReportFromDst equals: (AccountSummary from: dstAccount). ! !

!AccountSummaryTest methodsFor: 'tests - ReceptiveAccount' stamp: 'G. B. 11/15/2020 18:28:26'!
test06AccountWithDepositWithdrawalAndTransfersReturnsCorrectAccountSummary

	| account1 account2 expectedReportFromSrc |

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	Withdraw register: 50 on: account1.
	Transfer from: account1 to: account2 amount: 20. 
	Transfer from: account2 to: account1 amount: 30. 

	expectedReportFromSrc := OrderedCollection new.
	expectedReportFromSrc add: 'Depósito por 100'.
	expectedReportFromSrc add: 'Extracción por 50'. 
	expectedReportFromSrc add: 'Salida por transferencia de 20'.
	expectedReportFromSrc add: 'Entrada por transferencia de 30'.
	expectedReportFromSrc add: 'Balance = 60'.
	
	self assert: expectedReportFromSrc equals: (AccountSummary from: account1). 
! !


!AccountSummaryTest methodsFor: 'tests - Portfolio' stamp: 'G. B. 11/15/2020 18:29:07'!
test07EmptyPortfolioHasEmptyAccountSummary

	| portfolio  expectedReport |

	portfolio := Portfolio new.

	expectedReport := OrderedCollection new.
	expectedReport add: 'Balance = 0'.
	
	self assert: expectedReport equals: (AccountSummary from: portfolio). 
! !

!AccountSummaryTest methodsFor: 'tests - Portfolio' stamp: 'G. B. 11/15/2020 18:29:22'!
test08PortfolioWithOneAccountReturnsCorrectReport

	| portfolio  anAccount expectedReport |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 100 on: anAccount .
	portfolio := Portfolio with: anAccount. 

	expectedReport := OrderedCollection new.
	expectedReport add: 'Depósito por 100'.
	expectedReport add: 'Balance = 100'.
	
	self assert: expectedReport equals: (AccountSummary from: portfolio). 
! !

!AccountSummaryTest methodsFor: 'tests - Portfolio' stamp: 'G. B. 11/15/2020 18:29:35'!
test09ComposedPortfolioWhitManyAccountsReturnsCorrectReport

	| account1 account2 simplePortfolio composedPortfolio expectedReport |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	Withdraw register: 50 on: account2.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account1.
	simplePortfolio add: account2.

	expectedReport := OrderedCollection new.
	expectedReport add: 'Extracción por 50'. 
	expectedReport add: 'Depósito por 100'.
	expectedReport add: 'Balance = 50'.
	
	self assert: expectedReport equals: (AccountSummary from: composedPortfolio).! !


!classDefinition: #PortfolioTest category: 'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:17:51'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/9/2020 06:00:12'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/9/2020 06:02:30'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on: account.
		
	self assert: 1 equals: account transactions size .
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferNetTest category: 'Portfolio-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetTest methodsFor: 'tests - ReceptiveAccount' stamp: 'G. B. 11/15/2020 18:32:50'!
test01AccountWithNoTransferReturnsTransferNetZero

	|anAccount expectedValue |
	
	anAccount := ReceptiveAccount new.
	expectedValue := 0.
	
	self assert: expectedValue equals: (TransferNet from: anAccount). ! !

!TransferNetTest methodsFor: 'tests - ReceptiveAccount' stamp: 'G. B. 11/15/2020 18:33:07'!
test02AccountWithOneTransferReturnsCorrectTransferNetOfTheAccount

	|srcAccount dstAccount expectedValue |
	
	srcAccount := ReceptiveAccount new.
	dstAccount := ReceptiveAccount new.
	Transfer from: srcAccount to: dstAccount  amount: 50.
	expectedValue := 50.
	
	self assert: expectedValue equals: (TransferNet from: dstAccount).
	self assert: expectedValue negated equals: (TransferNet from: srcAccount). ! !

!TransferNetTest methodsFor: 'tests - ReceptiveAccount' stamp: 'G. B. 11/15/2020 18:33:32'!
test03AccountWithManyTransfersReturnsCorrectTransferNetOfTheAccount

	|account1 account2 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1 .
	account2 := ReceptiveAccount new.
	Transfer from: account1 to: account2  amount: 50.
	Transfer from: account1 to: account2  amount: 20. 
	Transfer from: account1 to: account2  amount: 30.
	Transfer from: account2 to: account1 amount: 10.
	
	self assert: 90 equals: (TransferNet from: account2).
	self assert: -90 equals: (TransferNet from: account1).
! !


!TransferNetTest methodsFor: 'tests - Portfolio' stamp: 'G. B. 11/15/2020 15:58:00'!
test04AnEmptyPorfolioHasZeroTransferNet

	| portfolio |
	
	portfolio := Portfolio new. 
	
	self assert: 0 equals: (TransferNet from: portfolio).
! !

!TransferNetTest methodsFor: 'tests - Portfolio' stamp: 'G. B. 11/15/2020 15:58:12'!
test05PorfolioWithOneAccountReportCorrectTransferNet

	| portfolio srcAccount dstAccount |
	
	srcAccount := ReceptiveAccount new.
	dstAccount := ReceptiveAccount new. 
	Transfer from: srcAccount to: dstAccount  amount: 100.
	
	portfolio := Portfolio with: srcAccount with: dstAccount . 
	
	self assert: 0 equals: (TransferNet from: portfolio).	
	! !

!TransferNetTest methodsFor: 'tests - Portfolio' stamp: 'G. B. 11/15/2020 18:33:56'!
test06PorfolioWithManyAccountsReportCorrectTransferNet

	| portfolio srcAccount dstAccount |
	
	srcAccount := ReceptiveAccount new.
	dstAccount := ReceptiveAccount new. 
	Transfer from: srcAccount to: dstAccount  amount: 100.
	
	portfolio := Portfolio with: srcAccount . 
	
	self assert: -100 equals: (TransferNet from: portfolio).	
! !

!TransferNetTest methodsFor: 'tests - Portfolio' stamp: 'G. B. 11/15/2020 18:34:08'!
test07ComposePortfolioWithManyAccountsReturnsCorrectTransferNet

	| account1 account2 account3 simplePortfolio composedPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	
	Transfer from: account1 to: account3 amount: 100.
	Transfer from: account2 to: account3  amount: 50.
	Transfer from: account3 to: account1 amount: 10.
	
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account1.
	simplePortfolio add: account2.
	
	self assert: -140 equals: (TransferNet from: composedPortfolio).
	
		
! !


!classDefinition: #TransferTest category: 'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'G. B. 11/15/2020 18:16:12'!
test01AutoTransferIsNotValid
	
	|anAccount aTransfer|
	
	anAccount := ReceptiveAccount new.
	
	self
		should: [aTransfer := Transfer from: anAccount to: anAccount amount: 50. ]
		raise: Error withMessageText: Transfer canNotTransferYourSelfErrorMessage. 

	
! !

!TransferTest methodsFor: 'tests' stamp: 'G. B. 11/15/2020 18:17:34'!
test02TransferZeroAmountIsNotPossible
	
	|srcAccount dstAccount aTransfer|
	
	srcAccount := ReceptiveAccount new.
	dstAccount := ReceptiveAccount new.
	
	self
		should: [aTransfer := Transfer from: srcAccount to: dstAccount amount: 0. ]
		raise: Error withMessageText: Transfer canNotMakeAnEmptyTransferErrorMessage. 

	
! !

!TransferTest methodsFor: 'tests' stamp: 'G. B. 11/15/2020 18:17:27'!
test03TransferNegativeAmountIsNotPossible
	
	|srcAccount dstAccount aTransfer|
	
	srcAccount := ReceptiveAccount new.
	dstAccount := ReceptiveAccount new.
	
	self
		should: [aTransfer := Transfer from: srcAccount to: dstAccount amount: -100. ]
		raise: Error withMessageText: Transfer canNotMakeANegativeTransferErrorMessage. 

	
! !

!TransferTest methodsFor: 'tests' stamp: 'G. B. 11/15/2020 18:17:58'!
test04TransferBetweenAccountsAffectsBalance
	
	|account1 account2 aTransfer|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	aTransfer := Transfer from: account1 to: account2 amount: 50. 
	
	self assert: -50 equals: account1 balance. 
	self assert: 50 equals: account2 balance. ! !

!TransferTest methodsFor: 'tests' stamp: 'G. B. 11/15/2020 18:18:17'!
test05TransferBetweenAccountsSaveTheTransaction
	
	|account1 account2 aTransfer|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	aTransfer := Transfer from: account1 to: account2 amount: 50. 
	
	self assert: (account1 hasRegistered: (aTransfer originAccount )).
	self assert: (account2 hasRegistered: (aTransfer destinyAccount )).! !

!TransferTest methodsFor: 'tests' stamp: 'G. B. 11/15/2020 18:18:51'!
test06ItIsPossibleToGoFromOneTransferLegToAnother
	
	|account1 account2 aTransfer|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	aTransfer := Transfer from: account1 to: account2 amount: 50. 
	
	self assert: (aTransfer originAccount  associatedTransferLeg) equals: (aTransfer destinyAccount).
	self assert: (aTransfer destinyAccount  associatedTransferLeg) equals: (aTransfer originAccount).! !


!classDefinition: #Account category: 'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !



!Portfolio methodsFor: 'reports' stamp: 'G. B. 11/15/2020 17:08:00'!
iterateTransactionsForReport: aReport
	self transactions do: [:aTransaction | aTransaction affectReport: aReport].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'NR 11/9/2020 06:01:26'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio!!'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'NR 11/9/2020 05:56:36'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions copy! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !



!ReceptiveAccount methodsFor: 'reports' stamp: 'G. B. 11/15/2020 17:06:58'!
iterateTransactionsForReport: aReport
	transactions do: [:aTransaction | aTransaction affectReport: aReport].
	! !


!classDefinition: #AccountTransaction category: 'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'balance' stamp: 'G. B. 11/15/2020 18:43:40'!
affectReport: aReport

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'balance' stamp: 'G. B. 11/15/2020 18:44:03'!
initializeFor: anObject

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

!Deposit methodsFor: 'balance' stamp: 'G. B. 11/15/2020 16:56:29'!
affectReport: aReport
	^ aReport fromDeposit: value.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferTransaction category: 'Portfolio-Solucion'!
AccountTransaction subclass: #TransferTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTransaction methodsFor: 'initialization' stamp: 'G. B. 11/15/2020 18:41:11'!
initializeFor: aTransfer. 
	self subclassResponsibility.! !


!TransferTransaction methodsFor: 'accessing' stamp: 'G. B. 11/15/2020 18:41:41'!
associatedTransferLeg
	self subclassResponsibility.! !


!TransferTransaction methodsFor: 'reports' stamp: 'G. B. 11/15/2020 18:41:28'!
affectReport: aReport
	self subclassResponsibility.! !


!TransferTransaction methodsFor: 'balance' stamp: 'G. B. 11/15/2020 18:41:20'!
affectBalance: aBalance
	self subclassResponsibility.! !


!classDefinition: #TransferDeposit category: 'Portfolio-Solucion'!
TransferTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferDeposit methodsFor: 'initialization' stamp: 'ERMC 11/14/2020 11:41:20'!
initializeFor: aTransfer. 

	transfer := aTransfer
	! !


!TransferDeposit methodsFor: 'accessing' stamp: 'ERMC 11/14/2020 16:00:59'!
associatedTransferLeg
	
	^(transfer originAccount )! !


!TransferDeposit methodsFor: 'balance' stamp: 'ERMC 11/14/2020 11:46:57'!
affectBalance: aBalance

	^aBalance + (transfer value)! !


!TransferDeposit methodsFor: 'reports' stamp: 'G. B. 11/15/2020 16:57:41'!
affectReport: aReport
	^ aReport fromTransferDeposit: (transfer value).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'Portfolio-Solucion'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'ERMC 11/14/2020 11:41:06'!
for: aTransfer

	^ self new initializeFor: aTransfer. ! !


!classDefinition: #TransferWithdraw category: 'Portfolio-Solucion'!
TransferTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferWithdraw methodsFor: 'accessing' stamp: 'ERMC 11/14/2020 16:00:42'!
associatedTransferLeg
	
	^(transfer destinyAccount)! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'ERMC 11/14/2020 11:42:30'!
initializeFor: aTransfer. 

	transfer := aTransfer
	! !


!TransferWithdraw methodsFor: 'reports' stamp: 'G. B. 11/15/2020 16:58:04'!
affectReport: aReport
	^ aReport fromTransferWithdraw: (transfer value).! !


!TransferWithdraw methodsFor: 'balance' stamp: 'ERMC 11/14/2020 11:47:07'!
affectBalance: aBalance

	^aBalance - (transfer value)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'Portfolio-Solucion'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'ERMC 11/14/2020 11:42:20'!
for: aTransfer

	^ self new initializeFor: aTransfer. ! !


!classDefinition: #Withdraw category: 'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

!Withdraw methodsFor: 'balance' stamp: 'G. B. 11/15/2020 16:58:30'!
affectReport: aReport
	^ aReport fromWithdraw: value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountTransactionReport category: 'Portfolio-Solucion'!
Object subclass: #AccountTransactionReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransactionReport methodsFor: 'initialization' stamp: 'G. B. 11/15/2020 18:35:34'!
initializeFor: anAccount
	self subclassResponsibility.! !


!AccountTransactionReport methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 18:35:47'!
fromDeposit: aValue
	self subclassResponsibility.! !

!AccountTransactionReport methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 18:35:55'!
fromTransferDeposit: aValue
	self subclassResponsibility.! !

!AccountTransactionReport methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 18:36:04'!
fromTransferWithdraw: aValue
	self subclassResponsibility.! !

!AccountTransactionReport methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 18:36:13'!
fromWithdraw: aValue
	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'Portfolio-Solucion'!
AccountTransactionReport subclass: #AccountSummary
	instanceVariableNames: 'summaryReport'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummary methodsFor: 'initialization' stamp: 'G. B. 11/15/2020 16:43:15'!
initializeFor: anAccount
	^ self accountSummaryReportFor: anAccount.! !


!AccountSummary methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 18:31:13'!
accountSummaryReportFor: anAccount
	
	summaryReport := OrderedCollection new.
	anAccount iterateTransactionsForReport: self.	
	summaryReport add: 'Balance = ' , (anAccount balance) asString. 

	^ summaryReport.! !

!AccountSummary methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 17:09:43'!
fromDeposit: aValue
	^summaryReport add: 'Depósito por ', aValue asString. ! !

!AccountSummary methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 17:09:49'!
fromTransferDeposit: aValue
	^ summaryReport add: 'Entrada por transferencia de ', aValue asString. ! !

!AccountSummary methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 17:09:53'!
fromTransferWithdraw: aValue
	^ summaryReport add: 'Salida por transferencia de ', aValue asString. ! !

!AccountSummary methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 17:10:00'!
fromWithdraw: aValue
	^ summaryReport add: 'Extracción por ', aValue asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'Portfolio-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'G. B. 11/15/2020 16:43:15'!
from: anAccount 
	^self new initializeFor: anAccount. ! !


!classDefinition: #TransferNet category: 'Portfolio-Solucion'!
AccountTransactionReport subclass: #TransferNet
	instanceVariableNames: 'currentTransferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNet methodsFor: 'initialization' stamp: 'G. B. 11/15/2020 15:55:48'!
initializeFor: anAccount
	^ self calculateTransferNetFor: anAccount.! !


!TransferNet methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 17:08:31'!
calculateTransferNetFor: anAccount

	currentTransferNet := 0.
	
	anAccount iterateTransactionsForReport: self.
		
	^ currentTransferNet 
	
	! !

!TransferNet methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 16:52:52'!
fromDeposit: aValue
! !

!TransferNet methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 16:49:49'!
fromTransferDeposit: aValue
	currentTransferNet _ currentTransferNet + aValue! !

!TransferNet methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 16:50:04'!
fromTransferWithdraw: aValue
	currentTransferNet _ currentTransferNet - aValue! !

!TransferNet methodsFor: 'report creation' stamp: 'G. B. 11/15/2020 16:53:06'!
fromWithdraw: aValue
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'Portfolio-Solucion'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'G. B. 11/15/2020 15:54:50'!
from: anAccount 
	^self new initializeFor: anAccount. ! !


!classDefinition: #Transfer category: 'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'originAccount destinyAccount value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transfer methodsFor: 'initialization' stamp: 'G. B. 11/15/2020 18:21:13'!
initializeFrom: anOriginAccount to: aDestinyAccount amount: anAmount 
	self checkIsTransferValidFrom: anOriginAccount  to: aDestinyAccount amount: anAmount.
	
	originAccount := TransferWithdraw register: self on: anOriginAccount.
	destinyAccount := TransferDeposit register: self on: aDestinyAccount.
	value := anAmount.! !


!Transfer methodsFor: 'accessing' stamp: 'ERMC 11/14/2020 11:51:34'!
destinyAccount
	
	^ destinyAccount

	! !

!Transfer methodsFor: 'accessing' stamp: 'ERMC 11/14/2020 11:51:13'!
originAccount
	
	^ originAccount

	! !

!Transfer methodsFor: 'accessing' stamp: 'ERMC 11/14/2020 11:50:10'!
value

	^ value! !


!Transfer methodsFor: 'transfer - private' stamp: 'G. B. 11/15/2020 18:21:42'!
checkIsTransferValidFrom: anOriginAccount  to: aDestinyAccount amount: anAmount.

	(anOriginAccount = aDestinyAccount ) ifTrue: [^ self error: self class canNotTransferYourSelfErrorMessage ].
	(anAmount  <= 0 ) ifTrue: [^ self error: self class canNotMakeAnEmptyTransferErrorMessage].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'ERMC 11/14/2020 11:45:05'!
from: aOriginAccount to: aDestinyAccount amount: anAmount
"
	Withdraw register: anAmount on: aOriginAccount .
	Deposit register: anAmount on: aDestinyAccount. 	
"

	^self new initializeFrom: aOriginAccount to: aDestinyAccount amount: anAmount ! !


!Transfer class methodsFor: 'errors' stamp: 'ERMC 11/14/2020 12:40:04'!
canNotMakeANegativeTransferErrorMessage
	self "You can not make a negative transfer".! !

!Transfer class methodsFor: 'errors' stamp: 'ERMC 11/14/2020 12:37:17'!
canNotMakeAnEmptyTransferErrorMessage
	self "You can not make an empty Transfer"! !

!Transfer class methodsFor: 'errors' stamp: 'ERMC 11/14/2020 12:30:48'!
canNotTransferYourSelfErrorMessage
	self "can not Transfer your Self"! !
