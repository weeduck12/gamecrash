launch : main.o 
	gcc -o run main.o

main.o : main.c
	gcc -o main.o -c main.c
