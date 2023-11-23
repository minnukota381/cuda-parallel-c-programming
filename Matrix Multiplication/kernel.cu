#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include<malloc.h>

__global__ void matadd(int* l, int* m, int* n)
{
    int x = blockIdx.x;
    int y = blockIdx.y;
    int id = gridDim.x * y + x;
    n[id] = n[id]+l[id] * m[id];
}
int main()
{
    int a[2][2];
    int b[2][2];
    int c[2][2];
    int* d, * e, * f;
    int i, j,k;
    printf("\n Enter elements of first matrix of size 2 * 2\n");
    for (i = 0; i < 2; i++)
    {
        for (j = 0; j < 2; j++)
        {
            scanf("%d", &a[i][j]);
        }
    }
    printf("\n Enter elements of second matrix of size 2 * 2\n");

    for (i = 0; i < 2; i++)
    {
        for (j = 0; j < 2; j++)
        {
            scanf("%d", &b[i][j]);
        }
    }
    cudaMalloc((void**)&d, 2 * 2 * sizeof(int));
    cudaMalloc((void**)&e, 2 * 2 * sizeof(int));
    cudaMalloc((void**)&f, 2 * 2 * sizeof(int));
    cudaMemcpy(d, a, 2 * 2 * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(e, b, 2 * 2 * sizeof(int), cudaMemcpyHostToDevice);

    dim3 grid(2, 2);
    /* Here we are defining two dimensional Grid(collection of blocks) structure. Syntax is dim3 grid(no. of columns,no. of rows) */
    
    matadd << <grid, 1 >> > (d, e, f);
    for (i = 0; i < 2; i++)
    {
        for (j = 0; j < 2; j++)
        {
            c[i][j] = 0;
            for (k = 0; k < 2; k++)
            {
               
                c[i][j] = c[i][j] + a[i][k] * b[k][j];
                
            }
        }
        printf("\n");
    }
    cudaMemcpy(c, f, 2 * 2 * sizeof(int), cudaMemcpyDeviceToHost);
    printf("\nSum of two matrices:\n ");
    for (i = 0; i < 2; i++)
    {
        for (j = 0; j < 2; j++)
        {
            printf("%d\t", c[i][j]);
        }
        printf("\n");
    }
    cudaFree(d);
    cudaFree(e);
    cudaFree(f);
    return 0;
}
