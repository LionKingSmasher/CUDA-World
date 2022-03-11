#include <stdio.h>

#define N 100

__global__ void add(int* a){
    int tid = blockIdx.x;
    for(int i = 0; i <= tid; i++)
        a[tid] += i;
    printf("Calculate Complete: %d\n", tid);
}

int main(void){
    int a[N] = {0,};
    int *dev_a;      // 'a' array value for device 0
    cudaMalloc((void**)&dev_a, N * sizeof(int));
    cudaMemcpy(dev_a, a, N * sizeof(int), cudaMemcpyHostToDevice); // copy 'a' array value
    add<<<N, 1>>>(dev_a);
    cudaMemcpy(a, dev_a, N * sizeof(int), cudaMemcpyDeviceToHost); 
    printf("Result: ");
    for(int i = 0; i < N; i++){
        printf("%d ", a[i]);
    }
    cudaFree(dev_a);
    printf("\n");
    return 0;
}