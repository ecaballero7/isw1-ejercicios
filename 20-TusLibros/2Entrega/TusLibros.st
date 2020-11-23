!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'G. B. 11/21/2020 21:17:05'!
test09CartSumsItemsPriceCorrectly

	| cart |
	
	cart := self createCart.
	
	cart add: 7 of: self itemSellByTheStore.
	self assert: cart itemsPrice equals: 500*7.! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'G. B. 11/21/2020 20:42:19'!
defaultCatalog
	
	^ TusLibrosCatalog with: self itemSellByTheStore withPrice: 500.! !

!CartTest methodsFor: 'support' stamp: 'G. B. 11/21/2020 20:35:44'!
itemNotSellByTheStore
	
	^'invalidBook'.! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'G. B. 11/21/2020 21:03:55'!
anotherItemSellByTheStore
	
	^ 'validBook2'! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'G. B. 11/21/2020 19:51:25'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'G. B. 11/23/2020 23:33:24'!
createValidCreditCard
	
	^CreditCard withNumber: 423423423 expiration: (GregorianMonthOfYear yearNumber: 9999 monthNumber: 7) owner: 'Alan Kay'.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'G. B. 11/21/2020 21:04:39'!
defaultCatalog
	
	| catalog |
	catalog _ TusLibrosCatalog with: self itemSellByTheStore withPrice: 234.
	catalog add: self anotherItemSellByTheStore withPrice: 120.
	
	^ catalog.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'G. B. 11/21/2020 19:51:39'!
itemSellByTheStore
	
	^ 'validBook'! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'G. B. 11/23/2020 22:58:48'!
test01AnEmptyCartCannotCheckOut
	|cart cashier creditCard |
	cart _ self createCart.
	creditCard _ self createValidCreditCard.

	cashier _ Cashier new.
	
		self 
		should: [cashier checkOut: cart with: creditCard.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText = Cashier canNotCheckoutAnEmptyCartErrorDescription.]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'G. B. 11/21/2020 21:03:33'!
test02CashierCanCheckOutACartWith1Product
	|cart cashier creditCard |
	cart _ self createCart.
	cart add: 1 of: self itemSellByTheStore.
	
	creditCard _ self createValidCreditCard.
	cashier _ Cashier new.
	
	
	self assert: (cart itemsPrice) equals: (cashier checkOut: cart with: creditCard).
	self assert: cart isEmpty.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'G. B. 11/21/2020 21:09:01'!
test03CashierCanCheckOutACartWithManyProducts
	|cart cashier creditCard |
	cart _ self createCart.
	cart add: 2 of: self itemSellByTheStore.
	cart add: 3 of: self anotherItemSellByTheStore.

	creditCard _ self createValidCreditCard.
	cashier _ Cashier new.
	
	
	self assert: (cart itemsPrice) equals: (cashier checkOut: cart with: creditCard).
	self assert: cart isEmpty.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'G. B. 11/23/2020 23:35:36'!
test04ACartCannotCheckOutWithAnExpiredCreditCard
	|cart cashier creditCard |
	cart _ self createCart.
	cart add: 2 of: self itemSellByTheStore.

	creditCard _ CreditCard withNumber: 423423423 expiration: (GregorianMonthOfYear yearNumber: 1999 monthNumber: 7) owner: 'Alan Kay'.
	cashier _ Cashier new.
	
	
	self 
		should: [cashier checkOut: cart with: creditCard.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText = Cashier canNotCheckoutWithAnInvalidCreditCardErrorDescription .]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'G. B. 11/23/2020 23:33:38'!
