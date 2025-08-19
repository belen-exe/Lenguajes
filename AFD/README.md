# Autómata Finito Determinista

El código lee un AFD desde un archivo, construye su tabla de transiciones y evalúa cadenas de entrada para decir si son aceptadas o no según el autómata y su configuración.

## Funcionamiento
<img width="654" height="842" alt="image" src="https://github.com/user-attachments/assets/0a570cd2-f623-465d-bfab-506b3b16f17b" />

Lee la configuración del AFD desde un archivo <code>Conf.txt</code> y las cadenas en <code>Cadenas.txt</code>
- En <code>Conf.txt</code> Cada línea del archivo representa un estado y sus transiciones.
- La primera columna indica si es estado inicial (>), de aceptación (+), o ninguno.
- La segunda columna es el nombre del estado.
- La tercera y cuarta columna indican el estado destino si se lee un 0 o un 1.

<img width="1049" height="400" alt="image" src="https://github.com/user-attachments/assets/a59dca08-59f1-4bc3-a887-b6511bac61ab" />
El carácter - marca el fin de la definición de estados.


Cuenta los estados en esta función:

<img width="519" height="374" alt="image" src="https://github.com/user-attachments/assets/9e277e85-0067-49b6-91a8-7741b0ba92c4" />


Obtiene el lenguaje de entrada (los símbolos válidos, normalmente 0 y 1) con:

<img width="635" height="471" alt="image" src="https://github.com/user-attachments/assets/0deb14d8-67d0-4f4f-981b-3bb8ed3d7eb3" />


Crea la tabla de transiciones en memoria, es una matriz que guarda para cada estado el:
- Tipo de estado (>, + o vacío).
- Nombre del estado.
- Estado destino con 0.
- Estado destino con 1.

<img width="635" height="480" alt="image" src="https://github.com/user-attachments/assets/bbbe3faa-1199-4e32-9f3e-1fd00aaa0217" />


Muestra la matriz por medio de un for anidado:

<img width="585" height="353" alt="image" src="https://github.com/user-attachments/assets/27ddcd92-777d-4f03-81f8-55e676c3e4bc" />
