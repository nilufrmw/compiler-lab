%{
  #include "y.tab.h"
  #include <stdio.h>
  #include <stdlib.h>
%}

%%
[0-9]+ {yylval.ival = atoi(yytext); return NUMBER;}
\n     {return '\n';}
.      {return yytext[0];}
%%
