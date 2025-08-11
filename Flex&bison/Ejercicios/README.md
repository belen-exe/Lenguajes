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

