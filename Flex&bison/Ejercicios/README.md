# Ejercicios

## Ejercicio 1

**¿Aceptará la calculadora una línea que solo contenga un comentario? ¿Por qué no? ¿Sería más fácil solucionar esto en el escáner o en el analizador?**

La calculadora no acepta comentarios por lo que no se le añadió ninguna regla para reconocerlos, solo lanzará un error de sintaxis.

<img width="791" height="97" alt="image" src="https://github.com/user-attachments/assets/b1fb1688-fad8-4e29-8586-d6eeb9134375" />

Para solucionarlo, sería mucho mas fácil en escáner, ya que solo los ignoraria antes de que lleguen al analizador.

## Ejercicio 2

**Calculadora hexadecimal y decimal**

- Se agregó <code> 0[xX][a-fA-F0-9]+ </code> para que reconozca los números hexadecimales (tanto mayúsculas o minúsculas).
- El <code>strtol(yytext, NULL, 16);</code> convierte la cadena de hexa a entero.

<img width="865" height="195" alt="image" src="https://github.com/user-attachments/assets/aeef5be9-41ce-4a0e-b90b-6517b50b0a16" />

## Ejercicio 3

**Añade operadores de bits como AND y OR a la calculadora. El operador obvio para OR es una barra vertical, pero este ya es el operador de valor absoluto unario. ¿Qué ocurre si también se usa como operador OR binario, por ejemplo, exp factor ABS?**

En un pricipio se planteó | para valor absoluto, si se usa esa misma barra como operador OR habría conflictos porque Bsion no sabria diferenciar si es para uno u otro. La mejor solución es usar operadores distintos como en los hexadecimales, la sola letra es un error por lo que al pricipio se usa 0x para diferenciarlos.
- || para OR
- && para AND
- | sigue para valor absoluto

<img width="845" height="282" alt="image" src="https://github.com/user-attachments/assets/bc700829-8890-43b1-97e2-64e4cb50decc" />

## Ejercicio 4

**¿La versión manuscrita del escáner en el Ejemplo 1-4 reconoce exactamente los mismos tokens que la versión generada por flex?**

No, el manuscrito hecho en C puede aceptar paréntesis e ignorar comentarios contrario al ejemplo 4, que no se establecieron reglas para aceptar ninguno de los dos, por lo que los tomará como un carácter misterioso en el caso de las letras. 

<img width="763" height="485" alt="image" src="https://github.com/user-attachments/assets/f4d224f8-ca75-4cd6-83fd-a0520859f543" />

## Ejercicio 5

**¿Puedes pensar en idiomas para los que Flex no sería una buena herramienta para escribir un escáner?**

Sí, definitivamente hay lenguajes para los que Flex no es la mejor opción para escribir un escáner, ya que flex esta diseñado para lenguajes regulares (Son los lenguajes formales más simples y fáciles de entender) y cuando un lenguaje ya necesita del conexto para funcionar, flex se vuelve muy complicado.
- **leguajes como python o haskell**: flex necesita un montón de lógica adicial para recordar las sangrías y producir tokens de estos.
- **Leguajes como fortran**: Este lenguaje depende mucho del significado de los símbolos, se pudo ver con el ejercicio 3 que tratar hacer entender que un mismo símbolo significan dos cosas es complicado.
- **SQL y derivados**: Las expresiones tipo '...' o la memoria infinita (Consultas dentro de otra consulta y así sucesivamente). Flex las puedes contar pero tiene un límite.
- **HTML, JavaScript y CSS**: El escáner necesita cambiar dinámicamente de unas reglas a otras cuando esos tres lenguajes estan juntos, lo cual es posible hatsa que son demasiados cambios.

Para lo que flex es excelente es para lenguajes C y derivados (Java, etc).

## Ejercicio 6

**Reescriba el programa de conteo de palabras en C. Ejecute algunos archivos grandes en ambas versiones. ¿Es la versión C notablemente más rápida? ¿Fue mucho más difícil de depurar?**

Se reescribe el programa y se le añade tanto al flex como al archivo C <code>time.h</code> para saber su tiempo de ejecución.
- En C

<img width="496" height="118" alt="image" src="https://github.com/user-attachments/assets/7aaf0624-b745-4141-bd61-056a4825575c" />

- En Flex

<img width="781" height="144" alt="image" src="https://github.com/user-attachments/assets/c1745fc5-d23d-4221-b056-533d65162bac" />

C es más rápido en este caso por lo que no tiene que pasar por estructuras ni tokens, C tiene menos pasos lógicos por lo que consume menos tiempo.
- **Flex**: Lee caracteres en buffers > busca coincidencias con expresiones regulares > ejecuta la acción.
- **C**: Lee carácter > compara > procesa.

### ¿Qué pasaría si el texto fuera mucho más largo?

- En C

<img width="1019" height="144" alt="image" src="https://github.com/user-attachments/assets/97f4ed0e-d7dc-4caf-94cd-0af5c3972d4e" />

- En Flex

<img width="971" height="495" alt="image" src="https://github.com/user-attachments/assets/d037d3a7-66ba-4335-9ba5-6616ab4a1bb6" />

La diferencia no es porque Flex sea lento en general, sino porque en un problema tan simple el overhead de su máquina de estados pesa más que el beneficio en procesos cortos, en textos largos Flex empieza a ganar ventaja porque lee bloques grandes en vez de carácter a carácter (<code>getchar()</code>) como lo hace  C y reduce la llamada de funciones y evita iteraciones.

En conclusión, C es más rápido en procesos cortos y Flex en procesos largos.