test05ACartCannotCheckOutWithAStolenCreditCard
	|cart cashier creditCard |
	cart _ self createCart.
	cart add: 2 of: self itemSellByTheStore.

	creditCard _ CreditCard withNumber: 423423423 expiration: (GregorianMonthOfYear yearNumber: 9999 monthNumber: 7) owner: 'Hernan Wilkinson'.
	cashier _ Cashier new.
	
	
	self 
		should: [cashier checkOut: cart with: creditCard.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText = Cashier canNotCheckoutWithAnInvalidCreditCardErrorDescription .]! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidItem: anItem

	(catalog includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'accessing' stamp: 'G. B. 11/21/2020 20:53:01'!
items
	^items.! !

!Cart methodsFor: 'accessing' stamp: 'G. B. 11/21/2020 21:17:51'!
itemsPrice
	^items sum: [:aCartItem | catalog priceOf: aCartItem ]
	! !


!Cart methodsFor: 'as yet unclassified' stamp: 'G. B. 11/21/2020 21:00:46'!
deleteItems
	items _ OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!Cashier methodsFor: 'checkout' stamp: 'G. B. 11/23/2020 23:46:31'!
assertIsAValidCreditCard: aCreditCard

	(aCreditCard isExpired) ifTrue: [^self error: self class canNotCheckoutWithAnInvalidCreditCardErrorDescription].! !

!Cashier methodsFor: 'checkout' stamp: 'G. B. 11/24/2020 00:20:11'!
checkOut: aCart with: aCreditCard 

	|price merchantProcessorSimulator |

	(aCart isEmpty) ifTrue: [^self error: self class canNotCheckoutAnEmptyCartErrorDescription].
	
	self assertIsAValidCreditCard: aCreditCard.

	price _ aCart itemsPrice.
	
	merchantProcessorSimulator _ MerchantProcessor new.
	
	[ merchantProcessorSimulator debit: price from: aCreditCard. ]
		on: Error do:[^self error: self class canNotCheckoutWithAnInvalidCreditCardErrorDescription	].
	
		
	aCart deleteItems.
	
	
	^price! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/21/2020 19:58:33'!
canNotCheckoutAnEmptyCartErrorDescription
	^'Cannot check out and empty car!!'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/23/2020 22:19:18'!
canNotCheckoutWithAnInvalidCreditCardErrorDescription
	^ 'Cannot check out with an invalid credit card'.! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'date number owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'G. B. 11/21/2020 20:28:05'!
initializeWithNumber: aCreditCardNumber expiration: aDate owner: anOwnerName 
	number := aCreditCardNumber.
	date := aDate.
	owner := anOwnerName.! !

!CreditCard methodsFor: 'initialization' stamp: 'G. B. 11/23/2020 23:36:10'!
isExpired
	^date < GregorianMonthOfYear current.! !


!CreditCard methodsFor: 'accessing' stamp: 'G. B. 11/23/2020 22:43:24'!
owner
	^owner! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'G. B. 11/21/2020 20:27:29'!
withNumber: aCreditCardNumber expiration: aDate owner: anOwnerName 

	^self new initializeWithNumber: aCreditCardNumber expiration: aDate owner: anOwnerName. ! !


!classDefinition: #MerchantProcessor category: 'TusLibros'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'as yet unclassified' stamp: 'G. B. 11/24/2020 00:20:42'!
debit: price from: aCreditCard

	(aCreditCard owner = 'Hernan Wilkinson') ifTrue: [^ self error: self class invalidCreditCardErrorDescription].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: 'TusLibros'!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/23/2020 22:56:30'!
invalidCreditCardErrorDescription
	^'can not check out with an invalid credit card!!'.! !


!classDefinition: #TusLibrosCatalog category: 'TusLibros'!
Object subclass: #TusLibrosCatalog
	instanceVariableNames: 'books'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosCatalog methodsFor: 'initialization' stamp: 'G. B. 11/21/2020 20:45:45'!
initializeWith: aBookToAdd withPrice: aBookPrice 
	books := Dictionary new.
	books add: aBookToAdd -> aBookPrice.! !


!TusLibrosCatalog methodsFor: 'accessing' stamp: 'G. B. 11/21/2020 20:46:46'!
includes: aBook 
	^books includesKey: aBook.! !

!TusLibrosCatalog methodsFor: 'accessing' stamp: 'G. B. 11/21/2020 21:18:50'!
priceOf: aBook 
	^books at: aBook.! !


!TusLibrosCatalog methodsFor: 'adding' stamp: 'G. B. 11/21/2020 21:08:40'!
add: aBookToAdd withPrice: aBookPrice 
	books add: aBookToAdd -> aBookPrice.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosCatalog class' category: 'TusLibros'!
TusLibrosCatalog class
	instanceVariableNames: ''!

!TusLibrosCatalog class methodsFor: 'instance creation' stamp: 'G. B. 11/21/2020 20:43:24'!
with: aBookToAdd withPrice: aBookPrice 
	^self new initializeWith: aBookToAdd withPrice: aBookPrice. ! !
