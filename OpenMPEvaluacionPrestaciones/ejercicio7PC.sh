#!/bin/bash
for ((N=1;N<=3;N=N+1))
do
./ejercicio7 10000 $N 1
done
for ((N=1;N<=3;N=N+1))
do
./ejercicio7 10000 $N 2
done
for ((N=64;N<=128;N=N*2))
do
for ((I=1;I<=3;I=I+1))
do
./ejercicio7 10000 $I $N
done  
done
for ((N=1;N<=3;N=N+1))
do
./ejercicio7 10000 $N 1024
done
