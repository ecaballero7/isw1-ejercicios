!classDefinition: #TerniLapilliTest category: 'TerniLapilli'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 11/1/2020 13:42:31'!
test00TheGameStartWithThePlayersWithoutPosition
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self assert:  terniLapili XPositions isEmpty .
	self assert: terniLapili OPositions isEmpty.
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 10/31/2020 18:48:54'!
test01TheFirstMoveIsForPlayerX
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self assert:  terniLapili isPlayingX 
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'G. B. 11/1/2020 18:57:58'!
test02shouldRaiseErrorIfPlayerOstartsTheGame
	
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

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'G. B. 11/1/2020 20:08:27'!
test24PlayerXWinsIfHeMakesHorizontal1
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@1.
	terniLapili putOAt: 2@2.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 0@2.
	terniLapili putXAt: 2@1.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'G. B. 11/1/2020 20:10:02'!
test24PlayerXWinsIfHeMakesHorizontal2
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@2.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 1@2.
	terniLapili putOAt: 0@1.
	terniLapili putXAt: 2@2.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 12:00:16'!
test25PlayerXWinsIfHeMakesDiagonal0
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@0.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 0@2.
	terniLapili putXAt: 2@2.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 12:00:07'!
test26PlayerXWinsIfHeMakesDiagonal1
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@2.
	terniLapili putOAt: 1@0.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 2@2.
	terniLapili putXAt: 2@0.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'G. B. 11/1/2020 18:49:33'!
testxxWhenTheGameIsOverNoOneCanMove
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 1@0.
	terniLapili putXAt: 2@2.
	
	
	self 
	should: [terniLapili putOAt: 0@2.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili theGameIsOverErrorDescription].! !


!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'G. B. 11/1/2020 20:07:11'!
test15shouldRaiseErrorIfAPlayerXTriesToMoveAPositionBeforeHaving3Positions
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	
		
	self 
	should: [terniLapili moveXFrom: 2@0 to: 2@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersCantMoveAPositionBeforeHaving3PositionsErrorDescription ].! !

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'G. B. 11/1/2020 19:17:30'!
test16PlayerXCanOnlyMoveAPositionToAnEmptyPositionAndInsideTheBoard
	
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

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'G. B. 11/2/2020 01:46:15'!
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
	should: [terniLapili moveXFrom: 1@2 to: 0@1.]
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

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 11/1/2020 12:06:17'!
testxxPlayersCanOnlyMoveInTheirTurn

	|terniLapili expectedPositions |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@2.
	
	terniLapili moveXFrom: 0@0 to: 0@1. 
	
	self 
	should: [terniLapili moveXFrom: 0@1 to: 0@0. ]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili shouldPlayPlayerOErrorDescription ].

	

	
! !

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 11/1/2020 13:30:39'!
testyyPositionIsEmptyAfterAMove

	|terniLapili  |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@2.
	
	terniLapili moveXFrom: 0@0 to: 0@1. 
	
	self deny: (terniLapili XPositions includes: (0@0)).
	self deny: (terniLapili OPositions  includes: (0@0))


	

	
! !


!TerniLapilliTest methodsFor: 'board limits tests' stamp: 'G. B. 11/1/2020 19:09:58'!
testxxshouldRaiseErrorIfPlayerOGoesBeyondABoardLimit
	
	|terniLapili |

	terniLapili := TerniLapili new.
	terniLapili putXAt: 0@1.

	
	self 
	should: [ terniLapili putOAt: 3@1]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersShouldChooseAValidPosition ].! !

!TerniLapilliTest methodsFor: 'board limits tests' stamp: 'G. B. 11/1/2020 19:05:16'!
testxxshouldRaiseErrorIfPlayerXGoesBelowFloor
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self 
	should: [ terniLapili putXAt: 1@-2]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersShouldChooseAValidPosition ].! !

!TerniLapilliTest methodsFor: 'board limits tests' stamp: 'G. B. 11/1/2020 19:07:44'!
testxxshouldRaiseErrorIfPlayerXGoesBeyondLeftWall
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self 
	should: [ terniLapili putXAt: -1@1]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersShouldChooseAValidPosition ].! !

!TerniLapilliTest methodsFor: 'board limits tests' stamp: 'G. B. 11/1/2020 19:08:11'!
testxxshouldRaiseErrorIfPlayerXGoesBeyondRightWall
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self 
	should: [ terniLapili putXAt: 3@1]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersShouldChooseAValidPosition ].! !

