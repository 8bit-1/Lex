# Lex
Ejemplo usando Lex

Es necesario tener instalado Flex y un compilador de codigo C, en mi caso gcc incluido en la mayoria de distros de linux.

•	Para generar en Lex:
	flex Analizador_Lexico.l

•	Para compilar:
	gcc lex.yy.c -lfl 

•	Para ejecutarlo utilizando como entrada el archivo data.txt:
	./a.out data.txt
	
	Para ejecutar y que lea desde el teclado
	./a.out

Se puede eliminar el archivo dataOut para corroborar que funciona.
