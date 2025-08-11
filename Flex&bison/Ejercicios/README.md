# Ejercicios

## Ejercicio 1

**¿Aceptará la calculadora una línea que solo contenga un comentario? ¿Por qué no? ¿Sería más fácil solucionar esto en el escáner o en el analizador?**

la calculadora no acepta comentarios por lo que no se le añadió ninguna regla para reconocerlos, solo lanzará un error de sintaxis.

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

No, para los operadores AND y OR y lo números hexadecimales no se establecieron reglas, por lo que el ejemplo 4 los reconoce como un caracter misterioso. En caso del OR lo reconoce como doble ABS.

<img width="764" height="741" alt="image" src="https://github.com/user-attachments/assets/a44089b5-d325-4add-95c1-36e9e4beba41" />

## Ejercicio 5

**¿Puedes pensar en idiomas para los que Flex no sería una buena herramienta para escribir un escáner?**

Sí, definitivamente hay lenguajes para los que Flex no es la mejor opción para escribir un escáner, ya que flex esta diseñado para lenguajes regulares (Son los lenguajes formales más simples y fáciles de entender) y cuando un lenguaje ya necesita del conexto para funcionar, flex se vuelve muy complicado.
- **leguajes como python o haskell**: flex necesita un montón de lógica adicial para recordar las sangrías y producir tokens de estos.
- **Leguajes como fortran**: Este lenguaje depende mucho del significado de los símbolos, se pudo ver con el ejercicio 3 que tratar hacer entender que un mismo símbolo significan dos cosas es complicado.
- **SQL y derivados**: Las expresiones tipo '...' o la memoria infinita (Consultas dentro de otra consulta y así sucesivamente). Flex las puedes contar pero tiene un límite.
- **HTML, JavaScript y CSS**: El escáner necesita cambiar dinámicamente de unas reglas a otras cuando esos tres lenguajes estan juntos, lo cual es posible hatsa que son demasiados cambios.

Para lo que flex es excelente es para lenguajes C y derivados (Java, etc).
