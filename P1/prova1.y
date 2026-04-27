%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token EOL 0
%token NUM LPAR RPAR PLUS MINUS TIMES DIV
%token ERROR

%token STRING IDENT ASSIGN PRINT CONCAT LENGTH

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAR exprlist RPAR
| CONCAT LPAR exprlist RPAR
| LENGTH LPAR expr RPAR
| expr
;

expr
: STRING
| expr PLUS expr
| expr MINUS expr
| expr TIMES expr
| expr DIV expr
| LPAR expr RPAR
| NUM
;

%%

