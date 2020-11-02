!classDefinition: #TerniLapilliTest category: 'TerniLapilli'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'G. B. 11/2/2020 19:20:33'!
test00TheGameStartWithThePlayersWithoutPositionsTaken
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	self assert:  terniLapili XPositions isEmpty .
	self assert: terniLapili OPositions isEmpty.
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 11/1/2020 22:53:50'!
test01TheFirstMoveIsForPlayerX
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	self assert:  terniLapili isPlayingX 
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 11/1/2020 22:53:50'!
test02shouldRaiseErrorIfPlayerOstartsTheGame
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	self 
	should: [ terniLapili putOAt: 0@0.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli shouldPlayPlayerXErrorDescription. ].
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 11/1/2020 22:53:50'!
test03PlayerOPlayAfterPlayerX
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	
	self assert: terniLapili isPlayingO. 
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 11/1/2020 22:53:50'!
test04PlayerXPlayAfterPlayerO
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 0@1. 
	
	self assert: terniLapili isPlayingX 
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 11/1/2020 22:53:50'!
test05shouldRaiseErrorIfXplaysAfterX
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	
	self 
	should: [ terniLapili putXAt: 0@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli shouldPlayPlayerOErrorDescription. ].
! !

!TerniLapilliTest methodsFor: 'order of Players' stamp: 'ERMC 11/1/2020 22:53:51'!
test06shouldRaiseErrorIfOplaysAfterO
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 0@1.
	
	
	self 
	should: [ terniLapili putOAt: 1@1]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli shouldPlayPlayerXErrorDescription. ].
! !


!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 23:10:14'!
test25PlayerXWinsIfHeMakesVertical0
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 0@1.
	terniLapili putOAt: 2@0.
	terniLapili putXAt: 0@2.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 23:09:00'!
test26PlayerXWinsIfHeMakesVertical1
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 1@0.
	terniLapili putOAt: 2@1.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 2@0.
	terniLapili putXAt: 1@2.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 23:09:04'!
test27PlayerXWinsIfHeMakesVertical2
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 0@0.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@1.
	terniLapili putXAt: 2@2.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 23:09:10'!
test28PlayerOWinsIfHeMakesAnyVerticals
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 2@0.
	terniLapili putOAt: 0@0.
	terniLapili putXAt: 2@1.
	terniLapili putOAt: 0@2.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 0@1.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerOWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 23:09:15'!
test29PlayerXWinsIfHeMakesHorizontal0
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 1@0.
	terniLapili putOAt: 0@2.
	terniLapili putXAt: 2@0.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 23:09:21'!
test30PlayerXWinsIfHeMakesHorizontal1
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@1.
	terniLapili putOAt: 2@2.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 0@2.
	terniLapili putXAt: 2@1.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 23:09:26'!
test31PlayerXWinsIfHeMakesHorizontal2
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@2.
	terniLapili putOAt: 1@1.
	terniLapili putXAt: 1@2.
	terniLapili putOAt: 0@1.
	terniLapili putXAt: 2@2.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 23:09:31'!
test32PlayerXWinsIfHeMakesDiagonal0
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@0.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 0@2.
	terniLapili putXAt: 2@2.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 23:10:28'!
test33PlayerXWinsIfHeMakesDiagonal1
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@2.
	terniLapili putOAt: 1@0.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 2@2.
	terniLapili putXAt: 2@0.

	
	self assert: terniLapili isOver. 
	self assert: terniLapili hasPlayerXWon. 
! !

!TerniLapilliTest methodsFor: 'game over tests' stamp: 'ERMC 11/1/2020 23:10:41'!
test34WhenTheGameIsOverNoOneCanMove
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	terniLapili putXAt: 1@1.
	terniLapili putOAt: 1@0.
	terniLapili putXAt: 2@2.
	
	
	self 
	should: [terniLapili putOAt: 0@2.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli theGameIsOverErrorDescription].! !


