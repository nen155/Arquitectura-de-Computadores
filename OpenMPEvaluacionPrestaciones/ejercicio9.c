#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>
#define PRINTF_ALL

main(int argc, char **argv)
{
	if(argc < 2) {
		fprintf(stderr,"Falta fila y columna\n");
		exit(-1);
	}
	
	struct timespec; double ncgt,cgt1,cgt2; //para tiempo de ejecución
	int i,k, n = atoi(argv[1]),h;	
	double sumalocal=0;
	double **m;
	double **m2;
	double **res;
	m = (double**)malloc(n*sizeof(double*));
	m2 = (double**)malloc(n*sizeof(double*));
	res = (double**)malloc(n*sizeof(double*));

	//Reservo el espacio para las matrices	
	for(i=0;i<n;++i)
		m[i]=(double*)malloc(n*sizeof(double));
	for(i=0;i<n;++i)
		m2[i]=(double*)malloc(n*sizeof(double));
	for(i=0;i<n;++i)
		res[i] = (double*)malloc(n*sizeof(double));
	
	//Inicializo la matriz m y m2
	#pragma omp parallel for private(k)
	for (i=0; i<n; i++){			
		for(k=0;k<n;++k){
			m[i][k]=2;
			m2[i][k]=3;
			res[i][k]=0;
		}
	}
					

	//Calculo la multiplicacion de la matriz por la matriz y obtengo el tiempo
	#pragma omp parallel private(k,i,sumalocal)
	{
		#pragma omp single
		cgt1 = omp_get_wtime();
		#pragma omp for
		for (h=0; h<n; h++){
			for (i=0; i<n; i++){
				for(k=0;k<n;++k){
					sumalocal+=m[i][k]*m2[k][h];			
				}
				#pragma omp critical
				{
					res[h][i]=sumalocal;
					sumalocal=0;
				}	
			}
		}
		#pragma omp single
		cgt2 = omp_get_wtime();
	}
	ncgt=(cgt2-cgt1)/*/(1.e+9)*/;
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
