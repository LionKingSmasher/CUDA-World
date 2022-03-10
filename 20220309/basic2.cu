#include <stdio.h>

__global__ void add(int n1, int n2, int* n3) {
    printf("Calculate!\n");
    *n3 = n1 + n2;
}

int main(void){
    int c = 0;
    int *p_c;
    cudaMalloc((void**)&p_c, sizeof(int));
    add<<<1,1>>>(1, 1, p_c);
    cudaMemcpy(&c, p_c, sizeof(int), cudaMemcpyDeviceToHost);
    printf("1 + 1 = %d\n", c);
    cudaFree(p_c);
    return 0;
}