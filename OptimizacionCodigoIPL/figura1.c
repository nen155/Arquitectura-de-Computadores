#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct {
	int a;
	int b;
}s[5000];

int main()
{
	struct timespec cgt1,cgt2;
	double ncgt;
	int ii,i;
	double X1,X2,X1_0,X2_0,X1_1,X2_1;
	double *R= (double*)malloc(40000*sizeof(double));
	for(i=0; i<5000;i++){
		s[i].a = rand()%10;
		s[i].b = rand()%100;
	}
	clock_gettime(CLOCK_REALTIME,&cgt1);
	for (ii=1; ii<=40000;ii++) {
		X1=0; X2=0; X1_0=0; X1_1=0; X2_0=0; X2_1=0;
		for(i=0; i<5000;i+=2){ 
			//X1 desenrrollado
			X1_0+=2*s[i].a+ii;
			X1_1+=2*s[i+1].a+ii;
			//X2 desenrrollado
			X2_0+=3*s[i].b-ii;
			X2_1+=3*s[i+1].b-ii;			
		}
			X1=X1_0+X1_1;
			X2=X2_0+X2_1;
		
		/* DEBIDO A QUE NO HE CONSEGUIDO QUE FUNCIONE, HE QUITADO LA OPTIMIZACIÓN
		asm(	
			"xor %rbx,%rbx\n" //HAGO 0 rbx
			"movl -104(%rbp), %eax \n" //CARGO ii a EAX
			"cltq \n"//PASO A OPERACIONES DE 64BITS
			"leaq 0(,%rax,8), %rdx \n" // ii+8 en RDX
			"movq -64(%rbp), %rax \n" //PASO LA DIRECCION DE R a rax
			"addq %rax, %rdx \n" //ACCEDO A LA POSICION DE R[ii] sumando al puntero R+ii
			"movq -48(%rbp),%rcx \n" // PASO X1 a RCX
			"movq -56(%rbp),%r8 \n" //PASO X2 A r8
			"cmp %rcx,%r8 \n" //COMPARO X1,X2
			"setge %bl \n" //COMPRUEBO SI EL RESULTADO ES MAYOR O IGUAL Y LO GUARDO EN %BL
			"dec %rbx \n"//dec hace rbx 0xFFFFFFFF
			"subq %rcx,%r8 \n" //Meto el resultado de restar X1-X2 en rcx
			"and %rbx,%rcx \n" //Hago el and de rbx and %rcx
			"add %rbx,%r8 \n" //Hago rbx + X2 
		);*/
		if (X1<X2)
			R[ii]=X1;
		else
			R[ii]=X2;
	}
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt+=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));
	printf("Tiempo(seg.):%11.9f\t //// s[0] = %8.4f / s[39999] = %8.4f\n",ncgt,R[0],R[39999]); 
	return 0;
}
