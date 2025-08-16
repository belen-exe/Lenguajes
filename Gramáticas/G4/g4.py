import sys
import re

def main():
    if len(sys.argv) < 2:
        print("Uso: python script.py archivo.txt")
        sys.exit(1)

    archivo = sys.argv[1]
    with open(archivo, "r") as f:
        for line in f:
            line = line.strip()

            if not line:
                continue

            if line == "abb":
                print("acepta")
            elif line == "ab":
                print("acepta")
            elif re.fullmatch(r"[a-zA-Z0-9]+", line):
                print("no acepta")
            else:
                print("no acepta")

if __name__ == "__main__":
    main()

