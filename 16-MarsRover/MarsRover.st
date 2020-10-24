!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'G. B. 10/24/2020 18:19:52'!
test14ShouldMoveBackwardsWhenGivenBackwardPositionAndIsPointingNorth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: North.
	rover move: 'b'.
	self assert: rover position equals: 5@3.
	
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'G. B. 10/24/2020 18:20:27'!
test15ShouldPointNorthWhenGivenBackwardPositionAndIsPointingNorth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover move: 'b'.
	self assert: rover cardinalPoint class equals: West.
	
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'G. B. 10/24/2020 18:22:46'!
test16ShouldMoveBackwardsWhenGivenBackwardPositionAndIsPointingEast
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: East.
	rover move: 'b'.
	self assert: rover position equals: 4@4.
	
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'G. B. 10/24/2020 18:24:17'!
test17ShouldPointEastWhenGivenBackwardPositionAndIsPointingEast
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: East.
	rover move: 'b'.
	self assert: rover cardinalPoint class equals: East.
	
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'G. B. 10/24/2020 18:26:42'!
test18ShouldMoveBackwardsWhenGivenBackwardPositionAndIsPointingSouth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: South.
	rover move: 'b'.
	self assert: rover position equals: 5@5.
	
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'G. B. 10/24/2020 18:31:50'!
test19ShouldPointSouthWhenGivenBackwardPositionAndIsPointingSouth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: South.
	rover move: 'b'.
	self assert: rover cardinalPoint class equals: South.
	
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'G. B. 10/24/2020 20:27:16'!
test20ShouldMoveBackwardsWhenGivenBackwardPositionAndIsPointingWest
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover move: 'b'.
	self assert: rover position equals: 6@4.
	
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'G. B. 10/24/2020 20:27:45'!
test21ShouldPointWestWhenGivenBackwardPositionAndIsPointingWest
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover move: 'b'.
	self assert: rover cardinalPoint class equals: West.
	
	! !


!MarsRoverTest methodsFor: 'move forward tests' stamp: 'G. B. 10/24/2020 18:06:14'!
test05ShouldMaintainPositionWhenGivenEmptyStringCommand
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover move: ''.
	self assert: rover position equals: 5@4.
	self assert: rover cardinalPoint class equals: West.
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'G. B. 10/24/2020 16:42:50'!
test06ShouldMoveForwardWhenGivenForwardPositionAndIsPointingNorth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: North.
	rover move: 'f'.
	self assert: rover position equals: 5@5.
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'G. B. 10/24/2020 18:06:22'!
test07ShouldPointNorthWhenGivenForwardPositionAndIsPointingNorth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: North.
	rover move: 'f'.
	self assert: rover cardinalPoint class equals: North.
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'G. B. 10/24/2020 16:55:29'!
test08ShouldMoveForwardWhenGivenForwardPositionAndIsPointingEast
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: East.
	rover move: 'f'.
	self assert: rover position equals: 6@4.
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'G. B. 10/24/2020 18:06:29'!
test09ShouldPointEastWhenGivenForwardPositionAndIsPointingEast
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: East.
	rover move: 'f'.
	self assert: rover cardinalPoint class equals: East.
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'G. B. 10/24/2020 17:00:15'!
test10ShouldMoveForwardWhenGivenForwardPositionAndIsPointingSouth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: South.
	rover move: 'f'.
	self assert: rover position equals: 5@3.
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'G. B. 10/24/2020 18:06:35'!
test11ShouldPointSouthWhenGivenForwardPositionAndIsPointingSouth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: South.
	rover move: 'f'.
	self assert: rover cardinalPoint class equals: South.
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'G. B. 10/24/2020 17:02:15'!
test12ShouldMoveForwardWhenGivenForwardPositionAndIsPointingWest
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover move: 'f'.
	self assert: rover position equals: 4@4.
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'G. B. 10/24/2020 18:19:37'!
test13ShouldPointWestWhenGivenForwardPositionAndIsPointingWest
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover move: 'f'.
	self assert: rover cardinalPoint class equals: West.
	
	! !


!MarsRoverTest methodsFor: 'initialization tests' stamp: 'G. B. 10/24/2020 15:53:58'!
test01ShouldReturnInitialPositionWhenCreatedCorrectly
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	self assert: rover position equals: 5@4.
	
	! !

!MarsRoverTest methodsFor: 'initialization tests' stamp: 'G. B. 10/24/2020 15:57:26'!
test02ShouldRaiseErrorWhenPassedNotValidInitialPosition
	self 
	should: [ MarsRover createAt: 5 pointingTo: West. ]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = MarsRover notValidPositionErrorDescription. ].

! !

!MarsRoverTest methodsFor: 'initialization tests' stamp: 'G. B. 10/24/2020 18:05:57'!
test03ShouldReturnInitialCardinalPointWhenCreatedCorrectly
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	self assert: rover cardinalPoint class equals: West.
	
	! !

!MarsRoverTest methodsFor: 'initialization tests' stamp: 'G. B. 10/24/2020 16:07:16'!
test04ShouldRaiseErrorWhenPassedNotValidInitialCardinalPoint
	self 
	should: [ MarsRover createAt: 5@4 pointingTo: 'West'. ]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = MarsRover notValidCardinalPointErrorDescription. ].

! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'point cardinalPoint currentPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'G. B. 10/24/2020 16:06:04'!
cardinalPoint
	^ cardinalPoint.! !

