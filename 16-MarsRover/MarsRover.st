!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'move left tests' stamp: 'ERMC 10/25/2020 17:43:37'!
test14ShouldPointWestAndKeepPositionWhenGivenLeftCommandAndIsPointingNorth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: North.
	rover processCommand: 'l'.
	
	self assert: rover positionIs: 5@4 andIsPointingAt: West. 

	! !

!MarsRoverTest methodsFor: 'move left tests' stamp: 'ERMC 10/25/2020 17:44:02'!
test15ShouldPointNorthAndKeepPositionWhenGivenLeftCommandAndIsPointingEast
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: East.
	rover processCommand: 'l'.
	
	self assert: rover positionIs: 5@4 andIsPointingAt: North . 

	! !

!MarsRoverTest methodsFor: 'move left tests' stamp: 'ERMC 10/25/2020 17:44:13'!
test16ShouldPointEastAndKeepPositionWhenGivenLeftCommandAndIsPointingSouth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: South.
	rover processCommand: 'l'.
	
	self assert: rover positionIs: 5@4 andIsPointingAt: East. 
! !

!MarsRoverTest methodsFor: 'move left tests' stamp: 'ERMC 10/25/2020 17:44:26'!
test17ShouldPointSouthAndKeepPositionWhenGivenLeftCommandAndIsPointingWest
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover processCommand: 'l'.

	self assert: rover positionIs: 5@4 andIsPointingAt: South. 

	! !


!MarsRoverTest methodsFor: 'move backward tests' stamp: 'ERMC 10/25/2020 17:41:42'!
test10ShouldMoveBackwardsWhenGivenBackwardCommandAndIsPointingNorth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: North.
	rover processCommand: 'b'.

	self assert: rover positionIs: 5@3 andIsPointingAt: North . 
	
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'ERMC 10/25/2020 17:41:58'!
test11ShouldMoveBackwardsWhenGivenBackwardPositionAndIsPointingEast
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: East.
	rover processCommand: 'b'.
	
	self assert: rover positionIs: 4@4 andIsPointingAt: East. 

	
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'ERMC 10/25/2020 17:42:16'!
test12ShouldMoveBackwardsWhenGivenBackwardPositionAndIsPointingSouth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: South.
	rover processCommand: 'b'.

	self assert: rover positionIs: 5@5 andIsPointingAt: South. 

	
	! !

!MarsRoverTest methodsFor: 'move backward tests' stamp: 'ERMC 10/25/2020 17:42:28'!
test13ShouldMoveBackwardsWhenGivenBackwardPositionAndIsPointingWest
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover processCommand: 'b'.

	self assert: rover positionIs: 6@4 andIsPointingAt: West. 

	
	! !


!MarsRoverTest methodsFor: 'move forward tests' stamp: 'ERMC 10/25/2020 17:40:04'!
test05ShouldMaintainPositionWhenGivenEmptyStringCommand
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover processCommand: ''.
	
	self assert: rover positionIs: 5@4 andIsPointingAt: West. 
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'ERMC 10/25/2020 17:40:24'!
test06ShouldMoveForwardWhenGivenForwardCommandAndIsPointingNorth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: North.
	rover processCommand: 'f'.
	
	self assert: rover positionIs: 5@5 andIsPointingAt: North. 

	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'ERMC 10/25/2020 17:40:42'!
test07ShouldMoveForwardWhenGivenForwardCommandAndIsPointingEast
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: East.
	rover processCommand: 'f'.
	
	self assert: rover positionIs: 6@4 andIsPointingAt: East. 
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'ERMC 10/25/2020 17:40:59'!
test08ShouldMoveForwardWhenGivenForwardCommandAndIsPointingSouth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: South.
	rover processCommand: 'f'.

	self assert: rover positionIs: 5@3 andIsPointingAt: South . 
	
	! !

!MarsRoverTest methodsFor: 'move forward tests' stamp: 'ERMC 10/25/2020 17:41:13'!
test09ShouldMoveForwardWhenGivenForwardCommandAndIsPointingWest
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover processCommand: 'f'.
	
	self assert: rover positionIs: 4@4 andIsPointingAt: West. 
	
	! !


!MarsRoverTest methodsFor: 'move right tests' stamp: 'ERMC 10/25/2020 17:46:23'!
test18ShouldPointEastAndKeepPositionWhenGivenRightCommandAndIsPointingNorth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: North.
	rover processCommand: 'r'.

	self assert: rover positionIs: 5@4 andIsPointingAt: East. 

	! !

!MarsRoverTest methodsFor: 'move right tests' stamp: 'ERMC 10/25/2020 17:46:40'!
test19ShouldPointNorthAndKeepPositionWhenGivenRightCommandAndIsPointingWest
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: West.
	rover processCommand: 'r'.

	self assert: rover positionIs: 5@4 andIsPointingAt: North. 
	! !

