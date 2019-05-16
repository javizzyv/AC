#!/bin/bash
#PBS -N SumaVectores2
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "# Ejecución de Makefile en atcgrid.ugr.es"
echo "#"
echo "#    Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "#    Id. del trabajo: $PBS_JOBID"
echo "#    Nombre  del trabajo especificado por usuario: $PBS_JOBNAME"
echo "#    Nodo que ejecuta qsub: $PBS_O_HOST"
echo "#    Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "#    Cola: $PBS_QUEUE"
echo "#    Nodos asignados al trabajo: `cat $PBS_NODEFILE | tr "\n" " "`"


for (( N=16384 ; N<=67108864 ; N*=2 ))
do
   $PBS_O_WORKDIR/SumaVectores2 $N
done
