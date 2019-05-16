#include <stdio.h>
#include <time.h>
#define VECTOR_DYNAMIC
//#define VECTOR_GLOBAL
#include <stdlib.h>
#include <omp.h>
#define MAX 33554432	//=2^25

int main(int argc, char **argv){

    if(argc<2){
        printf("No hay suficientes argumentos\n");
        exit(-1);
    }

    struct timespec cgtini, cgtfin;
    double ncgt;
    unsigned int n=atoi(argv[1]);

    #ifdef VECTOR_GLOBAL
        if(n>MAX)
            n=MAX;
    #endif

    int i, j;

    #ifdef VECTOR_DYNAMIC
        double *v1, *v2, **m;
        v1 = (double*) malloc(n*sizeof(double));
        v2 = (double*) malloc(n*sizeof(double));
        m = (double**) malloc(n*sizeof(double*));
        if((v1==NULL || v2 == NULL || m==NULL)){
            printf("No se ha podido reservar el espacio\n");
            exit(-2);
        }

        for(i=0;i<n;i++){
            m[i]=(double*) malloc(n*sizeof(double));
            if(m[i]==NULL){
                printf("No se ha podido reservar espacio\n");
                exit(-2);
            }
        }
    #endif

    for(i=0;i<n;i++){
        v1[i]=n*0.1+i*0.1;
        v2[i]=0;
        for(j=0;j<n;j++)
            m[i][j]=i*0.1+j*0.1;
    }

    clock_gettime(CLOCK_REALTIME,&cgtini);

    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
            v2[i]+=m[i][j]*v1[j];

    clock_gettime(CLOCK_REALTIME,&cgtfin);
    ncgt=(double) (cgtfin.tv_sec-cgtini.tv_sec)+ (double) ((cgtfin.tv_nsec-cgtini.tv_nsec)/(1.e+9));

    if(n<10){
        printf("Tiempo:%11.9f\t / Tamaño Vectores:%u\n",ncgt,n);
        for(i=0;i<n;i++)
            printf("/ v2[%u]=%f \n",i,v2[i]);
    }
    else
    {
        printf("Tiempo:%11.9f\t / Tamaño:%u\t/\n / v2[0]=%f v2[%u]=%f \n",ncgt,n,v2[0],n-1,v2[n-1]);
    }

    #ifdef VECTOR_DYNAMIC
        free(v1);
        free(v2);
        for(i=0;i<n;i++)
        free(m[i]);
        free(m);
    #endif

    return 0;
}