!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 11/1/2020 23:06:25'!
test13shouldRaiseErrorIfAPlayerXTriesToMoveAPositionBeforeHaving3Positions
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	terniLapili putOAt: 1@2.
	
		
	self 
	should: [terniLapili moveXFrom: 2@0 to: 2@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli playersCantMoveAPositionBeforeHaving3PositionsErrorDescription ].! !

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 11/1/2020 23:06:31'!
test14PlayerXCanOnlyMoveAPositionToAnEmptyPositionAndInsideTheBoard
	
	|terniLapili expectedPosition |

	terniLapili := TerniLapilli new.
	
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

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 11/1/2020 23:06:45'!
test15shouldRaiseErrorIfPlayerXTriesToMoveAPositionThatIsNotHis
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
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
		self assert: anError messageText = TerniLapilli playersCantMoveAPositionThatIsNotHis ].
	
! !

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 11/1/2020 23:06:54'!
test16PlayersCanOnlyMoveInTheirTurn

	|terniLapili expectedPositions |

	terniLapili := TerniLapilli new.
	
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
		self assert: anError messageText = TerniLapilli shouldPlayPlayerOErrorDescription ].

	

	
! !

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 11/1/2020 23:07:01'!
test17PositionIsEmptyAfterAMove

	|terniLapili  |

	terniLapili := TerniLapilli new.
	
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

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 11/1/2020 22:53:50'!
test18PlayersCanOnlyMoveToADistance1Position

	|terniLapili |

	terniLapili := TerniLapilli new.
	
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
		self assert: anError messageText = TerniLapilli playersCanOnlyMoveToADistance1PositionErrorDescription].
	
! !

!TerniLapilliTest methodsFor: 'move positions tests' stamp: 'ERMC 11/1/2020 22:53:51'!
test19RulesFromPlayerXApplyToPlayerO

	|terniLapili expectedPositions |

	terniLapili := TerniLapilli new.
	
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


!TerniLapilliTest methodsFor: 'board limits tests' stamp: 'ERMC 11/1/2020 23:07:26'!
test20shouldRaiseErrorIfPlayerXGoesBelowFloor
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	self 
	should: [ terniLapili putXAt: 1@-2]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli playersShouldChooseAValidPosition ].! !

!TerniLapilliTest methodsFor: 'board limits tests' stamp: 'ERMC 11/1/2020 23:07:32'!
test21shouldRaiseErrorIfPlayerXGoesBeyondLeftWall
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	self 
	should: [ terniLapili putXAt: -1@1]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli playersShouldChooseAValidPosition ].! !

!TerniLapilliTest methodsFor: 'board limits tests' stamp: 'ERMC 11/1/2020 23:08:21'!
test22shouldRaiseErrorIfPlayerXGoesBeyondRoof
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	self 
	should: [ terniLapili putXAt: 1@3]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli playersShouldChooseAValidPosition ].! !

!TerniLapilliTest methodsFor: 'board limits tests' stamp: 'ERMC 11/1/2020 23:07:57'!
test23shouldRaiseErrorIfPlayerXGoesBeyondRightWall
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	self 
	should: [ terniLapili putXAt: 3@1]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli playersShouldChooseAValidPosition ].! !

!TerniLapilliTest methodsFor: 'board limits tests' stamp: 'ERMC 11/1/2020 23:08:14'!
test24shouldRaiseErrorIfPlayerOGoesBeyondABoardLimit
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	terniLapili putXAt: 0@1.

	
	self 
	should: [ terniLapili putOAt: 3@1]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli playersShouldChooseAValidPosition ].! !


!TerniLapilliTest methodsFor: 'positions tests' stamp: 'ERMC 11/1/2020 22:53:51'!
test07shouldSavePositionIfPlayerXPutAvalidPosition
	
	|terniLapili expectedPosition |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	expectedPosition := Set with: 0@0. 	
	
	self assert: expectedPosition equals: terniLapili XPositions  ! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'ERMC 11/1/2020 23:05:14'!
test08shouldSavePositionIfPlayerOPutsAValidPosition
	
	|terniLapili expectedPosition |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@0.
	
	expectedPosition := Set with: 1@2. 	
	terniLapili putOAt: 1@2.
	
	
	self assert: expectedPosition equals: terniLapili OPositions  ! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'ERMC 11/1/2020 23:05:31'!
