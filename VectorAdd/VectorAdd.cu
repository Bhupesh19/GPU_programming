#include <iostream>
#include <cuda_runtime.h>

__global__ void GPUAdd( int *a, int *b, int *c, int no_elements)
{
        c[threadIdx.x] = a[threadIdx.x] + b[threadIdx.x];
}

int main()
{
    int no_elements =32;
    int a_host[no_elements];
    int b_host[no_elements];
    int c_host[no_elements];
    
    for(int i = 0; i < no_elements; i++)
    {
        a_host[i] = i;
        b_host[i] = 12*i;
    }

    int *a_dev, *b_dev, *c_dev;
    cudaMalloc(&a_dev, no_elements*sizeof(int));
    cudaMalloc(&b_dev, no_elements*sizeof(int));
    cudaMalloc(&c_dev, no_elements*sizeof(int));
    
    cudaMemcpy(a_dev, a_host, no_elements*sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(b_dev, b_host, no_elements*sizeof(int), cudaMemcpyHostToDevice);

    GPUAdd<<<1,no_elements>>>(a_dev, b_dev, c_dev, no_elements);
    cudaMemcpy(c_host, c_dev, no_elements*sizeof(int), cudaMemcpyDeviceToHost);
    
    cudaFree(a_dev);
    cudaFree(b_dev);
    cudaFree(c_dev);
    
    for(int i = 0; i < no_elements; i++)
        std::cout << "GPU computed resutl: " << c_host[i] << std::endl;

    return 0;

}