!TerniLapilliTest methodsFor: 'board limits tests' stamp: 'G. B. 11/1/2020 19:06:33'!
testxxshouldRaiseErrorIfPlayerXGoesBeyondRoof
	
	|terniLapili |

	terniLapili := TerniLapili new.
	
	self 
	should: [ terniLapili putXAt: 1@3]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapili playersShouldChooseAValidPosition ].! !


!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 10/31/2020 20:56:29'!
test07shouldSavePositionIfPlayerXPutAvalidPosition
	
	|terniLapili expectedPosition |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	expectedPosition := Set with: 0@0. 	
	
	self assert: expectedPosition equals: terniLapili XPositions  ! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 10/31/2020 20:56:38'!
test09shouldSavePositionIfPlayerOPutsAValidPosition
	
	|terniLapili expectedPosition |

	terniLapili := TerniLapili new.
	
	terniLapili putXAt: 0@0.
	
	expectedPosition := Set with: 1@2. 	
	terniLapili putOAt: 1@2.
	
	
	self assert: expectedPosition equals: terniLapili OPositions  ! !

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
	instanceVariableNames: 'XPositions OPositions currentState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:01:07'!
OPositions
	
	^ OPositions! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:00:56'!
XPositions

	^XPositions! !

!TerniLapili methodsFor: 'accessing' stamp: 'G. B. 11/1/2020 18:53:27'!
currentPlayer

	^currentState player.! !

!TerniLapili methodsFor: 'accessing' stamp: 'G. B. 11/2/2020 01:20:20'!
hasPlayerOWon

	^ self checkWinner: OPositions .! !

!TerniLapili methodsFor: 'accessing' stamp: 'G. B. 11/2/2020 01:12:59'!
hasPlayerXWon

	^ self checkWinner: XPositions .! !

!TerniLapili methodsFor: 'accessing' stamp: 'G. B. 11/2/2020 01:04:51'!
isOver

	^ self hasPlayerXWon or: [self hasPlayerOWon].! !

!TerniLapili methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 18:43:54'!
isPlayingO
	
	^ self isPlayingX not ! !

!TerniLapili methodsFor: 'accessing' stamp: 'G. B. 11/2/2020 01:41:02'!
isPlayingX
	
	^ currentState currentPlayer = #X! !

!TerniLapili methodsFor: 'accessing' stamp: 'G. B. 11/2/2020 01:56:55'!
isValidPosition: aPoint
	

	(aPoint x  > 2 or: aPoint y  > 2) ifTrue: [^ self error: self class playersShouldChooseAValidPosition].
	(aPoint x  < 0 or: aPoint y  < 0) ifTrue: [^ self error: self class playersShouldChooseAValidPosition].
	
	((XPositions includes: aPoint 	) or: [OPositions includes: aPoint]) ifTrue: [^ self error: self class playersShouldChooseAnEmptyPosition].
! !


!TerniLapili methodsFor: 'game over' stamp: 'G. B. 11/2/2020 01:11:05'!
checkWinner: aPositionCollection

	|winningPositions vertical0 vertical1 vertical2 horizontal0 horizontal1 horizontal2 diagonal0 diagonal1 |
	vertical0 _ Set with: 0@0 with: 0@1 with: 0@2.
	vertical1 _ Set with: 1@0 with: 1@1 with: 1@2.
	vertical2 _ Set with: 2@0 with: 2@1 with: 2@2.
	
	horizontal0 _ Set with: 0@0 with: 1@0 with: 2@0.
	horizontal1 _ Set with: 0@1 with: 1@1 with: 2@1.
	horizontal2 _ Set with: 0@2 with: 1@2 with: 2@2.
	
	diagonal0 _ Set with: 	0@0 with: 1@1 with: 2@2.
	diagonal1 _ Set with: 	0@2 with: 1@1 with: 2@0.
	
	winningPositions _ Set with: vertical0 with: vertical1 with: vertical2 with: horizontal0 with: horizontal1 with: horizontal2.
	winningPositions  add: diagonal0 .
	winningPositions  add: diagonal1 .	
	

	^winningPositions includes: aPositionCollection .

! !


