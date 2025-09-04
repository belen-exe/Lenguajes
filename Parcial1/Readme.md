# Parcial 1

## Punto 1

Se implementó un AFD que acpeta como alfabeto {a, b, c} cuyo mínima cadena posible es "abc" y acepta vacío representado como E

Grafo:
![grafo](https://github.com/user-attachments/assets/1926c346-22a7-4ce6-8e02-f336e678cb6d)

<br>

Matriz:
![matriz](https://github.com/user-attachments/assets/db4764da-4c18-4414-a0ba-bf6a75e78a79)

<br>

Pruebas:
<img width="1696" height="665" alt="image" src="https://github.com/user-attachments/assets/17a99a8d-55bc-49aa-b69a-c49945eb6a92" />


## Punto 2

Grámatica implementada a python:
<img width="1561" height="333" alt="image" src="https://github.com/user-attachments/assets/53add39e-a49f-47bf-abea-9b6caa657a64" />

<br>

## Punto 3

Raiz cuadrada de números reales implementada en flex y bison:
<img width="1306" height="486" alt="image" src="https://github.com/user-attachments/assets/af52b0b2-3d13-4dfc-ae46-800f844aa188" />

## Punto 4

Se evaluó el rendimiento de dos lenguaje: C y Python, con un método de ordenamiento Insertion Sort, se midió el tiempo que tardaba en hacer el ordenamiento.

C:
| Ejecución | n = 500  | n = 900  | n = 5000 |
|-----------|----------|----------|----------|
| 1         | 0.000216 | 0.000691 | 0.016943 |
| 2         | 0.000185 | 0.000644 | 0.017169 |
| 3         | 0.000187 | 0.000744 | 0.017007 |
| 4         | 0.000298 | 0.000559 | 0.017247 |
| 5         | 0.000205 | 0.000583 | 0.017809 |
| **Promedio (s)** | **0.0002182** | **0.0006442** | **0.017232** |

<br>

<img width="808" height="581" alt="image" src="https://github.com/user-attachments/assets/85ef11be-db88-454c-929d-7a66dc34c429" />

<br>
<br>

En python:
| Ejecución | n = 500   | n = 900   | n = 5000        |
|-----------|-----------|-----------|-----------------|
| 1         | 0.007936  | 0.012665  | RecursionError  |
| 2         | 0.003527  | 0.013957  | RecursionError  |
| 3         | 0.003348  | 0.012856  | RecursionError  |
| 4         | 0.003973  | 0.012768  | RecursionError  |
| 5         | 0.006318  | 0.013366  | RecursionError  |
| **Promedio (s)** | **0.0050204** | **0.0131224** | **RecursionError** |

<br>

<img width="1580" height="980" alt="image" src="https://github.com/user-attachments/assets/401fa72c-0a7e-4b12-9823-6bd388f116f7" />

<br>
<br>

Conclusiones:

<img width="802" height="589" alt="image" src="https://github.com/user-attachments/assets/aae4032c-d593-4573-a661-58de675169f7" />


- C es miles de veces más rápido que Python en este tipo de cálculo.  
- Python alcanza su límite de recursión (más o menos 1000), lo que impide trabajar con entradas grandes como `n=5000`.


<img width="683" height="387" alt="image" src="https://github.com/user-attachments/assets/cb5dae57-3022-49b4-9d0a-c3570fff2b1f" />
<br>

- El resultado evidencia la diferencia entre un lenguaje compilado y uno interpretado:  
  - C - traducido a código máquina eficiente.  
  - Python - ejecutado por un intérprete, con más sobrecarga y límites internos.  
