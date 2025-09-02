# ANTLR4

## 1.Calculadora del libro

Para esta calculadora se usan 4 archivos:
- <code>LabeledExpr.g4:</code> En esta se definen las expresiones que se van a usar en la calculadora; multiplicación, división, suma, resta, letras, etc.
- <code>EvalVisitor.java:</code> Se definen las funciones de lo que hace cada expresión y retorna el resultado de cada operación.
- <code>Calc.java:</code> Define el flujo de entrada de caracteres, crea los objetos del analizador léxico y del analizador derivados de la gramática LabeledExpr y por último, recorre el árbol de análisis devuelto por el método prog(), llamamos a visit().
- <code>t.expr:</code> Contiene las cadenas para analizar.

<img width="980" height="432" alt="image" src="https://github.com/user-attachments/assets/43e25098-96fd-496c-858d-17a65fc082ac" />


## 2.Calculadora con nuevas funciones

- Calcular: Sin(x), Cos(x), Tan(x)

<img width="930" height="749" alt="image" src="https://github.com/user-attachments/assets/0c981668-3f9e-4662-aa00-bf2e90935c65" />

<br>
<br>
<br>

- Raíz cuadrada usando Sqrt(x)

<img width="752" height="153" alt="image" src="https://github.com/user-attachments/assets/a03673cb-8ae6-4d3f-b33e-d6be76cddac2" />

<br>
<br>
<br>

- Logaritmo natura Ln(x) y Logaritmo en base 10 Log(x)

<img width="755" height="319" alt="image" src="https://github.com/user-attachments/assets/560dfb17-5e1f-4d69-a82d-8244882b496f" />

<br>
<br>
<br>

- Calcule el factorial de un numero usando !

<img width="876" height="457" alt="image" src="https://github.com/user-attachments/assets/63b94e46-562a-4388-867b-8bc3d7453f5e" />

<br>
<br>
<br>

- Se hacen los cambios pertinentes en el LabeledExpr

<img width="930" height="749" alt="image" src="https://github.com/user-attachments/assets/ad2e6584-24fb-417f-a8d7-ae06879b2ffc" />

<br>
<br>
<br>

- Se corre y prueban las operaciones

<img width="1051" height="577" alt="image" src="https://github.com/user-attachments/assets/b43e932e-8761-4466-b2d3-9a6ae18983b6" />

## Calculadora en python

Para esto se pasan los archivos <code>EvalVisitor.java</code> y <code>Calc.java</code> a lenguaje python:

<img width="819" height="751" alt="image" src="https://github.com/user-attachments/assets/491807aa-9c5b-4d45-b005-53282c780b34" />

<img width="1027" height="953" alt="image" src="https://github.com/user-attachments/assets/b89e3896-4380-470d-93b0-9066216a933c" />

<br>
<br>
Para el caso de <code>LabeledExpr.g4</code> no es necesario pasarlo a otro lenguaje por lo que ANTLR4 genera el parser necesario para python, asi que se deja tal cual.
<br>
<br>
Para correrlo:

- Se instala ANTLR4 para python
<img width="977" height="655" alt="image" src="https://github.com/user-attachments/assets/9a52a164-ca99-4673-97f7-59db1de4a196" />

<br>
<br>
Si aparece este error se puede instalar desde apt de Ubuntu o crear un entorno virtual para python, en este caso el apt disponible no tiene una versión actualizada por lo que la mejor opción es un entorno virtual.

<br>
<br>
- Comandos para el entorno virtual y generación del parser:

<img width="976" height="355" alt="Captura desde 2025-09-01 10-40-48" src="https://github.com/user-attachments/assets/ef9119a0-4f5d-42de-893d-a4e2df244136" />
<img width="979" height="58" alt="image" src="https://github.com/user-attachments/assets/363bb67f-f296-4783-93b9-1b46d8a99298" />

<br>
<br>

- Para correr el archivo python con t.expr:

<img width="979" height="514" alt="image" src="https://github.com/user-attachments/assets/7b624ed9-1d24-4679-9082-acbad3f435e1" />

<br>
