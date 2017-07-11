#!/bin/bash
export OMP_THREAD_LIMIT=2
echo "No de threads inicial: $OMP_THREAD_LIMIT"
for ((P=OMP_THREAD_LIMIT;P>0;P=P-1))
do
export OMP_NUM_THREADS=$P
echo -e "\nPara $OMP_NUM_THREADS threads:"
for ((N=1000; N<10001;N+=1000))
do
#./ejercicio9a $N $N 
#./ejercicio9b $N $N
./ejercicio10 $N $N
done
done