!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:43:29'!
MovingOMoveOFrom: aPosition to: aNextPosition

	(OPositions includes: aPosition) ifFalse:[^ self error: self class playersCantMoveAPositionThatIsNotHis ].	
	OPositions add: aNextPosition.
	OPositions remove: aPosition.
	
	currentState _ TerniLapiliState corresponding: self.
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:36:43'!
MovingOMoveXFrom: aPosition to: aNextPosition
	^ self error: self class shouldPlayPlayerOErrorDescription.

	
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:53:40'!
MovingOPutOAt: aPoint
	^self error: self class playersCantUseMoreThan3PositionsErrorDescription.
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:54:37'!
MovingOPutXAt: aPosition
	^ self error: self class shouldPlayPlayerOErrorDescription.

	
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:36:33'!
MovingXMoveOFrom: aPosition to: aNextPosition
	^ self error: self class shouldPlayPlayerXErrorDescription.

	
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:43:41'!
MovingXMoveXFrom: aPosition to: aNextPosition
	
	(XPositions includes: aPosition) ifFalse:[^ self error: self class playersCantMoveAPositionThatIsNotHis ].	
	XPositions add: aNextPosition.
	XPositions remove: aPosition.
	
	currentState _ TerniLapiliState corresponding: self.
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:53:01'!
MovingXPutOAt: aPosition
	^ self error: self class shouldPlayPlayerXErrorDescription.

	
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:19:14'!
MovingXPutXAt: aPoint
	^self error: self class playersCantUseMoreThan3PositionsErrorDescription.
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:34:42'!
PlayingOMoveOFrom: aPosition to: aNextPosition
	^ self error: self class playersCantMoveAPositionBeforeHaving3PositionsErrorDescription.

	
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:35:31'!
PlayingOMoveXFrom: aPosition to: aNextPosition
	^ self error: self class shouldPlayPlayerOErrorDescription .

	
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:15:14'!
PlayingOPutOAt: aPoint
	
	(OPositions size = 3) ifTrue: [^ self error: self class playersCantUseMoreThan3PositionsErrorDescription].

	OPositions add: aPoint.
	currentState _ TerniLapiliState corresponding: self.
	

! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/1/2020 22:51:48'!
PlayingOPutXAt: aPoint
	^ self error: self class shouldPlayPlayerOErrorDescription.! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:36:10'!
PlayingXMoveOFrom: aPosition to: aNextPosition
	^ self error: self class shouldPlayPlayerXErrorDescription.

	
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:34:19'!
PlayingXMoveXFrom: aPosition to: aNextPosition
	^ self error: self class playersCantMoveAPositionBeforeHaving3PositionsErrorDescription.

	
! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/1/2020 22:20:14'!
PlayingXPutOAt: aPoint
	^ self error: self class shouldPlayPlayerXErrorDescription.! !

!TerniLapili methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:15:21'!
PlayingXPutXAt: aPoint
	
	(XPositions size = 3) ifTrue: [^ self error: self class playersCantUseMoreThan3PositionsErrorDescription].

	XPositions add: aPoint.
	currentState _ TerniLapiliState corresponding: self.

! !


!TerniLapili methodsFor: 'moves' stamp: 'G. B. 11/2/2020 01:57:36'!
isAdistanceOne: aPosition to: aNextPosition

	^ ((aPosition x - aNextPosition x) abs <= 1) and: [ (aPosition y - aNextPosition y) abs <= 1].! !

!TerniLapili methodsFor: 'moves' stamp: 'G. B. 11/2/2020 01:49:18'!
moveOFrom: aPosition to: aNextPosition

	self isValidPosition: aNextPosition.
	(self isAdistanceOne: aPosition to: aNextPosition) ifFalse:[^ self error: self class playersCanOnlyMoveToADistance1PositionErrorDescription ].


	currentState moveOFrom: aPosition to: aNextPosition.
	
! !

!TerniLapili methodsFor: 'moves' stamp: 'G. B. 11/2/2020 01:49:14'!
moveXFrom: aPosition to: aNextPosition

	self isValidPosition: aNextPosition.
	(self isAdistanceOne: aPosition to: aNextPosition) ifFalse:[^ self error: self class playersCanOnlyMoveToADistance1PositionErrorDescription ].


	currentState moveXFrom: aPosition to: aNextPosition.

! !

!TerniLapili methodsFor: 'moves' stamp: 'G. B. 11/2/2020 01:22:17'!
putOAt: aPoint 

	self isValidPosition: aPoint.

	currentState putOAt: aPoint.

! !

!TerniLapili methodsFor: 'moves' stamp: 'G. B. 11/2/2020 01:22:12'!
putXAt: aPoint 
	
	self isValidPosition: aPoint.

	currentState putXAt: aPoint.


! !


