#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern uint64_t mean(uint32_t *arr, uint32_t n, uint32_t m);

void print_arr(uint32_t *arr, uint32_t n, uint32_t m) {
    for (uint32_t i = 0; i < n; i++) {
        for (uint32_t j = 0; j < m; j++) {
            printf("%d\t", arr[i * m + j]);
        }
        printf("\n");
    }
}

int main() {
    uint32_t n, m;
    scanf("%d%d", &n, &m);

    uint32_t array[n][m];

    for (uint32_t i = 0; i < n; i++) {
        for (uint32_t j = 0; j < m; j++) {
            array[i][j] = rand();
        }
    }

    print_arr(&array[0][0], n, m);

    uint64_t result = mean(&array[0][0], n, m);

    printf("Mean returned: %ld\n", result);
    return 0;
}
