#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 1000

double m1[MAX][MAX], m2[MAX][MAX], m3[MAX][MAX];

int main(int argc, char **argv) {
    int i, j, k;
    struct timespec ini,fin; double tiempo;
    int N=MAX;

    for (i = 0; i < N; ++i) {
        for (j = 0; j < N; ++j) {
            m1[i][j] = 2;
            m2[i][j] = 3;
            m3[i][j] = 0;
        }
    }

    clock_gettime(CLOCK_REALTIME,&ini);
    for (i = 0; i < N; i++){
        for (j = 0; j < N; ++j)
            for(k = 0; k < N; ++k)
                m3[i][j] = m1[i][k] * m2[k][j];
    }
    clock_gettime(CLOCK_REALTIME,&fin);
    tiempo=(double) (fin.tv_sec-ini.tv_sec)+( double) ((fin.tv_nsec-ini.tv_nsec)/(1.e+9));

    printf("\n");


    printf("Primer componente: %f ", m3[0][0]);
    printf("\n");
    printf("Segundo componente: %f ", m3[N-1][N-1]);
    printf("\n");


    printf("Time: %11.9f\t\n", tiempo);

    return 0;
}