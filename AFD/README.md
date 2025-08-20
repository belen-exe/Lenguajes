# Autómata Finito Determinista

El código lee un AFD desde un archivo, construye su tabla de transiciones y evalúa cadenas de entrada para decir si son aceptadas o no según el autómata y su configuración.

## Funcionamiento


### Main

<img width="654" height="842" alt="image" src="https://github.com/user-attachments/assets/0a570cd2-f623-465d-bfab-506b3b16f17b" />

Lee la configuración del AFD desde un archivo <code>Conf.txt</code> y las cadenas en <code>Cadenas.txt</code>
- En <code>Conf.txt</code> Cada línea del archivo representa un estado y sus transiciones.
- Cuenta los estados en el automata.
- Imprime el alfabeto agregado en <code>Conf.txt</code> 
- Se crea y guarda la tabla de transiciones
- Verifica las cadenas dentro del .txt

<img width="1049" height="400" alt="image" src="https://github.com/user-attachments/assets/a59dca08-59f1-4bc3-a887-b6511bac61ab" />
El carácter - marca el fin de la definición de estados.

<br>
<br>

### Cuenta_estados

Cuenta los estados que definimos en <code>Conf.txt</code> hasta encontrar un '-' y pare de contar

<img width="519" height="374" alt="image" src="https://github.com/user-attachments/assets/9e277e85-0067-49b6-91a8-7741b0ba92c4" />

<br>
<br>

### Obten_lenguaje

Obtiene el lenguaje después del '-'. Esto se hace principalmente para saber que hace la configuración que implementamos o agregar notas adicionales. 

<img width="635" height="471" alt="image" src="https://github.com/user-attachments/assets/0deb14d8-67d0-4f4f-981b-3bb8ed3d7eb3" />

<br>
<br>

### Crea_tabla

Crea la tabla de transiciones en memoria, es una matriz que guarda para cada estado el:
- Tipo de estado (>, + o vacío).
- Nombre del estado.
- Estado destino con 0.
- Estado destino con 1.

Rellena la tabla de forma vertical una vez reconozca cual es su posición (alguna de las 4 anteriores), hasta llegar al final de esta y salirse del bucle.

<img width="635" height="480" alt="image" src="https://github.com/user-attachments/assets/bbbe3faa-1199-4e32-9f3e-1fd00aaa0217" />

<br>
<br>

### Mostrar

Muestra la matriz por medio de un for anidado:

<img width="585" height="353" alt="image" src="https://github.com/user-attachments/assets/27ddcd92-777d-4f03-81f8-55e676c3e4bc" />

<br>
<br>

### Verifica_cadena

Verifica cadenas de prueba desde un archivo Cadenas.txt, para cada cadena:
- Busca el estado inicial.
- Recorre la cadena símbolo por símbolo (0 o 1) siguiendo las transiciones en la tabla.
- Si la cadena es E (cadena vacía), verifica directamente si el estado inicial es de aceptación.
- Al final, determina si terminó en un estado de aceptación (+) y muestra si la cadena fue aceptada o rechazada.

<img width="1255" height="764" alt="image" src="https://github.com/user-attachments/assets/bcc763af-e7f9-4f8f-8c6f-99137cad4900" />
<img width="1000" height="593" alt="image" src="https://github.com/user-attachments/assets/33b49b71-f342-4260-a061-6de28d10c0ad" />

<br>
<br>

### nestado

traduce el nombre del estado ('0','1','2', o las que se inserten) al índice de la fila en la tabla, para que otras funciones (como verifica_cadena) sepan a dónde ir a buscar las transiciones

<img width="727" height="358" alt="image" src="https://github.com/user-attachments/assets/c6ad2e8e-2312-40d9-b3d8-b0c272eaf748" />


## Resultados

Teniendo en cuenta este grafo:

![WhatsApp Image 2025-08-18 at 11 15 44 PM](https://github.com/user-attachments/assets/81153030-459e-4eb6-91ee-a483d9360322)


En C:

<img width="1715" height="685" alt="image" src="https://github.com/user-attachments/assets/5c091dad-3521-47ad-bcf0-2f8b42f3635b" />

En Python:

<img width="1715" height="685" alt="image" src="https://github.com/user-attachments/assets/0b4655d8-4ddb-44bd-81e9-744343c5e92c" />

<br>
<br>

Otro ejemplo:

<img width="1008" height="357" alt="image" src="https://github.com/user-attachments/assets/f7a9a591-0a7e-46a4-b09c-3e652742eaa9" />

En C:

<img width="1254" height="546" alt="image" src="https://github.com/user-attachments/assets/1d7b81b9-bdae-4b0e-908e-f36dcfb3285f" />

En python:

<img width="1254" height="546" alt="image" src="https://github.com/user-attachments/assets/82207ad4-cfda-44b1-951a-600ce99a99da" />
