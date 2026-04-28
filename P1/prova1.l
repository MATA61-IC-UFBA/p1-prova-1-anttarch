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
COMMENT \/\/.*\n
IDENT [a-z][a-z0-9_]*
STRING \"[^\"]*\"

%%

{WHITESPACE}

{COMMENT}       { return COMMENT; }
{STRING}        { return STRING; }
"print"         { return PRINT; }
"concat"        { return CONCAT; }
"length"        { return LENGTH; }
{IDENT}         { return IDENT; }
"="             { return ASSIGN; }
","             { return COMMA; }

{NUM}           { return NUM; }
"("    		    { return LPAR; }
")"		        { return RPAR; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIV; }

.            { return ERROR; }

%%
