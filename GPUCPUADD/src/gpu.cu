#include<gpu.h>

__global__ void GADD(int *a , int *b, int *c)
{
    c[threadIdx.x] = a[threadIdx.x] + b[threadIdx.x];
}


void AddGPU( int *a, int *b, int *c, int no_elem)
{
    std::cout << "FROM GPU" << std::endl;
    int *a_dev,*b_dev,*c_dev;
    cudaMalloc(&a_dev, no_elem*sizeof(int));
    cudaMalloc(&b_dev, no_elem*sizeof(int));
    cudaMalloc(&c_dev, no_elem*sizeof(int));

    cudaMemcpy(a_dev,a, no_elem*sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(b_dev, b, no_elem*sizeof(int), cudaMemcpyHostToDevice);
    GADD<<<1,no_elem>>>(a_dev, b_dev, c_dev);
    cudaMemcpy(c, c_dev, no_elem*sizeof(int), cudaMemcpyDeviceToHost);
    
    cudaFree(a_dev);
    cudaFree(b_dev);
    cudaFree(c_dev);

}       
