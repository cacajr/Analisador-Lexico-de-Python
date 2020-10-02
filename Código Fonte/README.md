# Código fonte do Analisador Léxico da Linguagem Python
Ao importar este projeto em sua IDE ou Editor de código será encontrado na pasta src/python as classes que compõem este analisador.

O arquivo Python.flex contém o código referente a criação do analisador léxico, nele contém os símbolos que o analisador irá trabalhar, os que não irão ser usados, as palavras reservadas e os Tokens gerados dos seus respectivos símbolos.

A classe Generator é a geradora do analisador léxico escrito no arquivo Python.flex. Ao executá-la um arquivo .java é gerado com o mesmo nome do arquivo .flex. Neste caso, é gerado Python.java. Caso o códido de escrita do arquivo Python.flex receba alterações, deve-se apagar o arquivo gerado Python.java e gera-lo novamente através da classe Generator.

O enum Token que é representado no arquivo Token.java, armazena todos os Tokens usados pelo analisador léxico. Sem esse arquivo o analisador não funcionará de forma correta.

Na classe Analyze é onde é instanciado o arquivo Python.java gerado pela classe Generator e feito a análise de uma arquivo txt qualquer através de seu endereço.

# Fluxos de Teste
## Apenas testar
Execute a classe Analyze e faça o que se pede no console.

## Alterar analisador e testar
Quando se altera o arquivo Python.flex deve-se apagar o arquivo Python.java gerado anteriormente e executar a classe Generator para gerar um novo Python.java. Pode ser que você precise dar um refresh na pasta para que apareça o arquivo Python.java após a execução da classe Generator. Em seguida, execute a classe Analyze para testar.
