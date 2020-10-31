Implementar el juego Terni Lapilli (similar al TaTeTi) utilizando TDD.

- Sugerimos que los jugadores se llamen X y O.

Recordar que suponiendo que ninguno de los jugadores haya logrado formar una línea con sus tres fichas en el momento de colocar la tercera de sus fichas, **el juego continúa mediante el movimiento de las mismas.** Cada jugador, respetando su turno, debe **mover** una de sus fichas en dirección a una casilla libre **que se encuentre a "distancia uno".**

### El objeto que representa el juego podría responder los siguientes mensajes:
- putXAt: aPosition
- putOAt: aPosition
- isPlayingX
- isPlayingO
- isOver
- isTied
- hasPlayerXWon
- hasPlayerOWon

(Estos mensajes son sugeridos, no obligatorios.)

- La solución no debe tener if salvo para los casos donde no tiene sentido evitarlo (por ejemplo, cuando se verifica que aPosition es válida para el tablero).

- Recordar que la solución debe seguir las heurísticas de diseño que vimos, entre ellas la de no romper el encapsulamiento.
También, **que empieza jugando X.**

Como siempre, **recomendamos primero hacer que la solución funcione implementando todos los tests (make it run)**
Y luego a partir de sacar if y código repetido (y sin romper encapsulamiento) deducir el patrón (make it right).
