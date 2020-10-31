!classDefinition: #TerniLapilliTest category: 'TerniLapilli'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 18:48:54'!
test01TheFirstMoveIsForPlayerX
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self assert:  terniLapili isPlayingX 
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

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 18:49:22'!
test03PlayerOPlayAfterPlayerX
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	
	self assert: terniLapili isPlayingO. 
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 18:49:38'!
test04PlayerXPlayAfterPlayerO
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 0@1. 
	
	self assert: terniLapili isPlayingX 
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


!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 10/31/2020 20:20:13'!
test20PlayerXWinsIfHeMakesVertical0
	
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

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 10/31/2020 20:20:38'!
test21PlayerXWinsIfHeMakesVertical1
	
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

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 10/31/2020 20:20:50'!
test22PlayerXWinsIfHeMakesVertical2
	
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

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 10/31/2020 20:05:00'!
test23PlayerOWinsIfHeMakesAnyVerticals
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 0@0.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@2.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 0@1.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerOWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 10/31/2020 20:21:01'!
test24PlayerXWinsIfHeMakesHorizontal0
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 1@0.
	terniLapili putOAt: 0@2.
	terniLapili putXAt: 2@0.

	
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

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 10/31/2020 18:51:18'!
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
	self assert: terniLapili isPlayingO! !

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 10/31/2020 18:55:48'!
test17shouldRaiseErrorIfPlayerXTriesToMoveAPositionThatIsNotHis
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@2.
	
	self 
	should: [terniLapili moveXFrom: 1@2 to: 2@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersCantMoveAPositionThatIsNotHis ].
	
! !

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 10/31/2020 19:23:01'!
test18PlayersCanOnlyMoveToADistance1Position

	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@2.
	
	self 
	should: [terniLapili moveXFrom: 0@0 to: 2@2.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersCanOnlyMoveToADistance1PositionErrorDescription].
	
! !

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 10/31/2020 19:49:38'!
test19RulesFromPlayerXApplyToPlayerO

	|terniLapili expectedPositions |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@2.
	
	terniLapili moveXFrom: 0@0 to: 0@1. 
	terniLapili moveOFrom: 1@2 to: 2@2.
	
	expectedPositions := Set with: 2@2 with: 1@1 with: 0@2. 	
	
	self assert: terniLapili isPlayingX.
	self assert: terniLapili OPositions equals: expectedPositions.
	
	

	
! !


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
	instanceVariableNames: 'currentPlayer XPositions OPositions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:01:07'!
OPositions
	
	^ OPositions! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:00:56'!
XPositions

	^XPositions! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 19:51:22'!
currentPlayer

	^currentPlayer
	
	"hacer refactor de currentPlayer a nextPlayer"! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 20:14:04'!
hasPlayerOWon

	^ self checkWinnerO .! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 20:13:54'!
hasPlayerXWon

	^ self checkWinnerX .! !

!TerniLapili methodsFor: 'accessing' stamp: 'G. B. 10/31/2020 20:35:58'!
isEmptyPosition: aPoint
	
	((XPositions includes: aPoint 	) or: (OPositions includes: aPoint)) ifTrue: [^ false].
	
	^ true! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 20:15:05'!
isOver

	^( self checkWinnerO)  or: (self checkWinnerX )! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 18:43:54'!
isPlayingO
	
	^ self isPlayingX not ! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 18:43:22'!
isPlayingX
	
	^ currentPlayer = #X! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 16:01:47'!
isValidPosition: aPoint
	
	(aPoint x  > 2 or: aPoint y  > 2) ifTrue: [^ false].
	(aPoint x  < 0 or: aPoint y  < 0) ifTrue: [^ false].
	^ true! !


!TerniLapili methodsFor: 'game over' stamp: 'ERMC 10/31/2020 20:34:44'!
checkWinnerO

	|winningPositions vertical0 vertical1 vertical2 horizontal0 horizontal1 horizontal2 |
	vertical0 _ Set with: 0@0 with: 0@1 with: 0@2.
	vertical1 _ Set with: 1@0 with: 1@1 with: 1@2.
	vertical2 _ Set with: 2@0 with: 2@1 with: 2@2.
	
	horizontal0 _ Set with: 0@0 with: 1@0 with: 2@0.
	horizontal1 _ Set with: 0@1 with: 1@1 with: 1@2.
	horizontal2 _ Set with: 0@2 with: 1@2 with: 2@2.
	
	winningPositions _ Set with: vertical0 with: vertical1 with: vertical2 with: horizontal0 with: horizontal1 with: horizontal2.
	
	^ winningPositions includes: OPositions 	
! !

