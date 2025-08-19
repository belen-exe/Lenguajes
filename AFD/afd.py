import sys

def cuenta_estados(fd):
    c = -1
    while True:
        cadena_cuenta = fd.readline()
        if not cadena_cuenta:
            break
        c += 1
        if cadena_cuenta[0] == '-':
            break
    fd.seek(0)
    return c

def obten_lenguaje(fd):
    while True:
        c = fd.readline()
        if not c:
            break
        if c[0] == '-':
            break

    while True:
        ca = fd.read(1)
        if not ca:
            break
        print(ca, end="")
        if ca == "\n":
            break

    fd.seek(0)

def crea_tabla(fd, No_estados):
    tabla = []
    for _ in range(No_estados):
        tabla.append(['']*4)

    for f in range(No_estados):
        c = fd.readline()
        tabla[f][0] = c[0]
        tabla[f][1] = c[1]
        tabla[f][2] = c[2]
        tabla[f][3] = c[3]
    return tabla

def mostrar(tabla, No_estados):
    print("La tabla de transiciones es:")
    print("  [d]+'0''1'")
    for f in range(No_estados):
        for c in range(4):
            print(f"[{tabla[f][c]}]", end="")
        print()
    print()

def nestado(estado, tabla, No_estados):
    con = 0
    for i in range(No_estados):
        if estado == tabla[i][1]:
            return con
        con += 1
    print("No se encontró el estado")

def verifica_cadena(tabla, No_estados, fd_cadenas):
    for verifica in fd_cadenas:
        verifica = verifica.strip()

        estadoa = ''
        entrada = 0

        # buscar estado inicial
        for k in range(No_estados):
            if tabla[k][0] == '>' or tabla[k][0] == '+':
                estadoa = tabla[k][1]
                break

        if len(verifica) > 0 and verifica[0] == 'E':
            if tabla[nestado(estadoa, tabla, No_estados)][0] == '+' and not (len(verifica) > 1 and (verifica[1] == '1' or verifica[1] == '0')):
                print(f'Cadena "{verifica}" aceptada (E)')
                continue
            elif len(verifica) > 1 and (verifica[1] == '1' or verifica[1] == '0'):
                entrada = 1

        while entrada < len(verifica) and verifica[entrada] != '\0':
            if verifica[entrada] == '0':
                estadoa = tabla[nestado(estadoa, tabla, No_estados)][2]
            else:
                estadoa = tabla[nestado(estadoa, tabla, No_estados)][3]
            entrada += 1

        if tabla[nestado(estadoa, tabla, No_estados)][0] == '+':
            print(f'Cadena "{verifica}" aceptada')
        else:
            print(f'Cadena "{verifica}" no aceptada')

def main():
    try:
        fd_conf = open("Conf.txt", "r")
    except:
        print("Error al abrir Conf.txt", file=sys.stderr)
        sys.exit(1)

    try:
        fd_cadenas = open("Cadenas.txt", "r")
    except:
        print("Error al abrir Cadenas.txt", file=sys.stderr)
        sys.exit(1)

    No_estados = cuenta_estados(fd_conf)
    obten_lenguaje(fd_conf)

    tabla = crea_tabla(fd_conf, No_estados)
    mostrar(tabla, No_estados)

    verifica_cadena(tabla, No_estados, fd_cadenas)

    fd_conf.close()
    fd_cadenas.close()

if __name__ == "__main__":
    main()
