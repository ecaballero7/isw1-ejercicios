!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ERMC 10/3/2020 18:47:22'!
test01CanNotFindWhenThereAreNoObjectsInTheSentenceFinder
"dado un prefijo se encarga de devolver todas las oraciones almacenadas en el Stack que contengan dicho prefijo.

Por ej. si el prefijo es 'Wint', y las oraciones en el Stack son 'winter is coming', 'winning is everything', 'The winds of Winter' y 'Winter is here' sólo debería devolver la última.

El prefijo es case sensitive, no puede ser vacío, ni contener espacios vacíos y el Stack al terminar la operación de búsqueda debe de mantener las mismas oraciones en idéntico orden.
" 
	|sentenceFinder  prefix|
	
	sentenceFinder := SentenceFinderByPrefix  new.
	prefix := 'a'.
	
	self
		should: [ sentenceFinder find: prefix]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix SentenceFinderEmptyErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ERMC 10/3/2020 19:46:33'!
test02FindsSentencesWhenExistsAprefix

	|sentenceFinder  prefix sentence solution |
	
	sentenceFinder := SentenceFinderByPrefix  new.
	prefix := 'a'.
	sentence:= 'awinter'.
	sentenceFinder addSentence: sentence. 
	solution := OrderedCollection new.
	solution add: 'awinter'.
		
	
	self assert: solution equals: (sentenceFinder find: prefix).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ERMC 10/3/2020 19:49:05'!
test03ReturnsEmptyCollectionWhenPrefixIsNotPresent

	|sentenceFinder  prefix sentence solution |
	
	sentenceFinder := SentenceFinderByPrefix  new.
	prefix := 'b'.
	sentence:= 'awinter'.
	sentenceFinder addSentence: sentence. 
	solution := OrderedCollection new.

	
	self assert: solution equals: (sentenceFinder find: prefix).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ERMC 10/3/2020 20:09:57'!
test04IfPrefixContainsSpaceRaiseErrorPrefixCanNotContainSpaces

	|sentenceFinder  prefix solution |
	
	sentenceFinder := SentenceFinderByPrefix  new.
	sentenceFinder addSentence: 'cualquiera'.
	
	prefix := 'a b'.
	
	self 
		should: [ sentenceFinder find: prefix]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix SentenceFinderErrorPrefixCanNotContainSpaces ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ERMC 10/3/2020 20:14:12'!
test05IfPrefixIsEmptyRaiseErrorPrefixCanNotBeEmpty

	|sentenceFinder  prefix |
	
	sentenceFinder := SentenceFinderByPrefix  new.
	sentenceFinder addSentence: 'cualquiera'.
	
	prefix := ''.
	
	self 
		should: [ sentenceFinder find: prefix]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix SentenceFinderErrorPrefixCanNotBeEmpty ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ERMC 10/3/2020 20:30:25'!
test06PrefixFinderIsCaseSensitive

	|sentenceFinder  prefix solution |
	
	sentenceFinder := SentenceFinderByPrefix  new.
	sentenceFinder addSentence: 'winter is coming'.
	sentenceFinder addSentence: 'winning is everything'.
	sentenceFinder addSentence: 'The winds of Winter'.
	sentenceFinder addSentence: 'Winter is here'.
	
	prefix := 'Wint'.
	solution:= OrderedCollection  new.
	solution add: 'Winter is here'.
	
	self  assert: solution equals: (sentenceFinder find: prefix).
		! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ERMC 10/3/2020 20:30:57'!
test07FindMoreThatOneSolutionInSentences

	|sentenceFinder  prefix solution |
	
	sentenceFinder := SentenceFinderByPrefix  new.
	sentenceFinder addSentence: 'winter is coming'.
	sentenceFinder addSentence: 'winning is everything'.
	sentenceFinder addSentence: 'The winds of Winter'.
	sentenceFinder addSentence: 'Winter is here'.
	
	prefix := 'win'.
	solution:= OrderedCollection  new.
	solution add: 'winter is coming'.
	solution add: 'winning is everything'. 
	
	self  assert: solution asSet equals: (sentenceFinder find: prefix) asSet .
		! !


!SentenceFinderByPrefixTest methodsFor: 'failing' stamp: 'ERMC 10/3/2020 20:13:22'!
signalFailure: aString 
	self shouldBeImplemented.! !


!classDefinition: #EmptyNode category: 'Stack-Exercise'!
Object subclass: #EmptyNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyNode methodsFor: 'initialization' stamp: 'G. I. B. 10/2/2020 22:43:18'!
initialize! !


!EmptyNode methodsFor: 'operations' stamp: 'ERMC 10/3/2020 17:55:51'!
canPop
	^OOStack error: OOStack stackEmptyErrorDescription.
