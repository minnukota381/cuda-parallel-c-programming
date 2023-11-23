#include <stdio.h>
#include <cuda.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include<malloc.h>


#define N 20

__global__ void add(int* a, int* b, int* c)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid <= 5)
        c[tid] = a[tid] + b[tid];
    else if(tid>5 && tid<=10)
        c[tid] = a[tid] * b[tid];
    else if (tid > 10 && tid <= 15)
        c[tid] = a[tid] - b[tid];
    else
        c[tid] = a[tid] / b[tid];

 
}

int main()
{
    int a[N], b[N], c[N];
    int* dev_a, * dev_b, * dev_c;

    cudaMalloc((void**)&dev_a, N * sizeof(int));
    cudaMalloc((void**)&dev_b, N * sizeof(int));
    cudaMalloc((void**)&dev_c, N * sizeof(int));

    for (int i = 0; i < N; i++) {
        a[i] = i;
        b[i] = i;
    }

    cudaMemcpy(dev_a, a, N * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(dev_b, b, N * sizeof(int), cudaMemcpyHostToDevice);

    add << <(N + 255) / 256, 256 >> > (dev_a, dev_b, dev_c);

    cudaMemcpy(c, dev_c, N * sizeof(int), cudaMemcpyDeviceToHost);

    for (int i = 0; i < N; i++) {
        
        if (i <= 5)
        {
            if (i == 0)
            {
                printf("ADDITION\n");
            }
            printf("%d + %d = %d\n", a[i], b[i], c[i]);
        }
        else if(i>5 && i<=10)
        {
            if (i == 6)
            {
                printf("MULTIPLICATION\n");
            }
            printf("%d * %d = %d\n", a[i], b[i], c[i]);
        }
        else if (i > 10 && i <= 15)
        {
            if (i == 11)
            {
                printf("SUBSTRACTION\n");
            }
            printf("%d - %d = %d\n", a[i], b[i], c[i]);
        } 
        else
        {
            if (i == 16)
            {
                printf("DIVISION\n");
            }
            printf("%d / %d = %d\n", a[i], b[i], c[i]);
        }
            
        
    }

    cudaFree(dev_a);
    cudaFree(dev_b);
    cudaFree(dev_c);

    return 0;
}
