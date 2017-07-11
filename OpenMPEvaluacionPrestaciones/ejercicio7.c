#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>
//#define PRINTF_ALL

main(int argc, char **argv)
{
	if(argc < 4) {
		fprintf(stderr,"Falta fila y columna\n");
		exit(-1);
	}
	omp_set_num_threads(16);
	omp_set_dynamic(0);
	
	struct timespec cgt1,cgt2; double ncgt; //para tiempo de ejecución
	int i,k, n = atoi(argv[1]);
	int kind = atoi(argv[2]);
	int chunk=atoi(argv[3]);
	omp_set_schedule(kind, chunk);
	double *v1,*v2;
	v1 = (double*)malloc(n*sizeof(double));
	v2 = (double*)malloc(n*sizeof(double));	
	double sumalocal=0;
	double **m;
	m = (double**)malloc(n*sizeof(double*));

	//Inicializo v1 y reservo el espacio para la matriz
	#pragma omp parallel for	
	for(i=0;i<n;++i){
		m[i]=(double*)malloc(n*sizeof(double));
		v1[i]=2;
	}
	
	//Inicializo la matriz
	#pragma omp parallel private(k)
	{
		#pragma omp for
		for (i=0; i<n; i++)			
			for(k=0;k<n;++k)
			if(k<i+1)
				m[i][k]=2;
			else
				m[i][k]=0;		
	}
	//Calculo la multiplicacion de la matriz por el vector y obtengo el tiempo
	clock_gettime(CLOCK_REALTIME,&cgt1);
	#pragma omp parallel private(k,sumalocal)
	{
		sumalocal=0;
		#pragma omp for
		for (i=0; i<n; i++){
			for(k=0;k<i+1;++k)
				sumalocal+=m[i][k]*v1[k];
			#pragma omp critical
			{
				v2[i]=sumalocal;
				sumalocal=0;
			}
			
		}
	}
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));



	//Imprimo los resultados
 	#ifdef PRINTF_ALL
	printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",ncgt,n);
	for (i=0; i<n; i++){
		for(k=0;k<i+1;++k){
			 printf("/ m[%d][%d]*V1[%d] (%8.6f*%8.6f)+ ",i,k,k,m[i][k],v1[k]);
		}
		printf("=v2[%i] =%8.6f/ \n",i,v2[i]);
	}

	#else
        printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ m[0][0]*V1[0]=V2[0](%8.6f+%8.6f=%8.6f) // m[%d][%d]*V1[%d]=V2[%d](%8.6f+%8.6f=%8.6f) /\n", ncgt,n,m[0][0],v1[0],v2[0],n-1,n-1,n-1,n-1,m[n-1][n-1],v1[n-1],v2[n-1]);
    	#endif
	free(v1); // libera el espacio reservado para v1
        free(v2); // libera el espacio reservado para v2

	for(i=0;i<n;++i){
		free(m[i]);
	}
        free(m); // libera el espacio reservado para m
	
}
