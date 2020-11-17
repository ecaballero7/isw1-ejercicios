!classDefinition: #BooksCatalog category: 'TusLibros.com'!
TestCase subclass: #BooksCatalog
	instanceVariableNames: 'books'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!BooksCatalog methodsFor: 'as yet unclassified' stamp: 'ERMC 11/17/2020 19:07:39'!
books

	^ books! !

!BooksCatalog methodsFor: 'as yet unclassified' stamp: 'ERMC 11/17/2020 19:09:06'!
has: aBook

	^ books includes: aBook! !

!BooksCatalog methodsFor: 'as yet unclassified' stamp: 'ERMC 11/17/2020 19:13:37'!
initialize

	books := OrderedCollection with:'The Cells' with: 'Smaltalk 80' with: 'ISW1'.! !


!classDefinition: #CartTest category: 'TusLibros.com'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'ERMC 11/16/2020 19:23:11'!
test01CuandoSeCreaUnCarritoSeCreaVacio
	
	| cart catalog |
	catalog := BooksCatalog new. 
	cart := Cart with: catalog.
	
	self assert: (cart books) isEmpty ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ERMC 11/17/2020 19:11:24'!
test02CuandoSeAgregaUnLibroAlCarritoQuedaGuardado
	
	| cart aBook expectedBookList catalog |
	
	catalog := BooksCatalog new. 
	cart := Cart with: catalog.
	aBook := 'The Cells'.
	
	cart addBook: aBook. 
	
	expectedBookList := OrderedCollection with: 'The Cells'.
	
	self assert: expectedBookList equals: 	(cart books). ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ERMC 11/16/2020 19:39:01'!
test03NoSePuedeAgregarUnLibroAlCarritoQueNoEsteCatalogado
	
	| cart aBook catalog |
	
	catalog := BooksCatalog new.
	cart := Cart with: catalog.
	aBook := 'The Ring'.
	
	self
		should: [cart addBook: aBook]
		raise: Error 
		withExceptionDo: [ :anError |
		self assert: anError messageText = Cart canNotAddABookThatIsNotInTheCatalogErrorDescription ].
	
	! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ERMC 11/17/2020 19:39:08'!
test04NoSePuedeCrearUnCarritoSinUnCatalogo

	| cart aBook |
	
	cart _ Cart new.
	aBook := 'The Cells'.
		
	self
		should: [cart addBook: aBook.]
		raise: Error 
		withExceptionDo: [ :anError |
		self assert: anError messageText = Cart canNotCreateCartWithoutCatalogErrorDescription ].
	
	! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ERMC 11/17/2020 19:30:19'!
test05NoSePuedeCrearUnCarritoConUnCatalogoInvalido

	| catalog |
	
	catalog := OrderedCollection with: 'The Cells'.
	
	self
		should: [Cart with: catalog.]
		raise: Error 
		withExceptionDo: [ :anError |
		self assert: anError messageText = Cart canNotCreateCartWithAnInvalidCatalogErrorDescription ].
	
	! !


!classDefinition: #Cart category: 'TusLibros.com'!
Object subclass: #Cart
	instanceVariableNames: 'books booksCatalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cart methodsFor: 'accessing' stamp: 'ERMC 11/16/2020 19:12:20'!
books

	^books! !


!Cart methodsFor: 'as yet unclassified' stamp: 'ERMC 11/17/2020 19:41:14'!
addBook: aBook
	
	(booksCatalog isNil ) ifTrue: [^ self error: self class canNotCreateCartWithoutCatalogErrorDescription ].
	(booksCatalog has: aBook)	 ifFalse: [^self error: self class canNotAddABookThatIsNotInTheCatalogErrorDescription].
	books add: aBook! !


!Cart methodsFor: 'initialization' stamp: 'ERMC 11/17/2020 19:36:30'!
initializeWith: aBooksCatalog 
	
	(aBooksCatalog isKindOf: BooksCatalog ) ifFalse: [^ self error: self class canNotCreateCartWithAnInvalidCatalogErrorDescription ].
	booksCatalog := aBooksCatalog.
	books := OrderedCollection new. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros.com'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'ERMC 11/17/2020 19:03:32'!
canNotAddABookThatIsNotInTheCatalogErrorDescription
	
	^ 'can Not add a book that is not in the catalog '! !

!Cart class methodsFor: 'instance creation' stamp: 'ERMC 11/17/2020 19:26:25'!
canNotCreateCartWithAnInvalidCatalogErrorDescription
	
	^ 'can Not create a Cart with an invalid catalog '! !

!Cart class methodsFor: 'instance creation' stamp: 'ERMC 11/17/2020 19:21:49'!
canNotCreateCartWithoutCatalogErrorDescription
	
	^ 'can Not create a Cart without a catalog '! !

!Cart class methodsFor: 'instance creation' stamp: 'ERMC 11/17/2020 19:34:21'!
with: aBooksCatalog 

	^self new initializeWith: aBooksCatalog ! !
