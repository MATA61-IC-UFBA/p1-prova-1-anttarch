%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

NUM [0-9]+(\.[0-9]+)?
WHITESPACE [ \t]

%%

/* copiar E2 e fazer as extensões */
{WHITESPACE}
{NUM}           { return NUM; }
"("    		    { return LPAR; }
")"		        { return RPAR; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIV; }
\n		        { return EOL; }

.            { return ERROR; }

%%
