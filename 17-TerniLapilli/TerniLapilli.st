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


!TerniLapilliTest methodsFor: 'game over tests' stamp: 'G. B. 10/31/2020 21:03:42'!
test13PlayerXWinsIfPlayerXMakesVertical0
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 0@1.
	terniLapili putOAt: 2@0.
	terniLapili putXAt: 0@2.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'G. B. 10/31/2020 21:04:58'!
test13PlayerXWinsIfPlayerXMakesVertical1
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 1@0.
	terniLapili putOAt: 2@1.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 2@0.
	terniLapili putXAt: 1@2.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'G. B. 10/31/2020 21:06:53'!
test13PlayerXWinsIfPlayerXMakesVertical2
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 0@0.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@1.
	terniLapili putXAt: 2@2.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !


!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'G. B. 10/31/2020 22:05:57'!
test15PlayerXCantMoveAPositionBeforeHaving3Positions
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	
		
	self 
	should: [terniLapili moveXFrom: 2@0 to: 2@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersCantMoveAPositionBeforeHaving3PositionsErrorDescription ].! !

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'G. B. 10/31/2020 22:19:48'!
test16PlayerXCanOnlyMoveAPositionToAnotherValidPosition
	
	|terniLapili expectedPosition |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@2.
	
	terniLapili moveXFrom: 0@0 to: 0@1. 
	
	expectedPosition := Set with: 2@0 with: 2@1 with: 0@1. 	
	
	self assert: expectedPosition equals: terniLapili XPositions.
	self assert: terniLapili currentPlayer equals: #O.! !


!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 10/31/2020 20:56:29'!
test07shouldSavePositionIfPlayerXPutAvalidPosition
	
	|terniLapili expectedPosition |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	expectedPosition := Set with: 0@0. 	
	
	self assert: expectedPosition equals: terniLapili XPositions  ! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 10/31/2020 20:18:55'!
test08shouldRaiseErrorIfPlayerXPutAnInvalidPosition
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self 
	should: [ terniLapili putXAt: 0@3]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersShouldChooseAValidPosition ].! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 10/31/2020 20:56:38'!
test09shouldSavePositionIfPlayerOPutsAValidPosition
	
	|terniLapili expectedPosition |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	
	expectedPosition := Set with: 1@2. 	
	terniLapili putOAt: 1@2.
	
	
	self assert: expectedPosition equals: terniLapili OPositions  ! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 10/31/2020 20:21:40'!
test10shouldRaiseErrorIfPlayerOPutsAnInvalidPosition
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@1.
	
	self 
	should: [ terniLapili putOAt: 3@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersShouldChooseAValidPosition ].! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 10/31/2020 20:29:27'!
test11shouldRaiseErrorIfPlayerXPlaysOccupiedPosition
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@1.
	terniLapili putOAt: 0@2.

	
	self 
	should: [ terniLapili putXAt: 0@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersShouldChooseAnEmptyPosition ].! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 10/31/2020 20:37:21'!
test12shouldRaiseErrorIfPlayerOPlaysOccupiedPosition
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@1.
	terniLapili putOAt: 0@2.
	terniLapili putXAt: 1@1.

	
	self 
	should: [ terniLapili putOAt: 0@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersShouldChooseAnEmptyPosition ].! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 10/31/2020 21:56:18'!
test13ShouldRaiseErrorIfPlayerXTriesToUseMoreThan3Positions
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@2.

	
	self 
	should: [ terniLapili putXAt: 1@0.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersCantUseMoreThan3PositionsErrorDescription ].! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 10/31/2020 21:58:07'!
test14ShouldRaiseErrorIfPlayerOTriesToUseMoreThan3Positions
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@2.
	" TO DO:
	
	hacer un move y despues que el O trate de poner y salte error"
	
	self 
	should: [ terniLapili putXAt: 1@0.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersCantUseMoreThan3PositionsErrorDescription ].! !


!classDefinition: #TerniLapili category: 'TerniLapilli'!
Object subclass: #TerniLapili
	instanceVariableNames: 'currentPlayer XPositions OPositions hasPlayerXWon isOver'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:01:07'!
OPositions
	
	^ OPositions! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:00:56'!
XPositions

	^XPositions! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:25:35'!
currentPlayer

	^currentPlayer! !

!TerniLapili methodsFor: 'accessing' stamp: 'G. B. 10/31/2020 20:59:47'!
hasPlayerXWon

	^hasPlayerXWon.! !

!TerniLapili methodsFor: 'accessing' stamp: 'G. B. 10/31/2020 20:35:58'!
isEmptyPosition: aPoint
	
	((XPositions includes: aPoint 	) or: (OPositions includes: aPoint)) ifTrue: [^ false].
	
	^ true! !

