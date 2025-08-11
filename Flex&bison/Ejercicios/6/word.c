#include <stdio.h>
#include <ctype.h>
#include <time.h>

int main(void)
{
    clock_t start, end;
    double cpu_time_used;

    int chars = 0;
    int words = 0;
    int lines = 0;
    int c;
    int in_word = 0;

    start = clock();

    while ((c = getchar()) != EOF) 
    {
        chars++;

        if (c == '\n') 
        {
            lines++;
        }

        if (isalpha(c)) 
        {
            if (!in_word) 
            {
                words++;
                in_word = 1;
            }
        } else {
            in_word = 0;
        }
    }

    end = clock();
    cpu_time_used = ((double)(end - start)) / CLOCKS_PER_SEC;

    printf("%8d%8d%8d\n", lines, words, chars);
    printf("Tiempo de ejecución: %f segundos\n", cpu_time_used);

    return 0;
}
