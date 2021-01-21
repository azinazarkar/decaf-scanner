# Decaf Language - Parser phase

This program is a scanner made for Decaf programming language, a language made for educational purposes. You can find the language's description in *Scanner.pdf*.

## Running the program 

Run Main to parse the program in "src/compiler/program.txt" and see if it's OK or it has syntax errors.

Compiling the program:

```
java -jar lib/jflex-full-1.8.2.jar src/compiler/Scanner.flex
java -jar lib/java-cup-11b.jar src/compiler/parser.cup
mv parser.java sym.java src/compiler/
javac -cp .:src/:lib/java-cup-11b.jar src/compiler/Main.java
```

Running the program:

```
java -cp .:src/:lib/java-cup-11b.jar compiler.Main
```
