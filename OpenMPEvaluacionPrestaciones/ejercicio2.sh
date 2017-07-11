#!/bin/bash
for ((N=1; N<=4;N*=2))
do
echo "schelude $N\n";
./schelude-clause $N
echo "schelude-dynamic $N\n";
./schelude-clause-dynamic $N
echo "schelude-guide $N\n";
./schelude-clause-guide $N
done
