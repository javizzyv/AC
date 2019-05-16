#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char ** argv) {
    int i, j, k;
    double ini, fin;

    if(argc < 2) {
        fprintf(stderr, "Falta el tamaño del vector/matriz\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]);
    int **m1, **m2, **m3;
    m1 = (int **) malloc(N*sizeof(int*));
    m2 = (int **) malloc(N*sizeof(int*));
    m3 = (int **) malloc(N*sizeof(int*));

    for (i = 0; i < N; ++i) {
        m1[i] = (int*) malloc(N*sizeof(int));
        m2[i] = (int*) malloc(N*sizeof(int));
        m3[i] = (int*) malloc(N*sizeof(int));
    }

    #pragma omp parallel for private(j,k)
    for (i = 0; i < N; ++i) {
        for (j = 0; j < N; ++j) {
            m1[i][j] = 2;
            m2[i][j] = 3;
            m3[i][j] = 0;
        }
    }

    ini = omp_get_wtime();
    #pragma omp parallel for private(j,k)
    for (i = 0; i < N; i++){
        for (j = 0; j < N; ++j)
            for(k = 0; k < N; ++k)
                m3[i][j] = m1[i][k] * m2[k][j];
    }
    fin = omp_get_wtime();

    printf("\n");

    if(N<20){
        printf("El resultado sería:");
        printf("\n");
        for (i = 0; i < N; ++i) {
            for(j = 0; j < N; ++j)
                printf("%d ", m3[i][j]);
            printf("\n");
        }
    }
    else{
        printf("Primer componente: %d ", m3[0][0]);
        printf("\n");
        printf("Segundo componente: %d ", m3[N-1][N-1]);
        printf("\n");
    }

    printf("\n");
    printf("Tiempo: %11.9f\t", fin-ini);
    printf("\n");
    printf("\n");

    for (i = 0; i < N; i++) {
        free(m1[i]);
        free(m2[i]);
        free(m3[i]);
    }

  free(m1);
  free(m2);
  free(m3);
}