!TerniLapili methodsFor: 'game over' stamp: 'ERMC 10/31/2020 20:34:20'!
checkWinnerX

	|winningPositions vertical0 vertical1 vertical2 horizontal0 horizontal1 horizontal2 |
	vertical0 _ Set with: 0@0 with: 0@1 with: 0@2.
	vertical1 _ Set with: 1@0 with: 1@1 with: 1@2.
	vertical2 _ Set with: 2@0 with: 2@1 with: 2@2.
	
	horizontal0 _ Set with: 0@0 with: 1@0 with: 2@0.
	horizontal1 _ Set with: 0@1 with: 1@1 with: 1@2.
	horizontal2 _ Set with: 0@2 with: 1@2 with: 2@2.
	
	winningPositions _ Set with: vertical0 with: vertical1 with: vertical2 with: horizontal0 with: horizontal1 with: horizontal2.
	
	^ winningPositions includes: XPositions 	

! !


!TerniLapili methodsFor: 'moves' stamp: 'ERMC 10/31/2020 19:32:02'!
isAdistanceOne: aPosition to: aNextPosition

	^ ((aPosition x - aNextPosition x) abs <= 1) and: ( (aPosition y - aNextPosition y) abs <= 1)! !

!TerniLapili methodsFor: 'moves' stamp: 'ERMC 10/31/2020 19:41:08'!
moveOFrom: aPosition to: aNextPosition

	OPositions size < 3 ifTrue: 	[^ self error: self class playersCantMoveAPositionBeforeHaving3PositionsErrorDescription].
	
	(self isValidPosition: aNextPosition) ifFalse:[^ self error: self class playersShouldChooseAValidPosition ].
	(OPositions includes: aPosition) ifFalse:[^ self error: self class playersCantMoveAPositionThatIsNotHis ].
	(self isEmptyPosition: aNextPosition) ifFalse:[^ self error: self class playersShouldChooseAnEmptyPosition].
	(self isAdistanceOne: aPosition to: aNextPosition) ifFalse:[^ self error: self class playersCanOnlyMoveToADistance1PositionErrorDescription ].
	
	
	OPositions add: aNextPosition.
	OPositions remove: aPosition.
	
	
	currentPlayer := #X. ! !

!TerniLapili methodsFor: 'moves' stamp: 'ERMC 10/31/2020 19:26:18'!
moveXFrom: aPosition to: aNextPosition

	XPositions size < 3 ifTrue: 	[^ self error: self class playersCantMoveAPositionBeforeHaving3PositionsErrorDescription].
	
	(self isValidPosition: aNextPosition) ifFalse:[^ self error: self class playersShouldChooseAValidPosition ].
	(XPositions includes: aPosition) ifFalse:[^ self error: self class playersCantMoveAPositionThatIsNotHis ].
	(self isEmptyPosition: aNextPosition) ifFalse:[^ self error: self class playersShouldChooseAnEmptyPosition].
	(self isAdistanceOne: aPosition to: aNextPosition) ifFalse:[^ self error: self class playersCanOnlyMoveToADistance1PositionErrorDescription ].
	
	
	XPositions add: aNextPosition.
	XPositions remove: aPosition.
	
	
	currentPlayer := #O. ! !

!TerniLapili methodsFor: 'moves' stamp: 'ERMC 10/31/2020 18:45:36'!
putOAt: aPoint 
	
	self isPlayingX ifTrue: [^ self error: self class shouldPlayPlayerXErrorDescription ].
	
	(self isValidPosition: aPoint) ifFalse:[^ self error: self class playersShouldChooseAValidPosition ].
	(self isEmptyPosition: aPoint) ifFalse:[^ self error: self class playersShouldChooseAnEmptyPosition].

	OPositions add: aPoint.
	currentPlayer := #X. ! !

!TerniLapili methodsFor: 'moves' stamp: 'ERMC 10/31/2020 20:15:51'!
putXAt: aPoint 
	
	self isPlayingO ifTrue: [^ self error: self class shouldPlayPlayerOErrorDescription ].
	(self isValidPosition: aPoint) ifFalse:[^ self error: self class playersShouldChooseAValidPosition ].
	(self isEmptyPosition: aPoint) ifFalse:[^ self error: self class playersShouldChooseAnEmptyPosition].
	(XPositions size = 3) ifTrue: [^ self error: self class playersCantUseMoreThan3PositionsErrorDescription].
	
	
	XPositions add: aPoint .
	self checkWinnerX.
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

!TerniLapili class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 19:24:15'!
playersCanOnlyMoveToADistance1PositionErrorDescription

		^ 'Players can only move to a distance 1 position'.! !

!TerniLapili class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 18:57:00'!
playersCantMoveAPositionThatIsNotHis
	
	^ ' Players can only move their own positions ' .! !

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