!MarsRover methodsFor: 'initialization' stamp: 'G. B. 10/24/2020 18:10:59'!
initializeWith: aPoint pointingTo: aCardinalPoint
	|points|
	(aPoint class = Point) ifFalse: [self error: self class notValidPositionErrorDescription.].
	points _ OrderedCollection with: East with: North with: West with: South.
	(points includes: aCardinalPoint)  ifFalse: [self error: self class notValidCardinalPointErrorDescription .].
	currentPosition := aPoint.
	cardinalPoint := aCardinalPoint new.! !

!MarsRover methodsFor: 'initialization' stamp: 'G. B. 10/24/2020 15:51:12'!
position
	^ currentPosition.! !


!MarsRover methodsFor: 'commands' stamp: 'G. B. 10/24/2020 18:16:02'!
move: aCommandString 
"
	(aString = 'f' and: cardinalPoint = North) ifTrue: [ currentPosition _ (currentPosition x) @ (currentPosition y + 1)].
	(aString = 'f' and: cardinalPoint = East) ifTrue: [currentPosition _ (currentPosition x + 1) @ (currentPosition y)].
	(aString = 'f' and: cardinalPoint = South) ifTrue: [currentPosition _ (currentPosition x) @ (currentPosition y -1)].
	(aString = 'f' and: cardinalPoint = West) ifTrue: [currentPosition _ (currentPosition x-1) @ (currentPosition y)].
	"
	(aCommandString = 'f') ifTrue: [cardinalPoint moveForward: self].
	(aCommandString = 'b') ifTrue: [cardinalPoint moveBackward: self].
! !

!MarsRover methodsFor: 'commands' stamp: 'G. B. 10/24/2020 18:23:37'!
moveBackwardFromEast 

	currentPosition _ (currentPosition x - 1) @ (currentPosition y).
! !

!MarsRover methodsFor: 'commands' stamp: 'G. B. 10/24/2020 18:19:04'!
moveBackwardFromNorth 

	currentPosition _ (currentPosition x) @ (currentPosition y -1).
! !

!MarsRover methodsFor: 'commands' stamp: 'G. B. 10/24/2020 18:31:10'!
moveBackwardFromSouth

	currentPosition _ (currentPosition x) @ (currentPosition y +1).
! !

!MarsRover methodsFor: 'commands' stamp: 'G. B. 10/24/2020 20:26:34'!
moveBackwardFromWest

	currentPosition _ (currentPosition x + 1) @ (currentPosition y).
! !

!MarsRover methodsFor: 'commands' stamp: 'G. B. 10/24/2020 17:55:06'!
moveForwardFromEast 

	currentPosition _ (currentPosition x + 1) @ (currentPosition y).
! !

!MarsRover methodsFor: 'commands' stamp: 'G. B. 10/24/2020 18:09:40'!
moveForwardFromNorth 

	currentPosition _ (currentPosition x) @ (currentPosition y +1).
! !

!MarsRover methodsFor: 'commands' stamp: 'G. B. 10/24/2020 18:29:33'!
moveForwardFromSouth 

	currentPosition _ (currentPosition x) @ (currentPosition y -1).
! !

!MarsRover methodsFor: 'commands' stamp: 'G. B. 10/24/2020 17:55:19'!
moveForwardFromWest 

	currentPosition _ (currentPosition x-1) @ (currentPosition y).
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'G. B. 10/24/2020 18:10:07'!
createAt: aPoint pointingTo: aCardinalPoint 
	^ self new initializeWith: aPoint pointingTo: aCardinalPoint .! !

!MarsRover class methodsFor: 'initialization' stamp: 'G. B. 10/24/2020 16:08:12'!
notValidCardinalPointErrorDescription
	^ 'The cardinal position is not valid!!'! !

!MarsRover class methodsFor: 'initialization' stamp: 'G. B. 10/24/2020 15:58:28'!
notValidPositionErrorDescription
	^ 'The position is not valid!!'! !


!classDefinition: #MarsRoverCardinalPoint category: 'MarsRover'!
Object subclass: #MarsRoverCardinalPoint
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverCardinalPoint methodsFor: 'as yet unclassified' stamp: 'G. B. 10/24/2020 17:12:48'!
move: aCommandString

	self subclassResponsibility .! !


!classDefinition: #East category: 'MarsRover'!
MarsRoverCardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'G. B. 10/24/2020 18:16:23'!
moveBackward: aMarsRover
	aMarsRover moveBackwardFromEast.! !

!East methodsFor: 'as yet unclassified' stamp: 'G. B. 10/24/2020 18:05:01'!
moveForward: aMarsRover
	aMarsRover moveForwardFromEast.! !


!classDefinition: #North category: 'MarsRover'!
MarsRoverCardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'G. B. 10/24/2020 18:16:39'!
moveBackward: aMarsRover
	aMarsRover moveBackwardFromNorth .! !

!North methodsFor: 'as yet unclassified' stamp: 'G. B. 10/24/2020 17:54:48'!
moveForward: aMarsRover
	aMarsRover moveForwardFromNorth .! !


!classDefinition: #South category: 'MarsRover'!
MarsRoverCardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'G. B. 10/24/2020 18:30:38'!
moveBackward: aMarsRover
	aMarsRover moveBackwardFromSouth .! !

!South methodsFor: 'as yet unclassified' stamp: 'G. B. 10/24/2020 18:04:09'!
moveForward: aMarsRover
	aMarsRover moveForwardFromSouth .! !


!classDefinition: #West category: 'MarsRover'!
MarsRoverCardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'G. B. 10/24/2020 20:26:14'!
moveBackward: aMarsRover
	aMarsRover moveBackwardFromWest .! !

!West methodsFor: 'as yet unclassified' stamp: 'G. B. 10/24/2020 18:04:32'!
moveForward: aMarsRover
	aMarsRover moveForwardFromWest .! !
