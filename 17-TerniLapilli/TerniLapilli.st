!classDefinition: #TerniLapilliTest category: 'TerniLapilli'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 15:25:15'!
test01TheFirstMoveIsForPlayerX
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self assert:  terniLapili currentPlayer equals: #X 
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 15:36:54'!
test02shouldRaiseErrorIfPlayer0startsTheGame
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self 
	should: [ terniLapili putOAt: 0@0.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili shouldPlayPlayerXErrorDescription. ].
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 15:32:28'!
test03PlayerOPlayAfterPlayerX
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	
	self assert: terniLapili currentPlayer equals: #O. 
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 15:33:28'!
test04PlayerXPlayAfterPlayerO
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 0@1. 
	
	self assert: terniLapili currentPlayer equals: #X.
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 15:36:08'!
test05shouldRaiseErrorIfXplaysAfterX
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	
	self 
	should: [ terniLapili putXAt: 0@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili shouldPlayPlayerOErrorDescription. ].
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 15:39:43'!
test06shouldRaiseErrorIfOplaysAfterO
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 0@1.
	
	
	self 
	should: [ terniLapili putOAt: 1@1]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili shouldPlayPlayerXErrorDescription. ].
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 15:48:54'!
test07shouldSavePositionIfPlayerXPutAvalidPosition
	
	|terniLapili expectedPosition |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	expectedPosition := OrderedCollection with: 0@0. 	
	
	self assert: expectedPosition equals: terniLapili XPositions  ! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 16:02:40'!
test08shouldRaiseErrorIfPlayerXPutAnInvalidPosition
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self 
	should: [ terniLapili putXAt: 0@3.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersShouldChooseAValidPosition ].! !


!classDefinition: #TerniLapili category: 'TerniLapilli'!
Object subclass: #TerniLapili
	instanceVariableNames: 'currentPlayer XPositions OPositions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapili methodsFor: 'as yet unclassified' stamp: 'ERMC 10/31/2020 15:22:21'!
initialize
	
	currentPlayer := #X. 
	XPositions := OrderedCollection new.
	OPositions := OrderedCollection new. ! !

!TerniLapili methodsFor: 'as yet unclassified' stamp: 'ERMC 10/29/2020 19:05:11'!
isEmpty
	
	^ true.! !


!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:01:07'!
OPositions
	
	^ OPositions! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:00:56'!
XPositions

	^XPositions! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:25:35'!
currentPlayer

	^currentPlayer! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 16:01:47'!
isValidPosition: aPoint
	
	(aPoint x  > 2 or: aPoint y  > 2) ifTrue: [^ false].
	(aPoint x  < 0 or: aPoint y  < 0) ifTrue: [^ false].
	^ true! !


!TerniLapili methodsFor: 'moves' stamp: 'ERMC 10/31/2020 15:40:44'!
putOAt: aPoint 
	
	currentPlayer = #X ifTrue: [^ self error: self class shouldPlayPlayerXErrorDescription ].
	
	OPositions add: aPoint.
	currentPlayer := #X. ! !

!TerniLapili methodsFor: 'moves' stamp: 'ERMC 10/31/2020 15:59:28'!
putXAt: aPoint 
	
	currentPlayer = #O ifTrue: [^ self error: self class shouldPlayPlayerOErrorDescription ].
	(self isValidPosition: aPoint) ifFalse:[^ self error: self class playersShouldChooseAValidPosition ].
	
	XPositions add: aPoint .
	currentPlayer := #O. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapili class' category: 'TerniLapilli'!
TerniLapili class
	instanceVariableNames: ''!

!TerniLapili class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 15:54:21'!
playersShouldChooseAValidPosition
	
	^ 'Players only play in a valid position'! !

!TerniLapili class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 15:37:10'!
shouldPlayPlayerOErrorDescription
	
		^ 'playerO Should play Now'.! !

!TerniLapili class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 15:37:19'!
shouldPlayPlayerXErrorDescription
	
		^ 'playerX Should play Now'.! !
