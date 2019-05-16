#!/bin/bash
#Todos los scripts que se hagan para atcgrid deben incluir lo siguiente:
#1. Se asigna al trabajo el nombre helloomp
#PBS -N pmtv-OpenMP
#2. Se asigna el trabajo a la cola ac
#PBS -q ac
#3. Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id.  del trabajo: $PBS_JOBID"
echo "Nombre  del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Directorio de trabajo: $PBS_JOBDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE
# FIN del trozo que deben incluir todos los scripts

#Se fija a 12 el nº de threads máximo (tantas como cores en un nodo)
export OMP_THREAD_LIMIT=12
export OMP_NUM_THREADS=12
echo "Nº de threads inicial: $OMP_THREAD_LIMIT"

export OMP_SCHEDULE="static"
echo "estatico con chunk por defecto"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="static,1"
echo "estatico con chunk de 1"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="static,64"
echo "estatico con chunk de 64"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic"
echo "dinamico con chunk por defecto"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic,1"
echo "dinamico con chunk de 1"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic,64"
echo "dinamico con chunk de 64"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="guided"
echo "guiado con chunk por defecto"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="guided,1"
echo "guiado con chunk de 1"
$PBS_O_WORKDIR/pmtv-OpenMP 15360

export OMP_SCHEDULE="guided,64"
echo "guiado con chunk de 64"
$PBS_O_WORKDIR/pmtv-OpenMP 15360


unset OMP_SCHEDULE
unset OMP_THREAD_LIMIT
unset OMP_NUM_THREADS