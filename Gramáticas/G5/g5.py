import sys

def pg(ca):
    length = len(ca)

    if length == 0:
        return 0
    
    if length == 2:
        return ca[0] == 'b' or ca[0] == 'a'
    
    if ca[0] == 'a' and ca[-1] == 'b':
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
            if line:
                if pg(line):
                    print("Acepta")
                else:
                    print("No acepta")

if __name__ == "__main__":
    main()

