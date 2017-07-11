#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif

main(int argc, char **argv) {
	int i, n=16,chunk,a[n],suma=0;
	if(argc < 2) {
		fprintf(stderr,"\nFalta iteraciones y/o chunk \n");
		exit(-1);
	}
	//n = atoi(argv[1]); 
	if (n>20) n=20; 
	chunk = atoi(argv[1]);
	for (i=0; i<n; i++) a[i] = i;

	#pragma omp parallel  
	{
		#pragma omp single
		{
			printf(" DENTRO del for NUM threads %d NUM procesadores %d in parallel %d \n",
		omp_get_num_threads(),omp_get_num_procs(),omp_in_parallel());
		}
		#pragma omp for firstprivate(suma) \
	lastprivate(suma) schedule(guide,chunk) 
		for (i=0; i<n; i++)
		{ 
			suma = suma + a[i];
			printf(" thread %d suma a[%d] suma=%d \n",
			omp_get_thread_num(),i,suma);
		
		}
	}
	printf("Fuera de 'parallel for' suma=%d\n",suma);
	
	printf(" Fuera de 'parallel for' NUM threads %d NUM procesadores %d in parallel %d \n",
		omp_get_num_threads(),omp_get_num_procs(),omp_in_parallel());
}