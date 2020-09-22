package python;

import static python.Token.*;
%%
%class Python
%type Token

L = [a-zA-Z_]
D = [0-9]
WHITE=[ \t\r,]

%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}

/*Pular linha*/
("\n") {lexeme = yytext(); return QUEBRA_LINHA;}

/*Identa��o*/
("   ") {lexeme = yytext(); return IDENTACAO;}

/*Marcador de coment�rio simples*/
"#"[^\n]* {lexeme = yytext(); return COMENTARIO_SIMPLES;}

/*Marcador de coment�rio multilinhas*/
"'''"[^*]*"''"([^/][^*]*"''")*"'" {lexeme = yytext(); return COMENTARIO_MULTILINHAS;}

/*Operadores aritm�ticos*/
("+" | "-" | "*" | "/" | "%") {lexeme = yytext(); return OPERADOR_ARITMETICO;}

/*Operadores l�gicos*/
("and" | "or" | "not") {lexeme = yytext(); return OPERADOR_LOGICO;}

/*Operadores relacionais*/
(">" | "<" | ">=" | "<=" | "==" | "!=") {lexeme = yytext(); return OPERADOR_RELACIONAL;}

/*Operador de atribui��o*/
("=" | "+=" | "-=" | "*=" | "/=") {lexeme = yytext(); return OPERADOR_ATRIBUICAO;}

/*Delimitador Aberto*/
("(") {lexeme = yytext(); return DELIMITADOR_ABERTO;}

/*Delimitador Fechado*/
(")") {lexeme = yytext(); return DELIMITADOR_FECHADO;}

/*Comando*/
(":") {lexeme = yytext(); return FACA;}

/*N�meros inteiros*/
{D}+ {lexeme = yytext(); return NUMERO_INTEIRO;}

/*N�meros flutuantes*/
{D}+"."{D}* {lexeme = yytext(); return NUMERO_FLUTUANTE;}

/*Strings*/
(\"[^\n,]*\" | \'[^\n,]*\') {lexeme = yytext(); return STRING;}

/*Lista Aberta*/
("[") {lexeme = yytext(); return LISTA_ABERTA;}

/*Lista Fechada*/
("]") {lexeme = yytext(); return LISTA_FECHADA;}

/*Palavras reservadas*/
(if | else | elif | for | while | def | return | try | except | as | in | False | True | break | import | from | continue | del | class | global | None | is | and | or | assert) {lexeme = yytext(); return PALAVRA_RESERVADA;}

/*Identificador de vari�vel*/
({L}+ | {L}+{D}+) {lexeme = yytext(); return IDENTIFICADOR;}

. {return ERROR;}