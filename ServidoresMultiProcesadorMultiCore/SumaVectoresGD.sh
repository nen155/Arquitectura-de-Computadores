#!/bin/bash
for ((N=65536;N<67108865;N=N*2))
do
./SumaVectoresCG $N
done
for ((N=65536;N<67108865;N=N*2))
do
./SumaVectoresCD $N
done
