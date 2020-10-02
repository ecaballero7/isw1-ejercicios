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


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'firstNode lastNode size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 22:41:48'!
initialize
	size := 0.
	firstNode := EmptyNode new.
	lastNode := EmptyNode new.! !

!OOStack methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 22:47:00'!
isEmpty
	^ firstNode == EmptyNode new.! !

!OOStack methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 22:44:57'!
pop
	|node|
	node := lastNode.
	(lastNode = EmptyNode new) ifTrue: [^self error: self class stackEmptyErrorDescription ].
	(lastNode = EmptyNode new) ifFalse: [size := size - 1].
	lastNode := lastNode previous.
	(lastNode = EmptyNode new) ifTrue: [firstNode := EmptyNode new].
	^ node value.! !

!OOStack methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 22:45:06'!
push: aString
	|node|
	size := size+1.
	node := Node with: aString previous: lastNode.
	(firstNode = EmptyNode new) ifTrue: [firstNode := node].
	"firstNode xxx: node."
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

!OOStack methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 22:18:47'!
value
	self subclassResponsibility.! !

!OOStack methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 22:35:23'!
xxx
	self subclassResponsibility.! !

!OOStack methodsFor: 'operations' stamp: 'G. I. B. 10/2/2020 22:35:34'!
xxx: aNode
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 10/1/2020 18:08:13'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!'! !


!classDefinition: #EmptyNode category: 'Stack-Exercise'!
OOStack subclass: #EmptyNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'G. I. B. 10/2/2020 22:43:18'!
initialize! !

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'G. I. B. 10/2/2020 22:43:44'!
value
	^OOStack error: OOStack stackEmptyErrorDescription.
! !

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'G. I. B. 10/2/2020 22:36:37'!
xxx: aNode
	firstNode := aNode.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyNode class' category: 'Stack-Exercise'!
EmptyNode class
	instanceVariableNames: ''!

!EmptyNode class methodsFor: 'as yet unclassified' stamp: 'G. I. B. 10/2/2020 22:18:27'!
value
	^OOStack error: OOStack stackEmptyErrorDescription.
! !


!classDefinition: #Node category: 'Stack-Exercise'!
OOStack subclass: #Node
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'as yet unclassified' stamp: 'G.I.B. 10/2/2020 21:08:34'!
initializeWith: aValue previous: aNode
	value := aValue.
	previous := aNode.
! !

!Node methodsFor: 'as yet unclassified' stamp: 'G.I.B. 10/2/2020 21:11:17'!
previous
	^previous.
! !

!Node methodsFor: 'as yet unclassified' stamp: 'G.I.B. 10/2/2020 21:22:06'!
value
	^value.
! !

!Node methodsFor: 'as yet unclassified' stamp: 'G. I. B. 10/2/2020 22:35:58'!
xxx: aNode! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'as yet unclassified' stamp: 'G.I.B. 10/2/2020 21:08:08'!
with: aValue previous: aNode
	^self new initializeWith: aValue previous: aNode.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
