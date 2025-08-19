#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int cuenta_estados(FILE*);
int nestado(char, char **, int);
void obten_lenguaje(FILE*);
char** crea_tabla(FILE*, int);
void mostrar(char**, int);
void verifica_cadena(char**, int, FILE*);

int main()
{
    FILE *fd_conf, *fd_cadenas;
    int No_estados;
    char** tabla;

    //abrir archivo de configuración del AFD
    fd_conf = fopen("Conf.txt", "r");
    if(fd_conf == NULL)
    {
        perror("Error al abrir Conf.txt");
        exit(1);
    }

    //abrir archivo con cadenas de prueba
    fd_cadenas = fopen("Cadenas.txt", "r");
    if(fd_cadenas == NULL)
    {
        perror("Error al abrir Cadenas.txt");
        exit(1);
    }

    No_estados = cuenta_estados(fd_conf);
    obten_lenguaje(fd_conf);

    tabla = crea_tabla(fd_conf, No_estados);
    mostrar(tabla, No_estados);

    verifica_cadena(tabla, No_estados, fd_cadenas);

    fclose(fd_conf);
    fclose(fd_cadenas);

    return 0;
}

int cuenta_estados(FILE* fd)
{
    char cadena_cuenta[8];
    int c=-1;
    do
    {
        fgets(cadena_cuenta, 8, fd);
        c++;
    }
    while(cadena_cuenta[0]!='-');

    fseek(fd, 0, SEEK_SET);
    return c;
}

void obten_lenguaje(FILE* fd)
{
    char ca;
    char c[10];
    do
    {
        fgets(c, 8, fd);
    } 
    while(c[0]!='-');

    do
    {
        ca=fgetc(fd);
        printf("%c", ca);
    }
    while(ca!='\n');

    fseek(fd, 0, SEEK_SET);
}

char** crea_tabla(FILE* fd, int No_estados)
{
    char **tabla, c[8];
    tabla=(char **) calloc(No_estados, sizeof(char*));

    for(int j=0; j<No_estados; j++) 
    {
        tabla[j]=(char*) calloc (4, sizeof(char));
    }

    for(int f=0; f<No_estados; f++)
    {
        fgets(c, 8, fd);
        *(tabla[f]+0)=c[0];
        *(tabla[f]+1)=c[1];
        *(tabla[f]+2)=c[2];
        *(tabla[f]+3)=c[3];
    }
    return tabla;
}

void mostrar(char** tabla, int No_estados)
{
    printf("La tabla de transiciones es:\n");
    printf("  [d]+'0''1'\n");
    for(int f=0; f<No_estados; f++)
    {
        for(int c=0; c<4; c++)
        {
            printf("[%c]", *(tabla[f]+c));
        }
        printf("\n");
    }
    puts("");
}

void verifica_cadena(char** tabla, int No_estados, FILE* fd_cadenas)
{
    char verifica[100];
    while(fgets(verifica, 100, fd_cadenas) != NULL)
    {
        // quitar salto de línea
        verifica[strcspn(verifica, "\n")] = 0;

        char estadoa;
        int entrada = 0;

        // buscar estado inicial
        for(int k=0; k<No_estados; k++) {
            if((*(tabla[k]+0))=='>' || (*(tabla[k]+0))=='+')
            {
                estadoa = *(tabla[k]+1);
                break;
            }
        }

        if(verifica[0]=='E') {
            if(*(tabla[nestado(estadoa, tabla, No_estados)]+0)=='+' && !((verifica[1]=='1')||(verifica[1]=='0')))
            {
                printf("Cadena \"%s\" aceptada (E)\n", verifica);
                continue;
            }
            else if((verifica[1]=='1')||(verifica[1]=='0'))
            {
                entrada=1;
            }
        }

        while(verifica[entrada]!='\0')
        {
            if(verifica[entrada]=='0') 
            {
                estadoa= *(tabla[nestado(estadoa, tabla, No_estados)]+2);
            } 
            else 
            {
                estadoa=*(tabla[nestado(estadoa, tabla, No_estados)]+3);
            }
            entrada++;
        }

        if((*(tabla[nestado(estadoa, tabla, No_estados)]+0))=='+')
        {
            printf("Cadena \"%s\" aceptada\n", verifica);
        }
        else
        {
            printf("Cadena \"%s\" no aceptada\n", verifica);
        }
    }
}

int nestado(char estado, char **tabla, int No_estados)
{
    int con=0;
    for(int i=0; i<No_estados; i++)
    {
        if(estado==*(tabla[i]+1))
        {
            return con;
        }
        con++;
    }
    printf("No se encontró el estado\n");
}
