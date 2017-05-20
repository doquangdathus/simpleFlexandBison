%{
	#include "lex.yy.c"
	#include <stdio.h>     /* C declarations used in actions */
	#include <stdlib.h>
	void yyerror(char *s);
	int sum = 0;
	void add(int);
%}

%union
{
	int num;
	char id;
}

%token number
%token openArray
%token exit_command
%token closeArray
%type <id> line

%type <num> exp term

%start line

%%

line :  openArray closeArray {printf("%d", 0);}
	| openArray term closeArray {printf("%d", $2);}
	| openArray exp {;}
	| exit_command {exit(EXIT_SUCCESS);}
	;
exp : term ',' exp {;}
	|',' term closeArray {printf("%d\n", sum);}
	;
term: number {add($$);};

%%

void add(int n){
	sum = sum + n;
	//printf("Sum is: %d", sum);
}
void yyerror(char *s){
	fprintf (stderr, "%s\n", s);
}

int main(){
	return yyparse( );
}
