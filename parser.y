%{
	#include "lex.yy.c"
	#include <stdio.h> 
	#include <stdlib.h>
	int yyerror(char *s);
	int yywrap();
	int yylex();
	int sum = 0;
	void add(int);
%}

%union
{
	int num;
	char id;
}

%token<num> number
%token<id> openArray
%token exit_command
%token<id> closeArray

%type<id> line
%type<num> exp term

%start line

%%

line :  '\n' {;}
	|openArray closeArray {/*printf("%d\n", 0);*/;}
	| openArray term closeArray {/*printf("%d\n", $2);*/;}
	| openArray exp {;}
	| exit_command {exit(EXIT_SUCCESS);}
	;
exp : term ',' exp {;}
	|',' term closeArray {/*printf("%d\n", sum);*/;}
	;
term: number {add($$);};

%%

void add(int n){
	
	sum = sum + n;
	printf("%d %d\n", n, sum);
	
}

int main(void){
	yyparse();
}

int yywrap(){return 1;}

int yyerror(char *s){
	printf("%s\n", s);
	return 0;
}

