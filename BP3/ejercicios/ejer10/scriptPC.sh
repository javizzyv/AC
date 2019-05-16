#!/bin/bash

#Se fija a 12 el nº de threads máximo (tantas como cores en un nodo)
export OMP_THREAD_LIMIT=6
export OMP_NUM_THREADS=6
echo "Nº de threads inicial: $OMP_THREAD_LIMIT"

export OMP_SCHEDULE="static"
echo "estatico con chunk por defecto"
./pmm-OpenMP 1000

export OMP_SCHEDULE="static,1"
echo "estatico con chunk de 1"
./pmm-OpenMP 1000

export OMP_SCHEDULE="static,64"
echo "estatico con chunk de 64"
./pmm-OpenMP 1000

export OMP_SCHEDULE="dynamic"
echo "dinamico con chunk por defecto"
./pmm-OpenMP 1000

export OMP_SCHEDULE="dynamic,1"
echo "dinamico con chunk de 1"
./pmm-OpenMP 1000

export OMP_SCHEDULE="dynamic,64"
echo "dinamico con chunk de 64"
./pmm-OpenMP 1000

export OMP_SCHEDULE="guided"
echo "guiado con chunk por defecto"
./pmm-OpenMP 1000

export OMP_SCHEDULE="guided,1"
echo "guiado con chunk de 1"
./pmm-OpenMP 1000

export OMP_SCHEDULE="guided,64"
echo "guiado con chunk de 64"
./pmm-OpenMP 1000


unset OMP_SCHEDULE
unset OMP_THREAD_LIMIT
unset OMP_NUM_THREADS
