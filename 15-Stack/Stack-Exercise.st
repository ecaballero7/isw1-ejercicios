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
	instanceVariableNames: 'emptySentence sentenceWithSpaces prefixA sentenceWithPrefixA sentenceWithPrefixB emptySolution solutionWithSentenceA solutionWithSentenceWithPrefixA prefixB sentenceFinderWithMoreThan1SentenceWithPrefixA solutionForsentenceFinderWithMoreThan1SentenceWithPrefixA solutionForSentenceFinderWithMoreThan1SentenceWithPrefixA prefixCapitalA'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'Empty SentenceFinder' stamp: 'G. B. 10/6/2020 02:41:38'!
test01CanNotFindInEmptySentenceFinder
self
		should: [ EmptySentenceFinder find: prefixA]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix SentenceFinderEmptyErrorDescription ].! !


!SentenceFinderByPrefixTest methodsFor: 'Prefix validation' stamp: 'G. B. 10/5/2020 23:13:32'!
test02IfPrefixIsEmptyRaiseErrorPrefixCanNotBeEmpty
	self 
		should: [ SentenceFinderWithSentenceWithPrefixA find: emptySentence ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix SentenceFinderErrorPrefixCanNotBeEmpty ].! !

!SentenceFinderByPrefixTest methodsFor: 'Prefix validation' stamp: 'G. B. 10/5/2020 23:16:36'!
test03IfPrefixContainsSpaceRaiseErrorPrefixCanNotContainSpaces
	self 
		should: [ SentenceFinderWithSentenceWithPrefixA find: sentenceWithSpaces]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix SentenceFinderErrorPrefixCanNotContainSpaces ].! !


!SentenceFinderByPrefixTest methodsFor: 'SentenceFinder with 1 sentence' stamp: 'G. B. 10/5/2020 23:19:38'!
test04ReturnsEmptyCollectionWhenPrefixIsNotPresentAndFinderHas1Sentence

	self assert: emptySolution equals: (SentenceFinderWithSentenceWithPrefixA find: sentenceWithPrefixB ).! !

!SentenceFinderByPrefixTest methodsFor: 'SentenceFinder with 1 sentence' stamp: 'G. B. 10/5/2020 23:24:51'!
test05FindsSentencesWhenExistsAprefixAndFinderHas1Sentence
	
	self assert: solutionWithSentenceWithPrefixA equals: (SentenceFinderWithSentenceWithPrefixA find: sentenceWithPrefixA).! !

!SentenceFinderByPrefixTest methodsFor: 'SentenceFinder with 1 sentence' stamp: 'G. B. 10/5/2020 23:38:39'!
test08FinderIsCaseSentitiveWhenFinderHas1SentenceAndThereIsNoMatch

	self  assert: emptySolution equals: (SentenceFinderWithSentenceWithPrefixA find: prefixCapitalA).
		! !

!SentenceFinderByPrefixTest methodsFor: 'SentenceFinder with 1 sentence' stamp: 'G. B. 10/5/2020 23:55:27'!
test09FinderIsCaseSentitiveWhenFinderHas1SentenceAndThereIsMatch
	
	self  assert: solutionWithSentenceWithPrefixA equals: (SentenceFinderWithSentenceWithPrefixA find: prefixA).
		! !


!SentenceFinderByPrefixTest methodsFor: 'SentenceFinder with more than 1 sentence' stamp: 'G. B. 10/5/2020 23:33:01'!
test06ReturnsEmptyCollectionWhenFinderHasMoreThan1SentenceAndThereIsNoMatch

	self  assert: emptySolution equals: (sentenceFinderWithMoreThan1SentenceWithPrefixA find: prefixB).
		! !

!SentenceFinderByPrefixTest methodsFor: 'SentenceFinder with more than 1 sentence' stamp: 'G. B. 10/5/2020 23:35:54'!
test07FindMoreThatOneSentenceWhenFinderHasMoreThan1SentenceAndThereAreMatches

	self  assert: solutionForSentenceFinderWithMoreThan1SentenceWithPrefixA asSet equals: (sentenceFinderWithMoreThan1SentenceWithPrefixA find: prefixA) asSet .
		! !

!SentenceFinderByPrefixTest methodsFor: 'SentenceFinder with more than 1 sentence' stamp: 'G. B. 10/6/2020 02:45:21'!
test10FinderIsCaseSentitiveWhenFinderHasMoreThan1SentenceAndThereIsNoMatch
	self  assert: emptySolution equals: (sentenceFinderWithMoreThan1SentenceWithPrefixA find: prefixB).
! !


!SentenceFinderByPrefixTest methodsFor: 'Set up' stamp: 'G. B. 10/5/2020 23:37:56'!
setUp
	emptySentence := ''.
	sentenceWithSpaces := 'a b'.
	prefixA := 'a'.
	prefixB := 'b'.
	prefixCapitalA := 'A'.
	sentenceWithPrefixA := 'awinter'.
	sentenceWithPrefixB := 'bwinter'.
	
	
	EmptySentenceFinder := SentenceFinderByPrefix  new.
	SentenceFinderWithSentenceWithPrefixA := SentenceFinderByPrefix  new.
	SentenceFinderWithSentenceWithPrefixA addSentence: sentenceWithPrefixA.
	
	
	sentenceFinderWithMoreThan1SentenceWithPrefixA := SentenceFinderByPrefix  new.
	sentenceFinderWithMoreThan1SentenceWithPrefixA addSentence: sentenceWithPrefixA.
	sentenceFinderWithMoreThan1SentenceWithPrefixA addSentence: 'awinning is everything'.
	sentenceFinderWithMoreThan1SentenceWithPrefixA addSentence: 'AThe winds of Winter'.
	sentenceFinderWithMoreThan1SentenceWithPrefixA addSentence: 'awinter is here'.
	
	solutionForSentenceFinderWithMoreThan1SentenceWithPrefixA := OrderedCollection with: sentenceWithPrefixA with: 'awinning is everything' with: 'awinter is here'.
	
	
	
	emptySolution := OrderedCollection new.
	solutionWithSentenceWithPrefixA := OrderedCollection with: sentenceWithPrefixA.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefixTest class' category: 'Stack-Exercise'!
