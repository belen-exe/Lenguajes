import sys

# S -> 0S0 | 1S1 | 0 | 1
def pg(ca):
    length = len(ca)
    
    if length == 0:
        return 0
    
    # Caso base: S -> 0 o S -> 1
    if length == 1:
        return ca[0] == '0' or ca[0] == '1'
    
    # Producción S -> 0 S 0
    if ca[0] == '0' and ca[-1] == '0':
        sub = ca[1:-1]
        return pg(sub)
    
    # Producción S -> 1 S 1
    if ca[0] == '1' and ca[-1] == '1':
        sub = ca[1:-1]
        return pg(sub)
    
    return 0


def main():
    if len(sys.argv) < 2:
        print("Uso: python script.py archivo.txt")
        sys.exit(1)

    archivo = sys.argv[1]
    with open(archivo, "r") as f:
        for line in f:
            line = line.strip()
            if line:  # ignorar lineas vacias
                if pg(line):
                    print("Acepta")
                else:
                    print("No acepta")

if __name__ == "__main__":
    main()

