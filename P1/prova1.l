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
COMMENT \/\/.*
IDENT [a-zA-Z][a-zA-Z0-9_]*

%%

/* copiar E2 e fazer as extensões */
{WHITESPACE}
{COMMENT}

"print"         { return PRINT; }
"concat"        { return CONCAT; }
"length"        { return LENGTH; }
{IDENT}         { return IDENT; }
"="             { return ASSIGN; }
\"              { return QUOT; }

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
