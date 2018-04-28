#include <iostream>
#include <cuda_runtime.h>
__global__ void  kernel(void)
{
    
}


int main()
{
    
    kernel<<<1,1>>>();
    std::cout << "Hello World!" << std::endl;
    return 0;

}

