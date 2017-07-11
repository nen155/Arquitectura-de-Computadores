#include <stdio.h>
#include <stdlib.h>
#include <time.h>
//#include <omp.h>
//#define PRINTF_ALL
#define MIN(X, Y) (((X) < (Y)) ? (X) : (Y))

main(int argc, char **argv)
{
	if(argc < 2) {
		fprintf(stderr,"Falta fila y columna\n");
		exit(-1);
	}
	
	struct timespec cgt1,cgt2; double ncgt; //para tiempo de ejecución
	int i,k, n = atoi(argv[1]),h,j,kk,jj;	
	int bsize=64;
	double sumalocal=0;
	double **m;
	double **m2;
	double **res;
	m = (double**)malloc(n*sizeof(double*));
	m2 = (double**)malloc(n*sizeof(double*));
	res = (double**)malloc(n*sizeof(double*));
	int en = bsize * (n/bsize); /* Amount that fits evenly into blocks */
	

	//Reservo el espacio para las matrices	
	for(i=0;i<n;++i)
		m[i]=(double*)malloc(n*sizeof(double));
	for(i=0;i<n;++i)
		m2[i]=(double*)malloc(n*sizeof(double));
	for(i=0;i<n;++i)
		res[i] = (double*)malloc(n*sizeof(double));
	

	//HACER UNA VARIABLE TEMPORAL EN LA QUE ASIGNO AL PRINCIPO M[I][J]
	// EN LA QUE VOY ACUMULANDO
	//Y ASIGNAR AL FINAL
	//BUSCAR EL ALGORITMO DE  MATRIX MULTIPLICATION BLOCKING PARA METER EN LA CACHE UN BLOQUE
	//DESENROLLAR EL BUCLE
	//Inicializo la matriz m y m2
	clock_gettime(CLOCK_REALTIME,&cgt1);
	for (i=0; i<n; i++){
					
		for(k=0;k<n;++k){
			m[i][k]=2;
			m2[i][k]=3;
			res[i][k]=0;
		}
		
	}
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt+=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));				
	int ii=0;
	//Calculo la multiplicacion de la matriz por la matriz y obtengo el tiempo
	clock_gettime(CLOCK_REALTIME,&cgt1);
 	for (kk = 0; kk < en; kk += bsize) {
 		for (jj = 0; jj < en; jj += bsize) {
 			for (i = 0; i < n; i++) {
 				for (j = jj; j < jj + bsize; j++) {
 					sumalocal = res[i][j];
 					for (k = kk; k < kk + bsize; k++) {
 						sumalocal += m[i][k]*m2[k][j];
 					}
 					res[i][j] = sumalocal;
 				}
 			}
 		}
 	}
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt+=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));
	//Imprimo los resultados
 	#ifdef PRINTF_ALL
	printf("Tiempo(seg.):%11.9f\t / Tamaño Matrices:%u\n",ncgt,n);
	for (h=0; h<n; h++){
		for (i=0; i<n; i++){
			for(k=0;k<n;++k){
				printf("/ m[%d][%d]*m2[%d][%d] (%8.6f*%8.6f) + \n",i,k,k,h,m[i][k],m2[k][h]);
			}
			printf("= res[%i][%i] =%8.2f/ \n",h,i,res[h][i]);
		}
		
		
	}
	#else
        printf("Tiempo(seg.):%11.9f\t / Tamaño Matrices:%u\t/ m[0][0]*m2[0][0]=res[0][0](%8.6f+%8.6f=%8.6f) // m[%d][%d]*m2[%d][%d]=res[%d][%d](%8.6f+%8.6f=%8.6f) /\n", ncgt,n,m[0][0],m2[0][0],res[0][0],n-1,n-1,n-1,n-1,n-1,n-1,m[n-1][n-1],m2[n-1][n-1],res[n-1][n-1]);
    	#endif
	for(i=0;i<n;++i){	
		free(m[i]);
	}
	
	for(i=0;i<n;++i){
		
		free(m2[i]);
	}
	for(i=0;i<n;++i)
		free(res[i]);
        free(m); // libera el espacio reservado para m
	free(m2); // libera el espacio reservado para m2
	free(res); // libera el espacio reservado para res
	
}