test09shouldRaiseErrorIfPlayerXPlaysOccupiedPosition
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@1.
	terniLapili putOAt: 0@2.

	
	self 
	should: [ terniLapili putXAt: 0@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli playersShouldChooseAnEmptyPosition ].! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'ERMC 11/1/2020 23:05:38'!
test10shouldRaiseErrorIfPlayerOPlaysOccupiedPosition
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
	terniLapili putXAt: 0@1.
	terniLapili putOAt: 0@2.
	terniLapili putXAt: 1@1.

	
	self 
	should: [ terniLapili putOAt: 0@1.]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = TerniLapilli playersShouldChooseAnEmptyPosition ].! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 11/2/2020 19:33:44'!
test11ShouldRaiseErrorIfPlayerXTriesToTakeMoreThan3Positions
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
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
		self assert: anError messageText = TerniLapilli playersCantUseMoreThan3PositionsErrorDescription ].! !

!TerniLapilliTest methodsFor: 'positions tests' stamp: 'G. B. 11/2/2020 19:34:06'!
test12ShouldRaiseErrorIfPlayerOTriesToTakeMoreThan3Positions
	
	|terniLapili |

	terniLapili := TerniLapilli new.
	
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
		self assert: anError messageText = TerniLapilli playersCantUseMoreThan3PositionsErrorDescription ].! !


!classDefinition: #TerniLapilli category: 'TerniLapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'XPositions OPositions currentState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:01:07'!
OPositions
	
	^ OPositions! !

!TerniLapilli methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 15:00:56'!
XPositions

	^XPositions! !

!TerniLapilli methodsFor: 'accessing' stamp: 'G. B. 11/1/2020 18:53:27'!
currentPlayer

	^currentState player.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'G. B. 11/2/2020 01:20:20'!
hasPlayerOWon

	^ self checkWinner: OPositions .! !

!TerniLapilli methodsFor: 'accessing' stamp: 'G. B. 11/2/2020 01:12:59'!
hasPlayerXWon

	^ self checkWinner: XPositions .! !

!TerniLapilli methodsFor: 'accessing' stamp: 'G. B. 11/2/2020 01:04:51'!
isOver

	^ self hasPlayerXWon or: [self hasPlayerOWon].! !

!TerniLapilli methodsFor: 'accessing' stamp: 'ERMC 10/31/2020 18:43:54'!
isPlayingO
	
	^ self isPlayingX not ! !

!TerniLapilli methodsFor: 'accessing' stamp: 'G. B. 11/2/2020 01:41:02'!
isPlayingX
	
	^ currentState currentPlayer = #X! !

!TerniLapilli methodsFor: 'accessing' stamp: 'G. B. 11/2/2020 01:56:55'!
isValidPosition: aPoint
	

	(aPoint x  > 2 or: aPoint y  > 2) ifTrue: [^ self error: self class playersShouldChooseAValidPosition].
	(aPoint x  < 0 or: aPoint y  < 0) ifTrue: [^ self error: self class playersShouldChooseAValidPosition].
	
	((XPositions includes: aPoint 	) or: [OPositions includes: aPoint]) ifTrue: [^ self error: self class playersShouldChooseAnEmptyPosition].
! !


!TerniLapilli methodsFor: 'game over' stamp: 'ERMC 11/1/2020 23:12:38'!
checkWinner: aPositionCollection

	|winningPositions |
	
	winningPositions := self setWinningPositions. 

	^winningPositions includes: aPositionCollection .

! !

!TerniLapilli methodsFor: 'game over' stamp: 'ERMC 11/1/2020 23:12:21'!
setWinningPositions

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
	
	^ winningPositions. 
! !


!TerniLapilli methodsFor: 'moves - private' stamp: 'ERMC 11/1/2020 22:56:50'!
MovingOMoveOFrom: aPosition to: aNextPosition

	(OPositions includes: aPosition) ifFalse:[^ self error: self class playersCantMoveAPositionThatIsNotHis ].	
	OPositions add: aNextPosition.
	OPositions remove: aPosition.
	
	currentState _ TerniLapilliState corresponding: self.