! !

!EmptyNode methodsFor: 'operations' stamp: 'G. I. B 10/2/2020 23:48:31'!
previous
	^self.! !

!EmptyNode methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 22:43:44'!
value
	^OOStack error: OOStack stackEmptyErrorDescription.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyNode class' category: 'Stack-Exercise'!
EmptyNode class
	instanceVariableNames: ''!

!EmptyNode class methodsFor: 'as yet unclassified' stamp: 'G. I. B. 10/2/2020 22:18:27'!
value
	^OOStack error: OOStack stackEmptyErrorDescription.
! !


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'initialization' stamp: 'G.I.B. 10/2/2020 21:08:34'!
initializeWith: aValue previous: aNode
	value := aValue.
	previous := aNode.
! !


!Node methodsFor: 'operations' stamp: 'ERMC 10/3/2020 18:05:25'!
canPop
	
! !

!Node methodsFor: 'operations' stamp: 'G.I.B. 10/2/2020 21:11:17'!
previous
	^previous.
! !

!Node methodsFor: 'operations' stamp: 'G.I.B. 10/2/2020 21:22:06'!
value
	^value.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'as yet unclassified' stamp: 'G.I.B. 10/2/2020 21:08:08'!
with: aValue previous: aNode
	^self new initializeWith: aValue previous: aNode.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'lastNode size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations' stamp: 'G. I. B 10/2/2020 23:49:01'!
isEmpty
	^ size = 0.! !

!OOStack methodsFor: 'operations' stamp: 'ERMC 10/3/2020 18:05:41'!
pop
	|node|
	node := lastNode.
	"(lastNode = EmptyNode new) ifTrue: [^self error: self class stackEmptyErrorDescription ]."
	node canPop.
	size := size - 1.
	lastNode := lastNode previous.
	^ node value.! !

!OOStack methodsFor: 'operations' stamp: 'ERMC 10/3/2020 16:38:47'!
push: aString
	|node|
	size := size+1.
	node := Node with: aString previous: lastNode.
	"(firstNode = EmptyNode new) ifTrue: [firstNode := node]."
	"firstNode updateFirst: node."
	lastNode := node.
	! !

!OOStack methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 21:35:56'!
size
	^ size.! !

!OOStack methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 22:17:39'!
top
"	(lastNode = nil) ifTrue: [^self error: self class stackEmptyErrorDescription ].

	^ lastNode value.
"
	^lastNode value.! !


!OOStack methodsFor: 'initialization' stamp: 'ERMC 10/3/2020 16:37:13'!
initialize
	size := 0.
	lastNode := EmptyNode new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 10/1/2020 18:08:13'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'ERMC 10/3/2020 20:16:50'!
find: aPrefix
	
	| invertedStack sentencesWithPrefix currentTop  |
	
	(sentences isEmpty) ifTrue: [self error: self class SentenceFinderEmptyErrorDescription ].
	(aPrefix  includesSubString:  ' ' ) ifTrue:[self error: self class SentenceFinderErrorPrefixCanNotContainSpaces ].
	(aPrefix = '' ) ifTrue:[self error: self class SentenceFinderErrorPrefixCanNotBeEmpty ].
	
	invertedStack := OOStack new.
	sentencesWithPrefix := OrderedCollection new.
	
	[sentences isEmpty] whileFalse:
		[ currentTop:= sentences pop. 
			invertedStack push: currentTop value.
			((currentTop value) beginsWith: aPrefix) ifTrue: [ sentencesWithPrefix add: currentTop value] 
			].
	
	self reorderOriginalStack: invertedStack . 
	
	^ sentencesWithPrefix.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'ERMC 10/3/2020 18:40:30'!
initialize

	sentences := OOStack new.
		
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'ERMC 10/3/2020 20:19:12'!
reorderOriginalStack: invertedStack
	
	|currentTop |
	
	[invertedStack isEmpty] whileFalse:
		[ currentTop:= invertedStack pop. 
			sentences push: currentTop value].
	! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'ERMC 10/3/2020 18:53:36'!
addSentence: aString 
	
	sentences push: aString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'ERMC 10/3/2020 20:08:56'!
SentenceFinderEmptyErrorDescription
	
	^ 'Necesitas agregar al menos una oracion'.! !

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'ERMC 10/3/2020 20:13:52'!
SentenceFinderErrorPrefixCanNotBeEmpty
	
	^'El prefijo no puede ser vacio'.! !

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'ERMC 10/3/2020 20:09:16'!
SentenceFinderErrorPrefixCanNotContainSpaces
	
	^'El prefijo no puede contener espacios vacios'.! !
