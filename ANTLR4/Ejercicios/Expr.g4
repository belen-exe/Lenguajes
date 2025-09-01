grammar Expr;
prog: stat+;

stat: expr NEWLINE
 | ID '=' expr NEWLINE
 | NEWLINE
 ;
 
expr: expr('*'|'/') expr
 | expr('+'| '-') expr
 | INT
 | ID
 | '(' expr ')'
 ;
 
 ID: [a-zA-Z]+; //identificadores de letras
 INT: [0-9]+; //de numeros
 NEWLINE: '\r'? '\n'; //retorna saltos de linea a los parser
 WS: [\t]+ -> skip;
