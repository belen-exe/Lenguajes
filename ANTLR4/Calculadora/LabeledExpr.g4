grammar LabeledExpr;
prog: stat+;

stat: expr NEWLINE # printExpr
| ID '=' expr NEWLINE # assign
| NEWLINE # blank
;

expr
: prefix=('RAD' | 'DEG')? 'Sin' '(' expr ')' # Sin
| prefix=('RAD' | 'DEG')? 'Cos' '(' expr ')' # Cos
| prefix=('RAD' | 'DEG')? 'Tan' '(' expr ')' # Tan
| expr op=('*'|'/') expr # MulDiv
| expr op=('+'|'-') expr # AddSub
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
RAD : 'rad' ;
DEG : 'deg' ;

ID: [a-zA-Z]+; //identificadores de letras
INT: [0-9]+ ('.' [0-9]+)?; //de numeros
NEWLINE: '\r'? '\n'; //retorna saltos de linea a los parser
WS: [ \t]+ -> skip;
