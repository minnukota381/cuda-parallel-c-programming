
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void evenOrOdd(int num) {
    if (num % 2 == 0) {
        printf("%d is even\n", num);
    }
    else {
        printf("%d is odd\n", num);
    }
}

int main() {
    int num;
    printf("enter number");
    scanf("%d", &num);
    evenOrOdd << <1, 1 >> > (num);
    cudaDeviceSynchronize();
    return 0;
}


