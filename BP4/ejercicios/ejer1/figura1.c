#include <stdio.h>
#include <time.h>

struct {
    int a;
    int b;
}

s[5000];

main()
{
    struct timespec ini,fin; double tiempo;
    int ii, i, X1, X2;
    int R[40000];

    clock_gettime(CLOCK_REALTIME,&ini);
    for (ii=0; ii<40000;ii++) {
        X1=0; X2=0;
        for(i=0; i<5000;i++)
            X1+=2*s[i].a+ii;
        for(i=0; i<5000;i++)
            X2+=3*s[i].b-ii;

        if (X1<X2)
            R[ii]=X1;
        else
            R[ii]=X2;
    }
    clock_gettime(CLOCK_REALTIME,&fin);

    tiempo=(double) (fin.tv_sec-ini.tv_sec)+( double) ((fin.tv_nsec-ini.tv_nsec)/(1.e+9));

    printf("Tiempo: %11.9f\t Primera componente: %d\t Ultima componente: %d\n", tiempo, R[0], R[39999]);

    return 0;
}