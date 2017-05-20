%option noyywrap
%{
	#include "parser.tab.h"
%}
digits	[0-9]+
chard [(), \t\n]
%%
{digits}	{ 
			yylval.num = atoi(yytext);
			//printf("number %d ", atoi(yytext));
			return number;
		}

","		{
			//printf(", ");
			return yytext[0];	
		}
"("		{
			//printf("open ");
			return openArray;	
		}

")"		{
			//printf("close ");
			return closeArray;
		}
[ \n\t]		{	
			//printf("smt else");
			return yytext[0];	
		}

"exit"		{
			return exit_command;
		}
. 		{ printf("error");}
%%

//main(){
//	yylex();
//}