!TerniLapili methodsFor: 'initialization' stamp: 'G. B. 11/1/2020 21:03:21'!
initialize
	
	XPositions := Set new.
	OPositions := Set new.
	currentState _ TerniLaPiliPlayingX with: self.! !

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

!TerniLapili class methodsFor: 'errors' stamp: 'ERMC 11/1/2020 13:34:14'!
theGameIsOverErrorDescription
	
	^ 'The Game is Over!!'! !


!TerniLapili class methodsFor: 'as yet unclassified' stamp: 'G. B. 10/31/2020 22:07:14'!
playersCantMoveAPositionBeforeHaving3PositionsErrorDescription
	^'Players cant move a position before having 3 positions'.! !


!classDefinition: #TerniLapiliState category: 'TerniLapilli'!
Object subclass: #TerniLapiliState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapiliState class' category: 'TerniLapilli'!
TerniLapiliState class
	instanceVariableNames: ''!

!TerniLapiliState class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 00:58:20'!
corresponding: aGame

	| class |
	class _ self allSubclasses detect: [:aClass | aClass correspondsTo: aGame].
	^class new initializeWith: aGame.! !


!classDefinition: #TerniLaPiliGameOver category: 'TerniLapilli'!
TerniLapiliState subclass: #TerniLaPiliGameOver
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLaPiliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:28:06'!
checkGameOver
	^ self error: TerniLapili theGameIsOverErrorDescription.! !

!TerniLaPiliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:41:55'!
currentPlayer
	^ self error: TerniLapili theGameIsOverErrorDescription.! !

!TerniLaPiliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:27:56'!
initializeWith: aGame
	game _ aGame.! !

!TerniLaPiliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:41:12'!
isOver
	^ true.! !

!TerniLaPiliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:29:40'!
moveOFrom: aPosition to: aNextPosition.
	^game error: game class theGameIsOverErrorDescription 		.! !

!TerniLaPiliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:29:37'!
moveXFrom: aPosition to: aNextPosition.
	^game error: game class theGameIsOverErrorDescription 		.! !

!TerniLaPiliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:22:24'!
putOAt: aPoint
	^ self error: TerniLapili theGameIsOverErrorDescription.! !

!TerniLaPiliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:22:31'!
putXAt: aPoint
	^ self error: TerniLapili theGameIsOverErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLaPiliGameOver class' category: 'TerniLapilli'!
TerniLaPiliGameOver class
	instanceVariableNames: ''!

!TerniLaPiliGameOver class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:01:21'!
correspondsTo: aGame
	^aGame hasPlayerXWon or: [aGame hasPlayerOWon].! !

!TerniLaPiliGameOver class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:04:12'!
with: aGame
	^self new initializeWith: aGame.! !


!classDefinition: #TerniLaPiliMovingO category: 'TerniLapilli'!
TerniLapiliState subclass: #TerniLaPiliMovingO
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLaPiliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:41:26'!
currentPlayer
	^#O.! !

!TerniLaPiliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:02:55'!
initializeWith: aGame
	game _ aGame.! !

!TerniLaPiliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 20:16:33'!
isMovingO
	^true.! !

!TerniLaPiliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:31:28'!
moveOFrom: aPosition to: aNextPosition.
	game MovingOMoveOFrom: aPosition to: aNextPosition.! !

!TerniLaPiliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:31:14'!
moveXFrom: aPosition to: aNextPosition.
	game MovingOMoveXFrom: aPosition to: aNextPosition.! !

!TerniLaPiliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:50:16'!
putOAt: aPoint.
	^game MovingOPutOAt: aPoint.! !

!TerniLaPiliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:50:23'!
putXAt: aPoint.
	^game MovingOPutXAt: aPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLaPiliMovingO class' category: 'TerniLapilli'!
TerniLaPiliMovingO class
	instanceVariableNames: ''!

!TerniLaPiliMovingO class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:06:16'!
correspondsTo: aGame
	^aGame isPlayingX  and: [aGame isOver not] and: [aGame OPositions size = 3] .! !

!TerniLaPiliMovingO class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:04:04'!
with: aGame
	^self new initializeWith: aGame.! !


!classDefinition: #TerniLaPiliMovingX category: 'TerniLapilli'!
TerniLapiliState subclass: #TerniLaPiliMovingX
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLaPiliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:41:32'!
currentPlayer
	^#X.! !

!TerniLaPiliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:02:51'!
initializeWith: aGame
	game _ aGame.! !

!TerniLaPiliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 20:19:09'!
isMovingO
	^self error: TerniLapili shouldPlayPlayerXErrorDescription.! !

!TerniLaPiliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:32:06'!
moveOFrom: aPosition to: aNextPosition.
	game MovingXMoveOFrom: aPosition to: aNextPosition.! !

!TerniLaPiliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:31:57'!
moveXFrom: aPosition to: aNextPosition.
	game MovingXMoveXFrom: aPosition to: aNextPosition.! !

!TerniLaPiliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:49:49'!
putOAt: aPoint.
	^game MovingXPutOAt: aPoint.! !

!TerniLaPiliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:49:59'!
putXAt: aPoint.
	^game MovingXPutXAt: aPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLaPiliMovingX class' category: 'TerniLapilli'!
TerniLaPiliMovingX class
	instanceVariableNames: ''!

!TerniLaPiliMovingX class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:06:37'!
correspondsTo: aGame
	^aGame isPlayingO  and: [aGame isOver not] and: [aGame XPositions size = 3] .! !

!TerniLaPiliMovingX class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:03:59'!
with: aGame
	^self new initializeWith: aGame.! !


!classDefinition: #TerniLaPiliPlayingO category: 'TerniLapilli'!
TerniLapiliState subclass: #TerniLaPiliPlayingO
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLaPiliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:28:58'!
checkGameOver
	! !

!TerniLaPiliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:41:39'!
currentPlayer
	^#O.! !

!TerniLaPiliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:02:45'!
initializeWith: aGame
	game _ aGame.! !

!TerniLaPiliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 20:18:11'!
isMovingO
	^self error: TerniLapili  playersCantMoveAPositionBeforeHaving3PositionsErrorDescription! !

!TerniLaPiliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:41:38'!
isOver
	^false.
	! !

!TerniLaPiliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:32:34'!
moveOFrom: aPosition to: aNextPosition.
	game PlayingOMoveOFrom: aPosition to: aNextPosition.! !

!TerniLaPiliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:32:25'!
moveXFrom: aPosition to: aNextPosition.
	game PlayingOMoveXFrom: aPosition to: aNextPosition.! !

!TerniLaPiliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:09:39'!
player
	^#O.! !

!TerniLaPiliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:00:49'!
putOAt: aPoint.
	^game PlayingOPutOAt: aPoint.! !

!TerniLaPiliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:49:24'!
putXAt: aPoint.
	^game PlayingOPutXAt: aPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLaPiliPlayingO class' category: 'TerniLapilli'!
TerniLaPiliPlayingO class
	instanceVariableNames: ''!

!TerniLaPiliPlayingO class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:06:58'!
correspondsTo: aGame
	^aGame isPlayingX  and: [aGame isOver not] and: [aGame OPositions size < 3] .! !

!TerniLaPiliPlayingO class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:03:55'!
with: aGame
	^self new initializeWith: aGame.! !


!classDefinition: #TerniLaPiliPlayingX category: 'TerniLapilli'!
TerniLapiliState subclass: #TerniLaPiliPlayingX
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLaPiliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:29:15'!
checkGameOver
! !

!TerniLaPiliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:41:44'!
currentPlayer
	^#X.! !

!TerniLaPiliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:02:35'!
initializeWith: aGame
	game _ aGame.! !

!TerniLaPiliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 20:18:51'!
isMovingO
	^self error: TerniLapili shouldPlayPlayerXErrorDescription.! !

!TerniLaPiliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:41:32'!
isOver
	^false.
! !

!TerniLaPiliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:32:53'!
moveOFrom: aPosition to: aNextPosition.
	game PlayingXMoveOFrom: aPosition to: aNextPosition.! !

!TerniLaPiliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:33:02'!
moveXFrom: aPosition to: aNextPosition.
	game PlayingXMoveXFrom: aPosition to: aNextPosition.! !

!TerniLaPiliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:09:29'!
player
	^ #X.! !

!TerniLaPiliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:19:09'!
putOAt: aPoint.
	^game PlayingXPutOAt: aPoint.! !

!TerniLaPiliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:49:06'!
putXAt: aPoint.
	^game PlayingXPutXAt: aPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLaPiliPlayingX class' category: 'TerniLapilli'!
TerniLaPiliPlayingX class
	instanceVariableNames: ''!

!TerniLaPiliPlayingX class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:07:25'!
correspondsTo: aGame
	^aGame isPlayingO  and: [aGame isOver not] and: [aGame XPositions size < 3] .! !

!TerniLaPiliPlayingX class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:03:48'!
with: aGame
	^self new initializeWith: aGame.! !
