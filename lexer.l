%{

			//printf("open ");	
			#include "parser.tab.h"
%}
digits	-?[0-9]+
chard [(), \t\n]
%%
{digits}	{	
			yylval.num = atoi(yytext);
			return number;
		}
","		{
			//printf(", ");
			return yytext[0];	
		}
"("		{
			return openArray;	
		}

")"		{
			//printf("close ");
			return closeArray;
		}
"\n"		{
			return yytext[0];
		}
"exit"		{
			return exit_command;
		}
%%