! !

!TerniLapilli methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:36:43'!
MovingOMoveXFrom: aPosition to: aNextPosition
	^ self error: self class shouldPlayPlayerOErrorDescription.

	
! !

!TerniLapilli methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:53:40'!
MovingOPutOAt: aPoint
	^self error: self class playersCantUseMoreThan3PositionsErrorDescription.
! !

!TerniLapilli methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:54:37'!
MovingOPutXAt: aPosition
	^ self error: self class shouldPlayPlayerOErrorDescription.

	
! !

!TerniLapilli methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:36:33'!
MovingXMoveOFrom: aPosition to: aNextPosition
	^ self error: self class shouldPlayPlayerXErrorDescription.

	
! !

!TerniLapilli methodsFor: 'moves - private' stamp: 'ERMC 11/1/2020 22:56:50'!
MovingXMoveXFrom: aPosition to: aNextPosition
	
	(XPositions includes: aPosition) ifFalse:[^ self error: self class playersCantMoveAPositionThatIsNotHis ].	
	XPositions add: aNextPosition.
	XPositions remove: aPosition.
	
	currentState _ TerniLapilliState corresponding: self.
! !

!TerniLapilli methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:53:01'!
MovingXPutOAt: aPosition
	^ self error: self class shouldPlayPlayerXErrorDescription.

	
! !

!TerniLapilli methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:19:14'!
MovingXPutXAt: aPoint
	^self error: self class playersCantUseMoreThan3PositionsErrorDescription.
! !

!TerniLapilli methodsFor: 'moves - private' stamp: 'G. B. 11/2/2020 01:57:36'!
isAdistanceOne: aPosition to: aNextPosition

	^ ((aPosition x - aNextPosition x) abs <= 1) and: [ (aPosition y - aNextPosition y) abs <= 1].! !


!TerniLapilli methodsFor: 'moves' stamp: 'G. B. 11/2/2020 01:49:18'!
moveOFrom: aPosition to: aNextPosition

	self isValidPosition: aNextPosition.
	(self isAdistanceOne: aPosition to: aNextPosition) ifFalse:[^ self error: self class playersCanOnlyMoveToADistance1PositionErrorDescription ].


	currentState moveOFrom: aPosition to: aNextPosition.
	
! !

!TerniLapilli methodsFor: 'moves' stamp: 'G. B. 11/2/2020 01:49:14'!
moveXFrom: aPosition to: aNextPosition

	self isValidPosition: aNextPosition.
	(self isAdistanceOne: aPosition to: aNextPosition) ifFalse:[^ self error: self class playersCanOnlyMoveToADistance1PositionErrorDescription ].


	currentState moveXFrom: aPosition to: aNextPosition.

! !


!TerniLapilli methodsFor: 'initialization' stamp: 'ERMC 11/1/2020 22:55:14'!
initialize
	
	XPositions := Set new.
	OPositions := Set new.
	currentState _ TerniLapilliPlayingX with: self.! !


!TerniLapilli methodsFor: 'insert' stamp: 'G. B. 11/2/2020 01:22:17'!
putOAt: aPoint 

	self isValidPosition: aPoint.

	currentState putOAt: aPoint.

! !

!TerniLapilli methodsFor: 'insert' stamp: 'G. B. 11/2/2020 01:22:12'!
putXAt: aPoint 
	
	self isValidPosition: aPoint.

	currentState putXAt: aPoint.


! !


!TerniLapilli methodsFor: 'insert - private' stamp: 'G. B. 11/2/2020 01:34:42'!
PlayingOMoveOFrom: aPosition to: aNextPosition
	^ self error: self class playersCantMoveAPositionBeforeHaving3PositionsErrorDescription.

	
! !

!TerniLapilli methodsFor: 'insert - private' stamp: 'G. B. 11/2/2020 01:35:31'!
PlayingOMoveXFrom: aPosition to: aNextPosition
	^ self error: self class shouldPlayPlayerOErrorDescription .

	
! !

