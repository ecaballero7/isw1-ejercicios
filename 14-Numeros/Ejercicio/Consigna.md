 El objetivo de este ejercicio es implementar las siguientes operaciones para enteros y fracciones:
 1. #### + - *  /

2. La solución final no debe tener if en los métodos que deben implementar y todos los test deben funcionar.
3. Los tests ni su setUp pueden ser modificados.

Como podrán ver cuando corran los tests, hay varios que funcionan y son los correspondientes a cuando se opera aritméticamente entre números del mismo tipo, o sea entre enteros o entre fracciones. **Los test que fallan son los relacionados a las operaciones entre números de distinto tipo, o sea entre enteros y fracciones y viceversa.**

#### Algunas aclaraciones:

- El archivo que deben abrir, y el modelo desde el que tienen que partir es Numero-Ejercicio.st. Pre-Numero-Ejercicio Solu.st es la solución al ejercicio de Pre-Numeros que estaba fuera del zip.
- **Las fracciones no pueden tener denominador 1**. Fracciones con denominador 1 se asumen enteros.
- **Los enteros no pueden responder los mensajes** #numerador y #denominador ya que no son fracciones.
- Cuando se opera aritméticamente con enteros, verán que se utilizan las operaciones aritméticas provistas por el sistema. Esto es para que sea más performante.

#### Ayuda:

Antes de empezar a resolver el problema, debuggeen los tests que funcionan para entender cómo es el modelo que se está presentando, analicen las clases Número, Entero y Fracción.

Una vez que se sientan cómodos con el modelo, hagan pasar todos los tests implementando lo necesario utilizando ifs (investiguen el mensaje #isKindOf:). Una vez que los tests pasen, apliquen el algoritmo que vimos en clase para reemplazar if por polimorfismo.

**Desafío Adicional (opcional, no resta, otorga puntos extra):**

Aquellos que estén interesados en llevar al extremo el reemplazo de if por polimorfismo (y practicar para el parcial), traten de sacar los ifs que ya venían en el ejercicio inicialmente y que tienen que ver con que no se puede dividir por cero, que el denominador no puede ser uno, casos bases de fibonacci, etc. Las soluciones a este desafío son muy interesantes y distintas en para lenguajes de prototipación (ej. javascript) y clasificación.
