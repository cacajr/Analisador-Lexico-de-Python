package python;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.Scanner;

public class Analyze {

	public static void main(String[] args) {
		
		while(true) {
			
			// LEITURA DO TECLADO DO USUÁRIO
			System.out.println("Digite o endereço do arquivo: Ex:(C:/Users/CarlosJr/Desktop/arq.txt)");
			Scanner in = new Scanner(System.in);
			String addr = in.next();
			
			//ENDEREÇO DO ARQUIVO TXT QUE DESEJA EFETUAR A ANÁLISE LÉXICA
			//EX: C:/Users/CarlosJr/Desktop/arq.txt
			String path = addr;
			
			String textArq = "";
			
			try {
				File arq = new File(path);
				FileReader flArq = new FileReader(arq);
				BufferedReader br = new BufferedReader(flArq);
				
				while(br.ready()){ 
					textArq = textArq + br.readLine();
					textArq = textArq + "\n";
				} 
				br.close();
				
				System.out.println(textArq);
				System.out.println("-------------------------");
				System.out.println();
				
				Python pLex = new Python(new StringReader(textArq));
				
				while(true) {
					Token token = pLex.yylex();
					
					if(token == null) {
						break;
					}
					
					if(pLex.lexeme.equals("\t") | pLex.lexeme.equals("   ") | pLex.lexeme.equals("\n")) {
						System.out.println(token);
					} else {
						System.out.println(token + " -> " + pLex.lexeme);
					}
				}
				
				//FINALIZO O PROGRAMA
				break;
				
			} catch (FileNotFoundException e) {
				System.out.println("Arquivo não encontrado!");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//CONTINUO O PROGRAMA, POIS O ENDEREÇO DO ARQUIVO NÃO FOI ENCOTRADO AINDA
			
		}

	}

}