!TerniLapilli methodsFor: 'insert - private' stamp: 'ERMC 11/1/2020 22:56:50'!
PlayingOPutOAt: aPoint
	
	(OPositions size = 3) ifTrue: [^ self error: self class playersCantUseMoreThan3PositionsErrorDescription].

	OPositions add: aPoint.
	currentState _ TerniLapilliState corresponding: self.
	

! !

!TerniLapilli methodsFor: 'insert - private' stamp: 'G. B. 11/1/2020 22:51:48'!
PlayingOPutXAt: aPoint
	^ self error: self class shouldPlayPlayerOErrorDescription.! !

!TerniLapilli methodsFor: 'insert - private' stamp: 'G. B. 11/2/2020 01:36:10'!
PlayingXMoveOFrom: aPosition to: aNextPosition
	^ self error: self class shouldPlayPlayerXErrorDescription.

	
! !

!TerniLapilli methodsFor: 'insert - private' stamp: 'G. B. 11/2/2020 01:34:19'!
PlayingXMoveXFrom: aPosition to: aNextPosition
	^ self error: self class playersCantMoveAPositionBeforeHaving3PositionsErrorDescription.

	
! !

!TerniLapilli methodsFor: 'insert - private' stamp: 'G. B. 11/1/2020 22:20:14'!
PlayingXPutOAt: aPoint
	^ self error: self class shouldPlayPlayerXErrorDescription.! !

!TerniLapilli methodsFor: 'insert - private' stamp: 'ERMC 11/1/2020 22:56:50'!
PlayingXPutXAt: aPoint
	
	(XPositions size = 3) ifTrue: [^ self error: self class playersCantUseMoreThan3PositionsErrorDescription].

	XPositions add: aPoint.
	currentState _ TerniLapilliState corresponding: self.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: 'TerniLapilli'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 19:24:15'!
playersCanOnlyMoveToADistance1PositionErrorDescription

		^ 'Players can only move to a distance 1 position'.! !

!TerniLapilli class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 18:57:00'!
playersCantMoveAPositionThatIsNotHis
	
	^ ' Players can only move their own positions ' .! !

!TerniLapilli class methodsFor: 'errors' stamp: 'G. B. 10/31/2020 21:56:01'!
playersCantUseMoreThan3PositionsErrorDescription
	
	^ 'Players cant use more than 3 positions!!'! !

!TerniLapilli class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 15:54:21'!
playersShouldChooseAValidPosition
	
	^ 'Players only play in a valid position'! !

!TerniLapilli class methodsFor: 'errors' stamp: 'G. B. 10/31/2020 20:31:30'!
playersShouldChooseAnEmptyPosition
	
	^ 'Players should choose an empty position!!'! !

!TerniLapilli class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 15:37:10'!
shouldPlayPlayerOErrorDescription
	
		^ 'playerO Should play Now'.! !

!TerniLapilli class methodsFor: 'errors' stamp: 'ERMC 10/31/2020 15:37:19'!
shouldPlayPlayerXErrorDescription
	
		^ 'playerX Should play Now'.! !

!TerniLapilli class methodsFor: 'errors' stamp: 'ERMC 11/1/2020 13:34:14'!
theGameIsOverErrorDescription
	
	^ 'The Game is Over!!'! !


!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'G. B. 10/31/2020 22:07:14'!
playersCantMoveAPositionBeforeHaving3PositionsErrorDescription
	^'Players cant move a position before having 3 positions'.! !


!classDefinition: #TerniLapilliState category: 'TerniLapilli'!
Object subclass: #TerniLapilliState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:57:38'!
checkGameOver
	self subclassResponsibility .! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 23:00:12'!
currentPlayer
	self subclassResponsibility .! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:59:38'!
isOver
	self subclassResponsibility .! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:59:06'!
moveOFrom: aPosition to: aNextPosition.
	self subclassResponsibility .! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:59:01'!
moveXFrom: aPosition to: aNextPosition.
	self subclassResponsibility .! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:58:37'!
putOAt: aPoint
	self subclassResponsibility .! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:58:47'!
