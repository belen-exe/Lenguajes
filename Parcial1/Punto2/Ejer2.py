import re

patron = r"[a-zA-Z][a-zA-Z0-9]*"

with open("archivo.txt", "r") as f:
    for l in f:
        cadena = l.strip()
        if cadena:
            if re.match(patron, cadena):
                print(f"{cadena}: Acepta")
            else:
                print(f"{cadena}: No acepta")
