#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc < 3) {
        fprintf(stderr, "Falta el tamanio y/o la constante multiplicativa\n");
        exit(1);
    }

    unsigned n = strtol(argv[1], NULL, 10);
    struct timespec ini,fin; double tiempo;
    int a = strtol(argv[2], NULL, 10);
    int *y, *x;
    y = (int*) malloc(n*sizeof(int));
    x = (int*) malloc(n*sizeof(int));
    unsigned int i;

    for (i=0; i<n; i++) {
        y[i] = i+2;
        x[i] = i*2;
    }

    clock_gettime(CLOCK_REALTIME, &ini);
    for (i=0; i<n; i++){
        y[i] += a*x[i];
    }
    clock_gettime(CLOCK_REALTIME, &fin);

    tiempo=(double) (fin.tv_sec-ini.tv_sec)+( double) ((fin.tv_nsec-ini.tv_nsec)/(1.e+9));
    printf("Tiempo: %11.9f\t Primer elemento: %d\t Ultimo elemento: %d\n", tiempo, y[0], y[n-1]);

    free(y);
    free(x);

    return 0;
    }