!TerniLapili methodsFor: 'accessing' stamp: 'G. B. 10/31/2020 20:59:31'!
isOver

	^isOver.! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 16:01:47'!
isValidPosition: aPoint
	
	(aPoint x  > 2 or: aPoint y  > 2) ifTrue: [^ false].
	(aPoint x  < 0 or: aPoint y  < 0) ifTrue: [^ false].
	^ true! !


!TerniLapili methodsFor: 'game over' stamp: 'G. B. 10/31/2020 21:07:41'!
checkWinner

	 """ver linea vertical """
	| verticalLine0 verticalLine1 verticalLine2 |
	verticalLine0 _ Set with: 0@0 with: 0@1 with: 0@2.
	XPositions = verticalLine0 ifTrue: [
		isOver _ true.
		hasPlayerXWon _ true.
		].
	
	
	verticalLine1 _ Set with: 1@0 with: 1@1 with: 1@2.
	XPositions = verticalLine1 ifTrue: [
		isOver _ true.
		hasPlayerXWon _ true.
		].
	
	verticalLine2 _ Set with: 2@0 with: 2@1 with: 2@2.
	XPositions = verticalLine2 ifTrue: [
		isOver _ true.
		hasPlayerXWon _ true.
		].! !


!TerniLapili methodsFor: 'moves' stamp: 'G. B. 10/31/2020 22:20:10'!
moveXFrom: aPosition to: aNextPosition

	XPositions size < 3 ifTrue: 	[^ self error: self class playersCantMoveAPositionBeforeHaving3PositionsErrorDescription].
	
	(self isValidPosition: aNextPosition) ifFalse:[^ self error: self class playersShouldChooseAValidPosition ].
	(self isEmptyPosition: aNextPosition) ifFalse:[^ self error: self class playersShouldChooseAnEmptyPosition].

	XPositions add: aNextPosition.
	XPositions remove: aPosition.
	
	
	currentPlayer := #O. ! !

!TerniLapili methodsFor: 'moves' stamp: 'G. B. 10/31/2020 20:37:40'!
putOAt: aPoint 
	
	currentPlayer = #X ifTrue: [^ self error: self class shouldPlayPlayerXErrorDescription ].
	
	(self isValidPosition: aPoint) ifFalse:[^ self error: self class playersShouldChooseAValidPosition ].
	(self isEmptyPosition: aPoint) ifFalse:[^ self error: self class playersShouldChooseAnEmptyPosition].

	OPositions add: aPoint.
	currentPlayer := #X. ! !

!TerniLapili methodsFor: 'moves' stamp: 'G. B. 10/31/2020 21:55:23'!
putXAt: aPoint 
	
	currentPlayer = #O ifTrue: [^ self error: self class shouldPlayPlayerOErrorDescription ].
	(self isValidPosition: aPoint) ifFalse:[^ self error: self class playersShouldChooseAValidPosition ].
	(self isEmptyPosition: aPoint) ifFalse:[^ self error: self class playersShouldChooseAnEmptyPosition].
	(XPositions size = 3) ifTrue: [^ self error: self class playersCantUseMoreThan3PositionsErrorDescription].
	
	
	XPositions add: aPoint .
	self checkWinner.
	currentPlayer := #O. ! !


!TerniLapili methodsFor: 'initialization' stamp: 'G. B. 10/31/2020 20:55:28'!
initialize
	
	currentPlayer := #X. 
	XPositions := Set new.
	OPositions := Set new. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapili class' category: 'TerniLapilli'!
TerniLapili class
	instanceVariableNames: ''!

!TerniLapili class methodsFor: 'errors' stamp: 'G. B. 10/31/2020 21:56:01'!
playersCantUseMoreThan3PositionsErrorDescription
	
	^ 'Players cant use more than 3 positions!!'! !

!TerniLapili class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 15:54:21'!
playersShouldChooseAValidPosition
	
	^ 'Players only play in a valid position'! !

!TerniLapili class methodsFor: 'errors' stamp: 'G. B. 10/31/2020 20:31:30'!
playersShouldChooseAnEmptyPosition
	
	^ 'Players should choose an empty position!!'! !

!TerniLapili class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 15:37:10'!
shouldPlayPlayerOErrorDescription
	
		^ 'playerO Should play Now'.! !

!TerniLapili class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 15:37:19'!
shouldPlayPlayerXErrorDescription
	
		^ 'playerX Should play Now'.! !


!TerniLapili class methodsFor: 'as yet unclassified' stamp: 'G. B. 10/31/2020 22:07:14'!
playersCantMoveAPositionBeforeHaving3PositionsErrorDescription
	^'Players cant move a position before having 3 positions'.! !
