%{
  #include<stdio.h>
  #include<stdlib.h>

  int yylex(void);
  void yyerror();
%}

%union {int ival;}
%token<ival> NUMBER
%type<ival> exp
%left '+''-'
%left '*''/'
%%

st:exp '\n' {printf("Answer=%d\n",$1);};

exp:exp'+'exp {$$=$1+$3;}
   |exp'-'exp {$$=$1-$3;}
   |exp'*'exp {$$=$1*$3;}
   |exp'/'exp {$$=$1/$3;}
   |'('exp')' {$$=$2;}
   |NUMBER {$$=$1;}
   ;
%%

void main() {
  printf("Enter the expression: ");
  yyparse();
}

int yywrap() {
  return 1;
}

void yyerror() {
  printf("Error");
}
