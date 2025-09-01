grammar LabeledExpr;
prog: stat+;

stat: expr NEWLINE # printExpr
| ID '=' expr NEWLINE # assign
| NEWLINE # blank
;

expr: expr op=('*'|'/') expr # MulDiv
| expr op=('+'|'-') expr # AddSub
| 'Sin' '(' expr ')' #Sin
| 'Cos' '(' expr ')' #Cos
| 'Tan' '(' expr ')' #Tan
| 'Sqrt' '(' expr ')' #Sqrt
| 'Ln' '(' expr ')' #Ln
| 'Log' '(' expr ')' #Log
| expr FACTORIAL  #Factorial
| INT # int
| ID # id
| '(' expr ')' # parens
;

MUL : '*' ; // assigns token name to '*' used above in grammar
DIV : '/' ;
ADD : '+' ;
SUB : '-' ;
FACTORIAL : '!' ;

ID: [a-zA-Z]+; //identificadores de letras
INT: [0-9]+ ('.' [0-9]+)?; //de numeros
NEWLINE: '\r'? '\n'; //retorna saltos de linea a los parser
WS: [ \t]+ -> skip;
