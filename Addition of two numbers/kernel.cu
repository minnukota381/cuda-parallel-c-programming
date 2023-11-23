
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include<malloc.h>
#include<stdlib.h>

__global__ void addKernel(int* a, int* b, int* c)
{
	*c = *a + *b;
}
__global__ void SubKernel(int* a, int* b, int* d)
{
	*d = *a - *b;
}

int main(void )
	{
	int *a, *b, *c,*d;
	int* d_a, * d_b, * d_c,*d_d;
	
	a = (int*)malloc(sizeof(int));
	b = (int*)malloc(sizeof(int));
	c = (int*)malloc(sizeof(int));
	d = (int*)malloc(sizeof(int));

	cudaMalloc((int **)&d_a, sizeof(int));
	cudaMalloc((int **)&d_b, sizeof(int));
	cudaMalloc((int **)&d_c, sizeof(int));
	cudaMalloc((int**)&d_d, sizeof(int));

	
	printf("Values of two numbers\n");
	scanf("%d%d", a, b);

	cudaMemcpy(d_a, a, sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(d_b, b, sizeof(int), cudaMemcpyHostToDevice);

	addKernel << <1, 10 >> > (d_a, d_b, d_c);
	SubKernel << <1, 5 >> > (d_a, d_b, d_d);


	cudaMemcpy(c, d_c, sizeof(int), cudaMemcpyDeviceToHost);
	cudaMemcpy(d, d_d, sizeof(int), cudaMemcpyDeviceToHost);
	
	printf("Substraction : %d\n", *d);

	return 0;
	}
