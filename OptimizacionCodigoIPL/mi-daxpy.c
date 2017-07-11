#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>


int main(){
	struct timespec cgt1,cgt2;
	double ncgt;
	int i,n;
	double a;
	
	a=100000;n=100000000;
	double * x = (double*)malloc(n*sizeof(double));
	double * y = (double*)malloc(n*sizeof(double));
	for(i=0;i<n;++i){
		x[i]=100000;
		y[i]=100000;
	}
	clock_gettime(CLOCK_REALTIME,&cgt1);
	#pragma unroll(1)
	for (i=0; i<n; i++) { 
	      y[i] += a * x[i]; 
	} 
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt+=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));
	printf("Tiempo(seg.):%11.9f\t //// y[0] = %8.4f / s[%i] = %8.4f\n",ncgt,y[0],n-1,y[n-1]); 
}	
