run: compile
	java -cp .:src/:lib/java-cup-11b.jar compiler.Main
compile: clean
	java -jar lib/jflex-full-1.8.2.jar src/compiler/Scanner/Scanner.flex
	java -jar lib/java-cup-11b.jar src/compiler/Parser/parser.cup
	mv parser.java sym.java src/compiler/Parser/
	javac -cp .:src/:lib/java-cup-11b.jar src/compiler/Main.java
clean:
	find . -type f -name "*.class" -delete