SentenceFinderByPrefixTest class
	instanceVariableNames: 'prefixA'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'lastNode size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations' stamp: 'G. B. 10/6/2020 02:29:16'!
ifEmpty: aBlock
	lastNode ifEmpty: aBlock.! !

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

!OOStack methodsFor: 'operations' stamp: 'G. B. 10/6/2020 02:37:16'!
push: aString
	|node|
	size := size+1.
	node := StackElement with: aString previous: lastNode.
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


!OOStack methodsFor: 'initialization' stamp: 'G. B. 10/6/2020 02:32:33'!
initialize
	size := 0.
	lastNode := StackBase new.! !

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

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'ERMC 10/3/2020 18:53:36'!
addSentence: aString 
	
	sentences push: aString.! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'G. B. 10/6/2020 02:28:05'!
find: aPrefix
	
	| invertedStack sentencesWithPrefix  |
	
	sentences ifEmpty: [self error: self class SentenceFinderEmptyErrorDescription ].
	
	self validatePrefix: aPrefix.

	invertedStack := OOStack new.

	sentencesWithPrefix := self findSentencesWithPrefix: aPrefix using: invertedStack.
		
	self reorderOriginalStack: invertedStack . 
	
	^ sentencesWithPrefix.! !


!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'G. B. 10/5/2020 22:37:18'!
findSentencesWithPrefix: aPrefix using: aStack

	| sentencesWithPrefix |
	sentencesWithPrefix := OrderedCollection new.
	
	[sentences isEmpty] whileFalse:
		[ | currentTop | currentTop:= sentences pop. 
			aStack push: currentTop value.
			((currentTop value) beginsWith: aPrefix) ifTrue: [ sentencesWithPrefix add: currentTop value] 
		].
		
	^sentencesWithPrefix.! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'ERMC 10/3/2020 20:19:12'!
reorderOriginalStack: invertedStack
	
	|currentTop |
	
	[invertedStack isEmpty] whileFalse:
		[ currentTop:= invertedStack pop. 
			sentences push: currentTop value].
	! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'G. B. 10/6/2020 01:45:28'!
validatePrefix: aPrefix

	(aPrefix  includesSubString:  ' ' ) ifTrue:[self error: self class SentenceFinderErrorPrefixCanNotContainSpaces ].
	(aPrefix = '' ) ifTrue:[self error: self class SentenceFinderErrorPrefixCanNotBeEmpty ].
	! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'ERMC 10/3/2020 18:40:30'!
initialize

	sentences := OOStack new.
		
	! !

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


!classDefinition: #StackComponents category: 'Stack-Exercise'!
Object subclass: #StackComponents
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackComponents methodsFor: 'as yet unclassified' stamp: 'G. B. 10/5/2020 22:53:04'!
canPop
	^self subclassResponsibility.! !

!StackComponents methodsFor: 'as yet unclassified' stamp: 'G. B. 10/5/2020 22:53:23'!
previous
	^self subclassResponsibility.! !

!StackComponents methodsFor: 'as yet unclassified' stamp: 'G. B. 10/5/2020 22:53:27'!
value
	^self subclassResponsibility.! !


!classDefinition: #StackBase category: 'Stack-Exercise'!
StackComponents subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!StackBase methodsFor: 'operations' stamp: 'ERMC 10/3/2020 17:55:51'!
canPop
	^OOStack error: OOStack stackEmptyErrorDescription.
! !

!StackBase methodsFor: 'operations' stamp: 'G. B. 10/6/2020 02:24:37'!
ifEmpty: aBlock
	^aBlock value.! !

!StackBase methodsFor: 'operations' stamp: 'G. I. B 10/2/2020 23:48:31'!
previous
	^self.! !

!StackBase methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 22:43:44'!
value
	^OOStack error: OOStack stackEmptyErrorDescription.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackBase class' category: 'Stack-Exercise'!
StackBase class
	instanceVariableNames: ''!

!StackBase class methodsFor: 'as yet unclassified' stamp: 'G. I. B. 10/2/2020 22:18:27'!
value
	^OOStack error: OOStack stackEmptyErrorDescription.
! !


!classDefinition: #StackElement category: 'Stack-Exercise'!
StackComponents subclass: #StackElement
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'initialization' stamp: 'G.I.B. 10/2/2020 21:08:34'!
initializeWith: aValue previous: aNode
	value := aValue.
	previous := aNode.
! !


!StackElement methodsFor: 'operations' stamp: 'ERMC 10/3/2020 18:05:25'!
canPop
	
! !

!StackElement methodsFor: 'operations' stamp: 'G. B. 10/6/2020 02:18:59'!
ifEmpty: aBlock
! !

!StackElement methodsFor: 'operations' stamp: 'G.I.B. 10/2/2020 21:11:17'!
previous
	^previous.
! !

!StackElement methodsFor: 'operations' stamp: 'G.I.B. 10/2/2020 21:22:06'!
value
	^value.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElement class' category: 'Stack-Exercise'!
StackElement class
	instanceVariableNames: ''!

!StackElement class methodsFor: 'as yet unclassified' stamp: 'G.I.B. 10/2/2020 21:08:08'!
with: aValue previous: aNode
	^self new initializeWith: aValue previous: aNode.! !
