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

---

Cuenta los estados en esta función:

<img width="519" height="374" alt="image" src="https://github.com/user-attachments/assets/9e277e85-0067-49b6-91a8-7741b0ba92c4" />

---

Obtiene el lenguaje de entrada (los símbolos válidos, normalmente 0 y 1) con:

<img width="635" height="471" alt="image" src="https://github.com/user-attachments/assets/0deb14d8-67d0-4f4f-981b-3bb8ed3d7eb3" />

---

Crea la tabla de transiciones en memoria, es una matriz que guarda para cada estado el:
- Tipo de estado (>, + o vacío).
- Nombre del estado.
- Estado destino con 0.
- Estado destino con 1.

<img width="635" height="480" alt="image" src="https://github.com/user-attachments/assets/bbbe3faa-1199-4e32-9f3e-1fd00aaa0217" />

---

Muestra la matriz por medio de un for anidado:

<img width="585" height="353" alt="image" src="https://github.com/user-attachments/assets/27ddcd92-777d-4f03-81f8-55e676c3e4bc" />

---

Verifica cadenas de prueba desde un archivo Cadenas.txt, para cada cadena:
- Busca el estado inicial.
- Recorre la cadena símbolo por símbolo (0 o 1) siguiendo las transiciones en la tabla.
- Si la cadena es E (cadena vacía), verifica directamente si el estado inicial es de aceptación.
- Al final, determina si terminó en un estado de aceptación (+) y muestra si la cadena fue aceptada o rechazada.

<img width="1255" height="764" alt="image" src="https://github.com/user-attachments/assets/bcc763af-e7f9-4f8f-8c6f-99137cad4900" />
<img width="1000" height="593" alt="image" src="https://github.com/user-attachments/assets/33b49b71-f342-4260-a061-6de28d10c0ad" />


Aqui devuelve el índice en la tabla correspondiente a un estado dado.

<img width="727" height="358" alt="image" src="https://github.com/user-attachments/assets/c6ad2e8e-2312-40d9-b3d8-b0c272eaf748" />


## Resultados

En C:

<img width="1715" height="685" alt="image" src="https://github.com/user-attachments/assets/5c091dad-3521-47ad-bcf0-2f8b42f3635b" />

En Python:

<img width="1715" height="685" alt="image" src="https://github.com/user-attachments/assets/0b4655d8-4ddb-44bd-81e9-744343c5e92c" />
