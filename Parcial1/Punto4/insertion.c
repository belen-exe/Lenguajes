#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Función recursiva para insertion sort
void insertionSortRecursive(int arr[], int n) {
    if (n <= 1) return;

    // Ordenar los primeros n-1 elementos
    insertionSortRecursive(arr, n - 1);

    int last = arr[n - 1];
    int j = n - 2;

    // Insertar arr[n-1] en la posición correcta
    while (j >= 0 && arr[j] > last) {
        arr[j + 1] = arr[j];
        j--;
    }
    arr[j + 1] = last;
}

int main() {
    int n = 900;
    int* data = (int*)malloc(n * sizeof(int));
    srand(time(NULL));

    for (int i = 0; i < n; i++) {
        data[i] = rand() % 100000;
    }

    clock_t inicio = clock();
    insertionSortRecursive(data, n);
    clock_t fin = clock();

    double tiempo = (double)(fin - inicio) / CLOCKS_PER_SEC;
    printf("Tiempo en C: %f segundos\n", tiempo);

    free(data);
    return 0;
}
