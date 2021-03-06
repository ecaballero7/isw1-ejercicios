!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 16:41:34'!
addEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 16:41:41'!
addFraccion

	self subclassResponsibility ! !

!Numero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 16:42:03'!
divideFromEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 16:41:56'!
divideFromFraccion

	self subclassResponsibility ! !

!Numero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 16:42:14'!
multiplyEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 16:42:18'!
multiplyFraccion

	self subclassResponsibility ! !

!Numero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 16:41:22'!
substractFromEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 16:40:46'!
substractFromFraccion

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 9/24/2020 17:28:15'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 9/24/2020 04:33:41'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de n�mero inv�lido!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'ERMC 9/28/2020 20:34:47'!
* aMultiplier 
	
	"(aMultiplier isKindOf: Fraccion) ifTrue: [^(self * aMultiplier numerator  ) / aMultiplier denominator].
	
	^self class with: value * aMultiplier integerValue
	"
	
	^ aMultiplier multiplyEntero: self. ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ERMC 9/28/2020 20:29:44'!
+ anAdder 
	"
	a + b/c = (a*c + b*1) / 1* c	
	"

"	(anAdder isKindOf: Fraccion) ifTrue: [^ ((self * anAdder denominator ) + anAdder numerator ) / anAdder denominator].

	
	^self class with: value + anAdder integerValue
"
	^ anAdder addEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ERMC 9/29/2020 16:36:05'!
- aSubtrahend 
	"
	(aSubtrahend isKindOf: Fraccion) ifTrue: [^((self * aSubtrahend denominator ) - aSubtrahend numerator ) / aSubtrahend denominator].	
	
	^ self class with: value - aSubtrahend integerValue.
	"
	
	^ aSubtrahend substractFromEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ERMC 9/29/2020 16:35:29'!
/ aDivisor 
	
	"
	(aDivisor isKindOf: Fraccion) ifTrue: [^ self * (aDivisor denominator / aDivisor numerator)].
	
	^Fraccion with: self over: aDivisor
	"
	
	^ aDivisor divideFromEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ERMC 9/30/2020 18:35:58'!
fibonacci
"
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
"
	^ self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ERMC 9/29/2020 18:34:34'!
xxx

	self subclassResponsibility. 	! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/28/2020 20:28:43'!
addEntero: sumando 

	^self class with: (value + sumando integerValue).
! !

!Entero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/28/2020 20:54:07'!
addFraccion: sumando

	^ ((sumando denominator * self ) + sumando numerator ) / sumando denominator.
! !

!Entero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 19:32:15'!
divideFromEntero: dividendo 
	
	^Fraccion with: dividendo over: self.
	! !

!Entero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 19:32:06'!
divideFromFraccion: dividendo 
	
	^  dividendo numerator / (self * dividendo denominator).! !

!Entero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/28/2020 20:34:37'!
multiplyEntero: aMultiplier
	
	^self class with: value * aMultiplier integerValue
! !

!Entero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/28/2020 20:57:59'!
multiplyFraccion: aMultiplier 
	
	^ (aMultiplier numerator * self) / aMultiplier denominator.! !

!Entero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 19:31:17'!
substractFromEntero: minuendo 

	^ self class with: minuendo integerValue - value.
! !

!Entero methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 19:31:41'!
substractFromFraccion: minuendo

	^ ( minuendo numerator - (minuendo denominator * self )   ) / minuendo denominator.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'ERMC 9/30/2020 19:17:07'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	"^self new initalizeWith: aValue"

	(aValue < 0) ifTrue:[^Negative new initializeWith: aValue].
	(aValue = 0) ifTrue:[^Zero new].
	(aValue = 1) ifTrue:[^One new].
	(aValue > 1) ifTrue:[^Positive new initializeWith: aValue].
	
	! !


!classDefinition: #Negative category: 'Numero-Exercise'!
Entero subclass: #Negative
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negative methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 13:06:36'!
denominadorDe: aDivisor

	 ^self negated! !

