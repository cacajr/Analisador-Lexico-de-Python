package python;

import java.io.File;

public class Generator {

	public static void main(String[] args) {
		String path = "D:/Faculdade Carlos 27-03-2020/3º Semestre/POO - Java/WorkSpace/AnalisadorLéxico/src/python/Python.flex";
		
		generateLexer(path);
	}
	
	public static void generateLexer(String path) {
		File file = new File(path);
		
		jflex.Main.generate(file);
	}

}