!MarsRoverTest methodsFor: 'move right tests' stamp: 'ERMC 10/25/2020 17:46:50'!
test20ShouldPointSouthAndKeepPositionWhenGivenRightCommandAndIsPointingEast
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: East.
	rover processCommand: 'r'.

	self assert: rover positionIs: 5@4 andIsPointingAt: South. ! !

!MarsRoverTest methodsFor: 'move right tests' stamp: 'ERMC 10/25/2020 17:46:57'!
test21ShouldPointWestAndKeepPositionWhenGivenRightCommandAndIsPointingSouth
	|rover|
	rover _ MarsRover createAt: 5@4 pointingTo: South.
	rover processCommand: 'r'.

	self assert: rover positionIs: 5@4 andIsPointingAt: West. 
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


!MarsRoverTest methodsFor: 'multiple commands tests' stamp: 'ERMC 10/25/2020 17:44:52'!
test22ShouldChangePositionAndCardinalPointWhenGivenMultipleCommands
	|rover|
	rover _ MarsRover createAt: 0@0 pointingTo: North.
	rover processCommand: 'ffbrl'.

	self assert: rover positionIs: 0@1 andIsPointingAt: North. 
! !

!MarsRoverTest methodsFor: 'multiple commands tests' stamp: 'ERMC 10/25/2020 17:45:11'!
test23ShouldStopProcessingStringWhenEncountersInvalidCharInString
	|rover|
	rover _ MarsRover createAt: 0@0 pointingTo: North.
	self 
	should: [ 	rover processCommand: 'ffAbrl'. ]
	raise: Error 
	withExceptionDo: [ :anError |
		self assert: anError messageText = MarsRover invalidInputErrorDescription . ].
	
	self assert: rover positionIs: 0@2 andIsPointingAt: North. ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'ERMC 10/25/2020 17:39:32'!
assert: aMarsRover positionIs: aPosition andIsPointingAt: aCardinalPoint. 

	self assert: aMarsRover position equals: aPosition .
	self assert: aMarsRover cardinalPoint class equals: aCardinalPoint.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'point cardinalPoint currentPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'G. B. 10/24/2020 18:10:59'!
initializeWith: aPoint pointingTo: aCardinalPoint
	|points|
	(aPoint class = Point) ifFalse: [self error: self class notValidPositionErrorDescription.].
	points _ OrderedCollection with: East with: North with: West with: South.
	(points includes: aCardinalPoint)  ifFalse: [self error: self class notValidCardinalPointErrorDescription .].
	currentPosition := aPoint.
	cardinalPoint := aCardinalPoint new.! !


!MarsRover methodsFor: 'operations' stamp: 'G. B. 10/24/2020 21:52:26'!
processCommand: aCommandString 
"
	(aString = 'f' and: cardinalPoint = North) ifTrue: [ currentPosition _ (currentPosition x) @ (currentPosition y + 1)].
	(aString = 'f' and: cardinalPoint = East) ifTrue: [currentPosition _ (currentPosition x + 1) @ (currentPosition y)].
	(aString = 'f' and: cardinalPoint = South) ifTrue: [currentPosition _ (currentPosition x) @ (currentPosition y -1)].
	(aString = 'f' and: cardinalPoint = West) ifTrue: [currentPosition _ (currentPosition x-1) @ (currentPosition y)].
	"
	aCommandString do: [:command | 
							(command = $f) ifTrue: [cardinalPoint moveForward: self].
							(command = $b) ifTrue: [cardinalPoint moveBackward: self].
							(command = $l) ifTrue: [cardinalPoint moveLeft: self].
							(command = $r) ifTrue: [cardinalPoint moveRight: self]. 
							('fblr' includes: command ) ifFalse: [^self error: self class invalidInputErrorDescription].
		].
	! !


!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 18:23:37'!
moveBackwardFromEast 

	currentPosition _ (currentPosition x - 1) @ (currentPosition y).
! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 18:19:04'!
moveBackwardFromNorth 

	currentPosition _ (currentPosition x) @ (currentPosition y -1).
! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 18:31:10'!
moveBackwardFromSouth

	currentPosition _ (currentPosition x) @ (currentPosition y +1).
! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 20:26:34'!
moveBackwardFromWest

	currentPosition _ (currentPosition x + 1) @ (currentPosition y).
! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 17:55:06'!
moveForwardFromEast 

	currentPosition _ (currentPosition x + 1) @ (currentPosition y).
! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 18:09:40'!
moveForwardFromNorth 

	currentPosition _ (currentPosition x) @ (currentPosition y +1).
! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 18:29:33'!
moveForwardFromSouth 

	currentPosition _ (currentPosition x) @ (currentPosition y -1).
! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 17:55:19'!
moveForwardFromWest 

	currentPosition _ (currentPosition x-1) @ (currentPosition y).
! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 21:04:16'!
moveLeftFromEast

	cardinalPoint _ North new.! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 21:01:43'!
moveLeftFromNorth

	cardinalPoint _ West new.! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 21:06:15'!
moveLeftFromSouth
	cardinalPoint _ East new.! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 21:08:47'!
moveLeftFromWest
	cardinalPoint _ South new.! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 21:16:55'!
moveRightFromEast
	cardinalPoint _ South new.
! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 21:14:30'!
moveRightFromNorth
	cardinalPoint _ East new.
! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 21:19:38'!
moveRightFromSouth
	cardinalPoint _ West new.

! !

!MarsRover methodsFor: 'operations - private' stamp: 'G. B. 10/24/2020 21:24:10'!
moveRightFromWest
	cardinalPoint _ North new.


! !


!MarsRover methodsFor: 'accessing' stamp: 'G. B. 10/24/2020 16:06:04'!
cardinalPoint
	^ cardinalPoint.! !

!MarsRover methodsFor: 'accessing' stamp: 'G. B. 10/24/2020 15:51:12'!
position
	^ currentPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'G. B. 10/24/2020 18:10:07'!
createAt: aPoint pointingTo: aCardinalPoint 
	^ self new initializeWith: aPoint pointingTo: aCardinalPoint .! !

!MarsRover class methodsFor: 'initialization' stamp: 'G. B. 10/24/2020 21:41:52'!
invalidInputErrorDescription
	^ 'Received invalid input char!!'! !

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

!MarsRoverCardinalPoint methodsFor: 'as yet unclassified' stamp: 'G. B. 10/24/2020 21:52:26'!
processCommand: aCommandString

	self subclassResponsibility .! !


!classDefinition: #East category: 'MarsRover'!
MarsRoverCardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'operations' stamp: 'G. B. 10/24/2020 18:16:23'!
moveBackward: aMarsRover
	aMarsRover moveBackwardFromEast.! !

!East methodsFor: 'operations' stamp: 'G. B. 10/24/2020 18:05:01'!
moveForward: aMarsRover
	aMarsRover moveForwardFromEast.! !

!East methodsFor: 'operations' stamp: 'G. B. 10/24/2020 21:02:46'!
moveLeft: aMarsRover 
	aMarsRover moveLeftFromEast.! !

!East methodsFor: 'operations' stamp: 'G. B. 10/24/2020 21:15:28'!
moveRight: aMarsRover 
	aMarsRover moveRightFromEast.! !


!classDefinition: #North category: 'MarsRover'!
MarsRoverCardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'operations' stamp: 'G. B. 10/24/2020 18:16:39'!
moveBackward: aMarsRover
	aMarsRover moveBackwardFromNorth .! !

!North methodsFor: 'operations' stamp: 'G. B. 10/24/2020 17:54:48'!
moveForward: aMarsRover
	aMarsRover moveForwardFromNorth .! !

!North methodsFor: 'operations' stamp: 'G. B. 10/24/2020 20:58:53'!
moveLeft: aMarsRover
	aMarsRover moveLeftFromNorth .! !

!North methodsFor: 'operations' stamp: 'G. B. 10/24/2020 21:13:38'!
moveRight: aMarsRover
	aMarsRover moveRightFromNorth .! !


!classDefinition: #South category: 'MarsRover'!
MarsRoverCardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'operations' stamp: 'G. B. 10/24/2020 18:30:38'!
moveBackward: aMarsRover
	aMarsRover moveBackwardFromSouth .! !

!South methodsFor: 'operations' stamp: 'G. B. 10/24/2020 18:04:09'!
moveForward: aMarsRover
	aMarsRover moveForwardFromSouth .! !

!South methodsFor: 'operations' stamp: 'G. B. 10/24/2020 21:04:57'!
moveLeft: aMarsRover
	aMarsRover moveLeftFromSouth .! !

!South methodsFor: 'operations' stamp: 'G. B. 10/24/2020 21:18:18'!
moveRight: aMarsRover
	aMarsRover moveRightFromSouth .! !


!classDefinition: #West category: 'MarsRover'!
MarsRoverCardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'operations' stamp: 'G. B. 10/24/2020 20:26:14'!
moveBackward: aMarsRover
	aMarsRover moveBackwardFromWest .! !

!West methodsFor: 'operations' stamp: 'G. B. 10/24/2020 18:04:32'!
moveForward: aMarsRover
	aMarsRover moveForwardFromWest .! !

!West methodsFor: 'operations' stamp: 'G. B. 10/24/2020 21:07:05'!
moveLeft: aMarsRover
	aMarsRover moveLeftFromWest .! !

!West methodsFor: 'operations' stamp: 'G. B. 10/24/2020 21:23:00'!
moveRight: aMarsRover
	aMarsRover moveRightFromWest .! !
