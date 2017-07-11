#include <stdio.h>
#include <stdlib.h>
#include <time.h>

main(int argc, char **argv)
{
	if(argc < 3) {
		fprintf(stderr,"Falta fila y columna\n");
		exit(-1);
	}
	
	struct timespec cgt1,cgt2; double ncgt; //para tiempo de ejecución
	int i,k, f = atoi(argv[1]);
	int c = atoi(argv[2]);
	double *v1,*v2;
	v1 = (double*)malloc(f*sizeof(double));
	v2 = (double*)malloc(f*sizeof(double));	
	double sumalocal=0;
	double **m;
	m = (double**)malloc(f*sizeof(double*));

	//Inicializo v1 y reservo el espacio para la matriz	
	for(i=0;i<c;++i){
		m[i]=(double*)malloc(c*sizeof(double));
		v1[i]=2;
	}
	
	//Inicializo la matriz
	for (i=0; i<f; i++)
		for(k=0;k<c;++k)
			m[i][k]=2;	

	//Calculo la multiplicacion de la matriz por el vector y obtengo el tiempo
	clock_gettime(CLOCK_REALTIME,&cgt1);
	for (i=0; i<f; i++){
		for(k=0;k<c;++k)
			sumalocal+=m[i][k]*v1[k];
		v2[i]=sumalocal;
		sumalocal=0;
	}
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	//Imprimo los resultados
	printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",ncgt,f);
	for (i=0; i<f; i++){
		for(k=0;k<c;++k){
			 printf("/ m[%d][%d]*V1[%d]=v2[%i] (%8.6f*%8.6f=%8.6f) /\n",i,k,k,i,m[i][k],v1[k],v2[i]);
		}
	}
	free(v1); // libera el espacio reservado para v1
        free(v2); // libera el espacio reservado para v2

	for(i=0;i<c;++i){
		free(m[i]);
	}
        free(m); // libera el espacio reservado para m
	
}
