#include <interface.h>

int main()
{
    int nelem = 32;
    int a[nelem];
    int b[nelem];
    int c[nelem];
    
    for(int i = 0; i <nelem; i++)
    {
        a[i] =i;
        b[i] = 5*i;
    }
    ADD( a, b, c, nelem );
    for(int i = 0; i < nelem; i++)
    {
        std::cout << a[i] << " " << b[i] << " " << c[i] << std::endl;
    }

    return 0;
}  

