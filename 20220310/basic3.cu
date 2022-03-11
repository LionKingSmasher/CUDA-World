#include <stdio.h>

/*
 *
 * struct cudaDeviceProp {
 *     char name[256]; // device name
 *     size_t totoalGlobalMem;
 *     size_t sharedMemPerBlock;
 *     int regsPerBlock;
 *     int wrapSize;
 *     size_t memPitch;
 *     int maxThreadsPerBlock;
 *     int maxThreadsDim[3];
 *     int maxGridSize[3];
 *     size_t totalConstMem;
 *     int major;     // device major number
 *     int minor;     // device minor number
 *     int clockRate;
 *     size_t textureAlignment;
 *     int deviceOverlap;
 *     int multiProcessorCount;
 *     int kernelExecTimeoutEnabled;
 *     int integrated;
 *     int canMapHostMemory;
 *     int computeMode;
 *     int maxTexture1D;
 *     int maxTexture2D[2];
 *     int maxTexture3D[3];
 *     int maxTexture3dArray[3];
 *     int concurrentKernels;
 * };
 */

int main(void){
    cudaDeviceProp prop;
    int count;

    cudaGetDeviceCount(&count);
    for(int i = 0; i < count; i++){
        cudaGetDeviceProperties(&prop, i);
        printf("--------- Dveice %d ---------\n", i);
        printf("Name: %s\n", prop.name);
        printf("Capability: %d.%d\n", prop.major, prop.minor);
        printf("Clock Rate: %d\n", prop.clockRate);
        printf("Device copy overlap: ");
        if(prop.deviceOverlap)
            printf("Enabled!\n");
        else
            printf("Disabled!\n");
        printf("-----------------------------\n");
    }

    return 0;
}