!classDefinition: #I category: #NumerosDePeano!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #NumerosDePeano!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'operaciones' stamp: 'ERMC 9/15/2020 23:33:55'!
* unNumero

	^unNumero.! !

!I class methodsFor: 'operaciones' stamp: 'ERMC 9/14/2020 20:55:20'!
+ unNumero 
	
	^unNumero next.! !

!I class methodsFor: 'operaciones' stamp: 'ERMC 9/17/2020 15:14:59'!
- unNumero
	
	^ Error signal: self descripcionDeErrorDeNumerosNegativosNoSoportados.
! !

!I class methodsFor: 'operaciones' stamp: 'ERMC 9/17/2020 15:09:15'!
/ unNumero
	(unNumero isDescendantOf: self) ifTrue:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]	.
	^self.! !

!I class methodsFor: 'operaciones' stamp: 'ERMC 9/16/2020 17:51:57'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^ 'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'operaciones' stamp: 'ERMC 9/16/2020 15:50:34'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ 'No soporto numeros negativos'! !

!I class methodsFor: 'operaciones' stamp: 'ERMC 9/14/2020 20:49:47'!
next
	^II.! !

!I class methodsFor: 'operaciones' stamp: 'ERMC 9/16/2020 18:11:45'!
resultadoDeRestarme: unNumero

	^ unNumero prev.! !


!classDefinition: #II category: #NumerosDePeano!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #NumerosDePeano!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'operaciones' stamp: 'ERMC 9/16/2020 14:38:31'!
* unnumero
	|producto remainder|
	producto:= self.
	remainder := unnumero.
	[remainder = I ] 
		whileFalse: [
					producto := producto + self. remainder := remainder prev].
	^producto.
	! !

!II class methodsFor: 'operaciones' stamp: 'ERMC 9/15/2020 18:24:21'!
+ unNumero 
	"^ (unNumero prev + self) next."
	^ self prev + unNumero next.! !

!II class methodsFor: 'operaciones' stamp: 'ERMC 9/17/2020 15:06:37'!
- unNumero
	^unNumero resultadoDeRestarme: self.

	! !

!II class methodsFor: 'operaciones' stamp: 'ERMC 9/17/2020 15:08:03'!
/ unNumero
	|ret count|
	count := unNumero.
	ret := self.
	self = unNumero ifTrue:[^self].
	(unNumero isDescendantOf: self) ifTrue:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]	.
	[count = I] whileFalse:[ret:= ret - unNumero. count := count - I].
	
	^ ret.
! !

!II class methodsFor: 'operaciones' stamp: 'ERMC 9/16/2020 17:50:55'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^ 'No se puede dividir por un numero mayor'! !

!II class methodsFor: 'operaciones' stamp: 'ERMC 9/14/2020 21:37:57'!
next
	^self createChildNamed: self name , 'I'.! !

!II class methodsFor: 'operaciones' stamp: 'ERMC 9/14/2020 21:18:05'!
prev
	^self parent.! !

!II class methodsFor: 'operaciones' stamp: 'ERMC 9/16/2020 18:11:23'!
resultadoDeRestarme: unNumero
	
	^ unNumero prev - self prev.! !


!classDefinition: #III category: #NumerosDePeano!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!


!classDefinition: #IIII category: #NumerosDePeano!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!


!classDefinition: #IIIII category: #NumerosDePeano!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!


!classDefinition: #IIIIII category: #NumerosDePeano!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!


!classDefinition: #IIIIIII category: #NumerosDePeano!
IIIIII subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!


!classDefinition: #IIIIIIII category: #NumerosDePeano!
IIIIIII subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!


!classDefinition: #IIIIIIIII category: #NumerosDePeano!
IIIIIIII subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!


!classDefinition: #NumerosDePeanoTest category: #NumerosDePeano!
DenotativeObject subclass: #NumerosDePeanoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NumerosDePeanoTest class' category: #NumerosDePeano!
NumerosDePeanoTest class
	instanceVariableNames: ''!

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'ERMC 9/14/2020 20:49:08'!
test01SiguienteDeIEsII

	Assert that: I next isEqualTo: II
	
	! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'ERMC 9/14/2020 20:50:45'!
test02SiguienteDeIIEsIII

	Assert that: II next isEqualTo: III
	
	! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'ERMC 9/14/2020 20:54:30'!
test03SumaDeUnNumeroYIesElSiguiente


	Assert that: I+I isEqualTo: I next.
	
	! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'ERMC 9/15/2020 23:50:27'!
test04ProductoDeIIPorIEsII

	Assert that: I * II isEqualTo: II.

! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'ERMC 9/15/2020 20:03:41'!
test05ProductoDeIIPorIIEsIIII

	Assert that: II * II isEqualTo: IIII.

! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'ERMC 9/16/2020 14:34:26'!
test06ProductoDe2IPor3IEs6I

	Assert that: II * III isEqualTo: IIIIII.

! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'ERMC 9/16/2020 14:35:00'!
test07ProductoDe3IPor3IEs9I

	Assert that: III * III isEqualTo: IIIIIIIII.

! !
