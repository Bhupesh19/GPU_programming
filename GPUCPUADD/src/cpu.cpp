#include<cpu.h>

void AddCPU( int *a, int *b, int *c, int no_elem)
{
    std::cout << "Run from the CPU" << std::endl;
    for(int i = 0; i < no_elem; i++)
    {
        c[i] = a[i] + b[i] ; 
    }

}

