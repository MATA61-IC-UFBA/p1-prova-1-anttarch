%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token NUM LPAR RPAR PLUS MINUS TIMES DIV
%token ERROR

%token STRING IDENT ASSIGN PRINT CONCAT LENGTH COMMA COMMENT

%start program

%%

program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: COMMENT
| IDENT ASSIGN assignables
| assignables
;

assignables
: num_expr
| function
| STRING
;

function
: PRINT LPAR int_string RPAR
| CONCAT LPAR exprlist RPAR
| LENGTH LPAR string_ident RPAR
;

exprlist
: exprlist COMMA exprlist
| string_ident
;

int_string
: NUM
| string_ident
;

string_ident
: STRING
| IDENT
;

num_expr
: num_expr PLUS num_expr
| num_expr MINUS num_expr
| num_expr TIMES num_expr
| num_expr DIV num_expr
| LPAR num_expr RPAR
| NUM
;

%%

