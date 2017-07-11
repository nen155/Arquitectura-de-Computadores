#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif
main(int argc, char **argv) {
	int i, n = 16,chunk, a[n],suma=0,x;
	if(argc < 2) {
		fprintf(stderr,"\nFalta chunk \n");
		exit(-1);
	}
	omp_sched_t kind;int modifier;
	omp_get_schedule(&kind, &modifier);
	printf("Sin modificar dyn-var %d, nthreads-var %d, run-sched-var %d %d\n",omp_get_dynamic(),omp_get_max_threads(),kind,modifier);
	
	//MODIFICO LAS VARIABLES
	omp_set_num_threads(5);
	omp_set_dynamic(1);
	kind = 2;
	modifier=4;
	omp_set_schedule(kind, modifier);
	omp_get_schedule(&kind, &modifier);
	printf("Sin modificar dyn-var %d, nthreads-var %d, run-sched-var %d %d\n",omp_get_dynamic(),omp_get_max_threads(),kind,modifier);
	chunk = atoi(argv[1]);
	for (i=0; i<n; i++) a[i] = i;
	#pragma omp parallel for firstprivate(suma) \
	lastprivate(suma) schedule(static,chunk)
	for (i=0; i<n; i++)
	{ 
		suma = suma + a[i];
		printf(" thread %d suma a[%d] suma=%d \n",
		omp_get_thread_num(),i,suma);
	}
	printf("Fuera de 'parallel for' suma=%d\n",suma);
}