putXAt: aPoint
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: 'TerniLapilli'!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 00:58:20'!
corresponding: aGame

	| class |
	class _ self allSubclasses detect: [:aClass | aClass correspondsTo: aGame].
	^class new initializeWith: aGame.! !


!classDefinition: #TerniLapilliGameOver category: 'TerniLapilli'!
TerniLapilliState subclass: #TerniLapilliGameOver
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliGameOver methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:53:51'!
checkGameOver
	^ self error: TerniLapilli theGameIsOverErrorDescription.! !

!TerniLapilliGameOver methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:53:50'!
currentPlayer
	^ self error: TerniLapilli theGameIsOverErrorDescription.! !

!TerniLapilliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:27:56'!
initializeWith: aGame
	game _ aGame.! !

!TerniLapilliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:41:12'!
isOver
	^ true.! !

!TerniLapilliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:29:40'!
moveOFrom: aPosition to: aNextPosition.
	^game error: game class theGameIsOverErrorDescription 		.! !

!TerniLapilliGameOver methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:29:37'!
moveXFrom: aPosition to: aNextPosition.
	^game error: game class theGameIsOverErrorDescription 		.! !

!TerniLapilliGameOver methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:53:51'!
putOAt: aPoint
	^ self error: TerniLapilli theGameIsOverErrorDescription.! !

!TerniLapilliGameOver methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:53:51'!
putXAt: aPoint
	^ self error: TerniLapilli theGameIsOverErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliGameOver class' category: 'TerniLapilli'!
TerniLapilliGameOver class
	instanceVariableNames: ''!

!TerniLapilliGameOver class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:01:21'!
correspondsTo: aGame
	^aGame hasPlayerXWon or: [aGame hasPlayerOWon].! !

!TerniLapilliGameOver class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:04:12'!
with: aGame
	^self new initializeWith: aGame.! !


!classDefinition: #TerniLapilliMovingO category: 'TerniLapilli'!
TerniLapilliState subclass: #TerniLapilliMovingO
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:41:26'!
currentPlayer
	^#O.! !

!TerniLapilliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:02:55'!
initializeWith: aGame
	game _ aGame.! !

!TerniLapilliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 20:16:33'!
isMovingO
	^true.! !

!TerniLapilliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:31:28'!
moveOFrom: aPosition to: aNextPosition.
	game MovingOMoveOFrom: aPosition to: aNextPosition.! !

!TerniLapilliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:31:14'!
moveXFrom: aPosition to: aNextPosition.
	game MovingOMoveXFrom: aPosition to: aNextPosition.! !

!TerniLapilliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:50:16'!
putOAt: aPoint.
	^game MovingOPutOAt: aPoint.! !

!TerniLapilliMovingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:50:23'!
putXAt: aPoint.
	^game MovingOPutXAt: aPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliMovingO class' category: 'TerniLapilli'!
TerniLapilliMovingO class
	instanceVariableNames: ''!

!TerniLapilliMovingO class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:06:16'!
correspondsTo: aGame
	^aGame isPlayingX  and: [aGame isOver not] and: [aGame OPositions size = 3] .! !

!TerniLapilliMovingO class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:04:04'!
with: aGame
	^self new initializeWith: aGame.! !


!classDefinition: #TerniLapilliMovingX category: 'TerniLapilli'!
TerniLapilliState subclass: #TerniLapilliMovingX
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:41:32'!
currentPlayer
	^#X.! !

!TerniLapilliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:02:51'!
initializeWith: aGame
	game _ aGame.! !

!TerniLapilliMovingX methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:53:51'!
isMovingO
	^self error: TerniLapilli shouldPlayPlayerXErrorDescription.! !

!TerniLapilliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:32:06'!
moveOFrom: aPosition to: aNextPosition.
	game MovingXMoveOFrom: aPosition to: aNextPosition.! !

!TerniLapilliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:31:57'!
moveXFrom: aPosition to: aNextPosition.
	game MovingXMoveXFrom: aPosition to: aNextPosition.! !

!TerniLapilliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:49:49'!
putOAt: aPoint.
	^game MovingXPutOAt: aPoint.! !

!TerniLapilliMovingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:49:59'!
putXAt: aPoint.
	^game MovingXPutXAt: aPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliMovingX class' category: 'TerniLapilli'!
TerniLapilliMovingX class
	instanceVariableNames: ''!

!TerniLapilliMovingX class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:06:37'!
correspondsTo: aGame
	^aGame isPlayingO  and: [aGame isOver not] and: [aGame XPositions size = 3] .! !

!TerniLapilliMovingX class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:03:59'!
with: aGame
	^self new initializeWith: aGame.! !


!classDefinition: #TerniLapilliPlayingO category: 'TerniLapilli'!
TerniLapilliState subclass: #TerniLapilliPlayingO
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:28:58'!
checkGameOver
	! !

!TerniLapilliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:41:39'!
currentPlayer
	^#O.! !

!TerniLapilliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:02:45'!
initializeWith: aGame
	game _ aGame.! !

!TerniLapilliPlayingO methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:53:50'!
isMovingO
	^self error: TerniLapilli  playersCantMoveAPositionBeforeHaving3PositionsErrorDescription! !

!TerniLapilliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:41:38'!
isOver
	^false.
	! !

!TerniLapilliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:32:34'!
moveOFrom: aPosition to: aNextPosition.
	game PlayingOMoveOFrom: aPosition to: aNextPosition.! !

!TerniLapilliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:32:25'!
moveXFrom: aPosition to: aNextPosition.
	game PlayingOMoveXFrom: aPosition to: aNextPosition.! !

!TerniLapilliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:09:39'!
player
	^#O.! !

!TerniLapilliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:00:49'!
putOAt: aPoint.
	^game PlayingOPutOAt: aPoint.! !

!TerniLapilliPlayingO methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:49:24'!
putXAt: aPoint.
	^game PlayingOPutXAt: aPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliPlayingO class' category: 'TerniLapilli'!
TerniLapilliPlayingO class
	instanceVariableNames: ''!

!TerniLapilliPlayingO class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:06:58'!
correspondsTo: aGame
	^aGame isPlayingX  and: [aGame isOver not] and: [aGame OPositions size < 3] .! !

!TerniLapilliPlayingO class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:03:55'!
with: aGame
	^self new initializeWith: aGame.! !


!classDefinition: #TerniLapilliPlayingX category: 'TerniLapilli'!
TerniLapilliState subclass: #TerniLapilliPlayingX
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:29:15'!
checkGameOver
! !

!TerniLapilliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:41:44'!
currentPlayer
	^#X.! !

!TerniLapilliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:02:35'!
initializeWith: aGame
	game _ aGame.! !

!TerniLapilliPlayingX methodsFor: 'as yet unclassified' stamp: 'ERMC 11/1/2020 22:53:50'!
isMovingO
	^self error: TerniLapilli shouldPlayPlayerXErrorDescription.! !

!TerniLapilliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:41:32'!
isOver
	^false.
! !

!TerniLapilliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:32:53'!
moveOFrom: aPosition to: aNextPosition.
	game PlayingXMoveOFrom: aPosition to: aNextPosition.! !

!TerniLapilliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:33:02'!
moveXFrom: aPosition to: aNextPosition.
	game PlayingXMoveXFrom: aPosition to: aNextPosition.! !

!TerniLapilliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 18:09:29'!
player
	^ #X.! !

!TerniLapilliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:19:09'!
putOAt: aPoint.
	^game PlayingXPutOAt: aPoint.! !

!TerniLapilliPlayingX methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 22:49:06'!
putXAt: aPoint.
	^game PlayingXPutXAt: aPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliPlayingX class' category: 'TerniLapilli'!
TerniLapilliPlayingX class
	instanceVariableNames: ''!

!TerniLapilliPlayingX class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/2/2020 01:07:25'!
correspondsTo: aGame
	^aGame isPlayingO  and: [aGame isOver not] and: [aGame XPositions size < 3] .! !

!TerniLapilliPlayingX class methodsFor: 'as yet unclassified' stamp: 'G. B. 11/1/2020 21:03:48'!
with: aGame
	^self new initializeWith: aGame.! !
