package python;

import static python.Token.*;
%%
%class Python
%type Token

L = [a-zA-Z_]
D = [0-9]
WHITE=[ \r,]

%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}

/*Pular linha*/
("\n") {lexeme = yytext(); return QUEBRA_LINHA;}

/*Identação*/
("   " | "\t") {lexeme = yytext(); return IDENTACAO;}

/*Marcador de comentário simples*/
"#"[^\n]* {lexeme = yytext(); return COMENTARIO_SIMPLES;}

/*Marcador de comentário multilinhas*/
"'''"[^*]*"''"([^/][^*]*"''")*"'" {lexeme = yytext(); return COMENTARIO_MULTILINHAS;}

/*Operadores aritméticos*/
("+" | "-" | "*" | "/" | "%") {lexeme = yytext(); return OPERADOR_ARITMETICO;}

/*Operadores lógicos*/
("and" | "or" | "not") {lexeme = yytext(); return OPERADOR_LOGICO;}

/*Operadores relacionais*/
(">" | "<" | ">=" | "<=" | "==" | "!=") {lexeme = yytext(); return OPERADOR_RELACIONAL;}

/*Operador de atribuição*/
("=" | "+=" | "-=" | "*=" | "/=") {lexeme = yytext(); return OPERADOR_ATRIBUICAO;}

/*Delimitador Aberto*/
("(") {lexeme = yytext(); return DELIMITADOR_ABERTO;}

/*Delimitador Fechado*/
(")") {lexeme = yytext(); return DELIMITADOR_FECHADO;}

/*Comando*/
(":") {lexeme = yytext(); return FACA;}

/*Números inteiros*/
{D}+ {lexeme = yytext(); return NUMERO_INTEIRO;}

/*Números flutuantes*/
{D}+"."{D}* {lexeme = yytext(); return NUMERO_FLUTUANTE;}

/*Strings*/
(\"[^\n,]*\" | \'[^\n,]*\') {lexeme = yytext(); return STRING;}

/*Lista Aberta*/
("[") {lexeme = yytext(); return LISTA_ABERTA;}

/*Lista Fechada*/
("]") {lexeme = yytext(); return LISTA_FECHADA;}

/*Palavras reservadas*/
(if | else | elif | for | while | def | return | try | except | as | in | False | True | break | import | from | continue | del | class | global | None | is | and | or | assert) {lexeme = yytext(); return PALAVRA_RESERVADA;}

/*Identificador de variável*/
({L}+ | {L}+{D}+) {lexeme = yytext(); return IDENTIFICADOR;}

. {return ERROR;}