!Negative methodsFor: 'utils - private' stamp: 'ERMC 9/30/2020 18:53:21'!
initializeWith: aValue 
	
	value := aValue! !

!Negative methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 13:06:43'!
numeradorDe: aDivdend

	 ^aDivdend negated! !

!Negative methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 13:52:08'!
puedoSerDividendoCon: aDivisor
	
	
	| denominator greatestCommonDivisor numerator |
	aDivisor isNegative ifTrue:[ ^self negated / aDivisor negated].

	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.

	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !

!Negative methodsFor: 'utils - private' stamp: 'ERMC 9/30/2020 19:54:33'!
puedoSerDivisorCon: aDividend
	
	aDividend  puedoSerDividendoCon: self. 



! !


!Negative methodsFor: 'operaciones' stamp: 'ERMC 9/30/2020 18:28:20'!
fibonacci

	^ self error: Entero negativeFibonacciErrorDescription! !


!classDefinition: #One category: 'Numero-Exercise'!
Entero subclass: #One
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!One methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 13:19:42'!
denominadorDe: aDivisor
	
	^ aDivisor .



! !

!One methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 12:59:37'!
numeradorDe: aDividend
	
	^ self.



! !

!One methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 13:51:56'!
puedoSerDividendoCon: aDivisor
	
	
	| denominator greatestCommonDivisor numerator |
	aDivisor isNegative ifTrue:[ ^self negated / aDivisor negated].

	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.

	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !

!One methodsFor: 'utils - private' stamp: 'ERMC 9/30/2020 19:54:11'!
puedoSerDivisorCon: aDividend
	
	aDividend  puedoSerDividendoCon: self. 



! !


!One methodsFor: 'operaciones' stamp: 'ERMC 9/30/2020 18:32:30'!
fibonacci
	
	^ Entero with: 1. ! !


!One methodsFor: 'initialization' stamp: 'ERMC 9/30/2020 18:53:13'!
initialize
	
	value := 1! !


!classDefinition: #Positive category: 'Numero-Exercise'!
Entero subclass: #Positive
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Positive methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 13:02:30'!
denominadorDe: aDivisor
	
	| greatestCommonDivisor |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor . 
	
	^ aDivisor // greatestCommonDivisor.
	


! !

!Positive methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 13:01:58'!
numeradorDe: aDividend
	
	| greatestCommonDivisor |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDividend . 
	
	^ aDividend // greatestCommonDivisor.
	


! !

!Positive methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 13:51:44'!
puedoSerDividendoCon: aDivisor
	
	
	| denominator greatestCommonDivisor numerator |
	aDivisor isNegative ifTrue:[ ^self negated / aDivisor negated].

	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.

	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !

!Positive methodsFor: 'utils - private' stamp: 'ERMC 9/30/2020 19:49:22'!
puedoSerDivisorCon: aDividend
	
	aDividend  puedoSerDividendoCon: self. 



! !


!Positive methodsFor: 'operaciones' stamp: 'ERMC 9/30/2020 18:38:31'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci.

	! !


!Positive methodsFor: 'initialization' stamp: 'ERMC 9/30/2020 18:53:01'!
initializeWith: aValue 
	
	value := aValue! !


!classDefinition: #Zero category: 'Numero-Exercise'!
Entero subclass: #Zero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Zero methodsFor: 'operaciones' stamp: 'ERMC 9/30/2020 18:31:49'!
fibonacci

	^ Entero with: 1. 
! !


!Zero methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 12:51:05'!
denominadorDe: aDividend

	 self error: self canNotDivideByZeroErrorDescription! !

!Zero methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 12:53:24'!
numeradorDe: aDivisor

	^ self! !

!Zero methodsFor: 'utils - private' stamp: 'ERMC 10/1/2020 13:45:33'!
puedoSerDividendoCon: aDivisor
	 ^self.! !

