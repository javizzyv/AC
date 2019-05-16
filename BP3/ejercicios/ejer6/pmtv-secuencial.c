#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char ** argv) {
    int i, j;

    if(argc < 2) {
        fprintf(stderr, "Falta el tamaño del vector/matriz\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]);

    int *vector, *resultado, **matriz;
    vector = (int *) malloc(N*sizeof(int));
    resultado = (int *) malloc(N*sizeof(int));
    matriz = (int **) malloc(N*sizeof(int*));

    for (i=0; i<N; i++){
        matriz[i] = (int*) malloc(N*sizeof(int));
    }

    for (i = 0; i < N; i++) {
        vector[i] = 2;
        resultado[i] = 0;
        for (j = 0; j<N; j++){
            if(j >= i)
                matriz[i][j] = 3;
            else
                matriz[i][j] = 0;
        }
    }

    if(N<20){
        printf("La matriz es: ");
        printf("\n");
        for (i = 0; i < N; i++) {
            for (j = 0; j < N; j++){
                printf("%d ", matriz[i][j]);
            }
            printf("\n");
        }

        printf("\n");
        printf("\n");
    }

    if(N<20){
        printf("El vector es: ");
        printf("\n");
        for (i = 0; i < N; i++){
            printf("%d ", vector[i]);
        }
        printf("\n");
        printf("\n");
    }

    for (i = 0; i < N; i++){
        for (j = i; j < N; j++){
            resultado[i] += matriz[i][j] * vector[j];
        }
    }

    printf("\n");

    printf("El resultado es:");
    printf("\n");
    if(N<20){
        for (i = 0; i < N; i++){
            printf("%d ", resultado[i]);
        }
    }
    else{
        printf("El primer componente es %d ", resultado[0]);
        printf("\n");
        printf("El ultimo componente es %d ", resultado[N-1]);
    }

    for (i = 0; i < N; i++){
        free(matriz[i]);
    }

    free(matriz);
    free(vector);
    free(resultado);

    printf("\n");
    printf("\n");
}