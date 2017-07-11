#!/bin/bash
#Se asigna al trabajo el nombre SumaVectoresC_vlocales
#PBS -N SumaVectoresC_vlocales
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE
#Se ejecuta SumaVectorC, que está en el directorio en el que se ha ejecutado qsub,
#para N potencia de 2 desde 2^16 a 2^26
for ((N=1;N<=3;N=N+1))
do
$PBS_O_WORKDIR/ejercicio7 10000 $N 1
done
for ((N=1;N<=3;N=N+1))
do
$PBS_O_WORKDIR/ejercicio7 10000 $N 2
done
for ((N=64;N<=128;N=N*2))
do
for ((I=1;I<=3;I=I+1))
do
$PBS_O_WORKDIR/ejercicio7 10000 $I $N
done  
done
for ((N=1;N<=3;N=N+1))
do
$PBS_O_WORKDIR/ejercicio7 10000 $N 1024
done