!Zero methodsFor: 'utils - private' stamp: 'ERMC 9/30/2020 19:36:31'!
puedoSerDivisorCon: aDividend

	 self error: self canNotDivideByZeroErrorDescription! !


!Zero methodsFor: 'initialization' stamp: 'ERMC 9/30/2020 18:53:32'!
initialize
	
	value := 0
! !


!Zero methodsFor: 'error description' stamp: 'ERMC 9/30/2020 19:20:15'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!'! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ERMC 9/28/2020 20:57:42'!
* aMultiplier 
	"
	(aMultiplier isKindOf: Entero) ifTrue: [^ (numerator * aMultiplier ) / denominator].

	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)
	"
	
	^ aMultiplier multiplyFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ERMC 9/28/2020 20:53:47'!
+ anAdder 
	"
	| newNumerator newDenominator |
	
	(anAdder isKindOf: Entero) ifTrue: [^ ((denominator * anAdder ) + numerator ) / denominator].

	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator 
	"
	
	^ anAdder addFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ERMC 9/28/2020 21:57:27'!
- aSubtrahend 
	"
	| newNumerator newDenominator |
	
	6/5 - 1 = (6*1) - 5 / 
	
	
	(aSubtrahend isKindOf: Entero) ifTrue: [^ (numerator - (denominator * aSubtrahend ) ) / denominator].	
	
	newNumerator := (numerator * aSubtrahend denominator) - (denominator * aSubtrahend numerator).
	newDenominator := denominator * aSubtrahend denominator.
	
	^newNumerator / newDenominator 
"
	^ aSubtrahend substractFromFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ERMC 9/28/2020 21:05:17'!
/ aDivisor 
	"
	(aDivisor isKindOf: Entero) ifTrue: [^  numerator / (denominator * aDivisor) ].

	^(numerator * aDivisor denominator) / (denominator * aDivisor numerator)
	"
	
	^ aDivisor divideFromFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/28/2020 20:29:06'!
addEntero: sumando
	"
	aca va la parte del if de entero ->aNumber: fraccion
	"
	^ ( (sumando * denominator ) + numerator ) / denominator.! !

!Fraccion methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/28/2020 20:53:37'!
addFraccion: sumando
	
	| newNumerator newDenominator |
	
	newNumerator := (numerator * sumando denominator) + (denominator * sumando numerator).
	newDenominator := denominator * sumando denominator.
	
	^newNumerator / newDenominator 
	! !

!Fraccion methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 19:27:49'!
divideFromEntero: dividendo

	^ dividendo * ( denominator / numerator).
! !

!Fraccion methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 19:28:16'!
divideFromFraccion: dividendo 

	^(denominator * dividendo numerator) / (numerator * dividendo denominator)
! !

!Fraccion methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/28/2020 20:35:10'!
multiplyEntero: aMultiplier

	^ (numerator * aMultiplier  ) / denominator.
	! !

!Fraccion methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/28/2020 20:57:29'!
multiplyFraccion: aMultiplier 

	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)
	! !

!Fraccion methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 19:29:31'!
substractFromEntero: minuendo

	^((minuendo * denominator ) - numerator ) / denominator.	

	! !

!Fraccion methodsFor: 'operaciones auxiliares - private' stamp: 'ERMC 9/29/2020 19:30:23'!
substractFromFraccion: minuendo 

	| newNumerator newDenominator |
	
	newNumerator := (denominator * minuendo numerator) - (numerator * minuendo denominator).
	newDenominator := denominator * minuendo denominator.
	
	^newNumerator / newDenominator 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'ERMC 10/1/2020 13:58:09'!
with: aDividend over: aDivisor

	"aDivisor puedoSerDivisorCon: aDividend."


	"Intentamos sacar los ifs de aca pero no encontramos una forma de volver a llamar correctamente initializeWith: over: de Fraccion una vez que ya habiamos salido de esta clase. Dejamos la jerarquia polimorfica que creamos para que vean hasta donde avanzamos"
	
	| numerator denominator greatestCommonDivisor |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator.
	! !
