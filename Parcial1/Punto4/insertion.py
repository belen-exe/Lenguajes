import random
import time

def insertionSortRecursive(arr, n):
    if n <= 1:
        return

    insertionSortRecursive(arr, n - 1)
    last = arr[n - 1]
    j = n - 2

    while j >= 0 and arr[j] > last:
        arr[j + 1] = arr[j]
        j -= 1
    arr[j + 1] = last

n = 3000
data = [random.randint(1, 100000) for _ in range(n)]

inicio = time.time()
insertionSortRecursive(data, n)
fin = time.time()

print(f"Tiempo en Python: {fin - inicio:.6f} segundos")
