# Analisador Léxico da Linguagem Python
Este é um analisador léxico da linguagem Python produzido em Java para o trabalho final da disciplina de Compiladores. O analisador deste repositório está dividido em três partes: código fonte, executável e um .txt com exemplo de código em Python para teste. Dentro de cada pasta existe uma documentação explicando como usar cada um.

# Detalhes do Analisador
## Tokens
Os Tokens escolhidos podem ser visualizados dentro da pasta Código Fonte/src/python/Token.java. Mais detalhes sobre os símbolos que representam cada Token é mostrado a seguir e podem ser vistos no endereço: Código Fonte/src/python/Python.flex:

ERROR: Símbolo não tratado pelo analisador<br />
QUEBRA_LINHA: \n<br />
IDENTACAO: "   " (Três espaços vazios)<br />
COMENTARIO_SIMPLES: #<br />
COMENTARIO_MULTILINHAS: ''' '''<br />
IDENTIFICADOR: var, var1, _var (Não podendo iniciar com números ou conter caracteres especiais)<br />
OPERADOR_ARITMETICO: +, -, *, /, %<br />
OPERADOR_LOGICO: and, or, not<br />
OPERADOR_RELACIONAL: >, <, >=, <=, ==, !=<br />
OPERADOR_ATRIBUICAO: =, +=, -=, *=, /=<br />
DELIMITADOR_ABERTO: (<br />
DELIMITADOR_FECHAOD: )<br />
FACA: :<br />
NUMERO_INTEIRO: 1, 2, 3, ..., 9999...<br />
NUMERO_FLUTUANTE: 1.1, 1.2, 1.3, ..., 9999.9999...<br />
STRING: "123", "Carlos Jr", ...<br />
LISTA_ABERTA: [<br />
LISTA_FECHADA: ]<br />
PALAVRA_RESERVADA: if, else, elif, for, while, def, return, try, except, as, in, False, True, break, import, from, continue, del, class, global, None, is, and, or, assert<br />

Símbolos como:  ,\t,\r, , não são analisados.

## Exemplo
Ao ser executado o exemplo.txt contido nesse repositório, a saída a seguir deve ser retornada:

COMENTARIO_MULTILINHAS -> ''' Testando Analisador Léxico<br />
da Linguagem Python '''<br />
QUEBRA_LINHA<br />
QUEBRA_LINHA<br />
COMENTARIO_SIMPLES -> # Função somar<br />
QUEBRA_LINHA<br />
PALAVRA_RESERVADA -> def<br />
IDENTIFICADOR -> somar<br />
DELIMITADOR_ABERTO -> (<br />
IDENTIFICADOR -> a<br />
IDENTIFICADOR -> b<br />
DELIMITADOR_FECHADO -> )<br />
FACA -> :<br />
QUEBRA_LINHA<br />
IDENTACAO<br />
IDENTIFICADOR -> x<br />
OPERADOR_ATRIBUICAO -> =<br />
IDENTIFICADOR -> a<br />
OPERADOR_ARITMETICO -> +<br />
IDENTIFICADOR -> b<br />
QUEBRA_LINHA<br />
IDENTACAO<br />
PALAVRA_RESERVADA -> return<br />
IDENTIFICADOR -> x<br />
QUEBRA_LINHA<br />
QUEBRA_LINHA<br />
COMENTARIO_SIMPLES -> # Testando função em uma lista<br />
QUEBRA_LINHA<br />
IDENTIFICADOR -> lista<br />
OPERADOR_ATRIBUICAO -> =<br />
LISTA_ABERTA -> [<br />
NUMERO_INTEIRO -> 1<br />
NUMERO_INTEIRO -> 2<br />
NUMERO_INTEIRO -> 3<br />
NUMERO_INTEIRO -> 4<br />
LISTA_FECHADA -> ]<br />
QUEBRA_LINHA<br />
IDENTIFICADOR -> resultado<br />
OPERADOR_ATRIBUICAO -> =<br />
NUMERO_INTEIRO -> 0<br />
QUEBRA_LINHA<br />
IDENTIFICADOR -> indice<br />
OPERADOR_ATRIBUICAO -> =<br />
NUMERO_INTEIRO -> 0<br />
QUEBRA_LINHA<br />
PALAVRA_RESERVADA -> while<br />
DELIMITADOR_ABERTO -> (<br />
IDENTIFICADOR -> indice<br />
OPERADOR_RELACIONAL -> <<br />
IDENTIFICADOR -> len<br />
DELIMITADOR_ABERTO -> (<br />
IDENTIFICADOR -> lista<br />
DELIMITADOR_FECHADO -> )<br />
DELIMITADOR_FECHADO -> )<br />
FACA -> :<br />
QUEBRA_LINHA<br />
IDENTACAO<br />
IDENTIFICADOR -> resultado<br />
OPERADOR_ATRIBUICAO -> +=<br />
IDENTIFICADOR -> somar<br />
DELIMITADOR_ABERTO -> (<br />
IDENTIFICADOR -> lista<br />
LISTA_ABERTA -> [<br />
IDENTIFICADOR -> indice<br />
LISTA_FECHADA -> ]<br />
IDENTIFICADOR -> lista<br />
LISTA_ABERTA -> [<br />
IDENTIFICADOR -> indice<br />
OPERADOR_ARITMETICO -> +<br />
NUMERO_INTEIRO -> 1<br />
LISTA_FECHADA -> ]<br />
DELIMITADOR_FECHADO -> )<br />
QUEBRA_LINHA<br />
IDENTACAO<br />
IDENTIFICADOR -> indice<br />
OPERADOR_ATRIBUICAO -> +=<br />
NUMERO_INTEIRO -> 2<br />
QUEBRA_LINHA<br />
QUEBRA_LINHA<br />
COMENTARIO_SIMPLES -> # Mostrando resultado<br />
QUEBRA_LINHA<br />
IDENTIFICADOR -> print<br />
DELIMITADOR_ABERTO -> (<br />
IDENTIFICADOR -> resultado<br />
DELIMITADOR_FECHADO -> )<br />
QUEBRA_LINHA<br />
