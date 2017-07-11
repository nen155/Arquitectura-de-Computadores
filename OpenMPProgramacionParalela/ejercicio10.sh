#!/bin/bash
for ((N=16384;N<=67108865;N=N*2))
do
./ejercicio7 $N
done
for ((N=16384;N<=67108865;N=N*2))
do
./ejercicio8 $N
done
for ((N=16384;N<=67108865;N=N*2))
do
./ejercicio10 $N
done
