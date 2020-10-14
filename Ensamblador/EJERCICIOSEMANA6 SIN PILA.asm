#Imprime la cadena "Introduzca un n�mero: " y reciba por teclado un n�mero 
#introducido por el usuario. Este n�mero se guardar� obligatoriamente en el 
#registro $s0.
#
#Usando ese n�mero como par�metro (en $a0, como manda el convenio), llama a 
#una funci�n "factorial".
#
#Dicha funci�n utiliza un bucle while para calcular el factorial de aquel n�mero, 
#utilizando obligatoriamente el registro $s0 como acumulador. El resultado, como 
#siempre, se devuelve en el registro $v0.
#
#	s0 = 1;
#	while(a0 > 1) {
# 		 s0 = s0 * a0;
# 		 a0--;
#	}
#
#Usando la pila como se describe en el v�deo anterior, la funci�n debe guardar el 
#valor que ten�a $s0 para el programa principal y recuperarlo antes de devolver el control.
#Tras el retorno de la funci�n, el programa principal imprimir� resultados tal que as�:
#
#	Valor introducido: 4
#	Factorial: 24

#############################################################################################

.data
	men1: .asciiz "Introduce un numero:"
	salto: .asciiz "\n"
	men2: .asciiz "Factorial: "
	
.text
.globl main

	main:
	#Imprime el mensaje	 
	li $v0,4
	la $a0,men1
	syscall
	
	#Lee la entrada
	li $v0,5
	syscall
	
	#Copiamos a a0 el numero para respetar el convenio de uso de registros
	move $a0,$v0
	
	li $s0,1
	
	factorial:
		
		mul $s0,$s0,$a0
		subi $a0,$a0,1
		bgt $a0,1,factorial
	
	##Imprimimos el valor de factorial con un salto de linea
	li $v0,4
	la $a0,salto
	syscall
	
	li $v0,4
	la $a0,men2
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall 
	
	
li $v0,10
syscall
	  
	   
	     