
/* 1) ./<ejecutable>.out <nombre_archivo> eejmplo: ./analizador.out data.txt */
/* 2) ./<ejecutable>.out ejemplo: ./analizador.out */
/* En el numeral 1 se pasa un archivo de texto, en el 2do no la entrada es via teclado */


%{

#include <math.h>
#include<stdio.h>
void Salir();
%}

EnteroPositivo      [0-9]*
EnteroNegativo      (-[0-9]*)
DecimalPositivo     [0-9]*\.[0-9]*
DecimalNegativo     -[0-9]*\.[0-9]* 
Variable       ([A-Z]){1}([0-9a-z])*
Variable2      (\b)(([A-Z]){1}([0-9a-z])*(?=[^a-zA-Z0-9_]))


%%

{DecimalPositivo}     	fputs("Tkn_DecimalP\n",yyout);
{DecimalNegativo}     	fputs("Tkn_DecimalN\n",yyout);
{EnteroPositivo}      	fputs("Tkn_EnteroP\n",yyout);
{EnteroNegativo}      	fputs("Tkn_EnteroN\n",yyout);

{Variable}   		fputs("Tkn_Variable\n",yyout);

definir|repetir|mientras|hasta|finsi|si|sino|imprimir|goto|leer|hacer  {fputs("Tkn_PalabraReservada\n",yyout);}
"+"|"-"|"*"|"/"   				fputs("Tkn_OperadorAritmetico\n",yyout);
"<"|">"|"<="|">="|"!="|"==" 			fputs("Tkn_OperadorRelacional\n",yyout);

"{"     fputs("Tkn_CorcheteA\n",yyout);
"}"     fputs("Tkn_CorcheteC\n",yyout);
"("     fputs("Tkn_ParentesisA\n",yyout);
")"     fputs("Tkn_ParentesisC\n",yyout);

; /*hacer nada*/

"{"[^}\n]*"}"     /* omite una linea de comentarios */

[ \t\n]+          /*  omite los espacios en blanco */

.           printf( "Caracter no reconocido: %s\n", yytext );

%%

int main(int argc, char *argv[]){
	if (argc == 2){
		yyin= fopen(argv[1], "rt");
		yyout=fopen("dataOut.txt", "w");
		if (yyin == NULL){
			printf("no se puede abrir %s ", argv[1]);
			exit(1);
		}
	}
	else{
	    yyin = stdin;
	}
	yylex();
	return 0;
}

void Salir(){
	printf("Saliendo...");
	exit(0);
}
