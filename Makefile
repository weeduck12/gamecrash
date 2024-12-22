#####PETITS RAPPELS PERSO#######
################################
#NAME = nom de l'executable
#FLAGS = choix de flags
#CC = choix de la compilation
#${NAME} pour  l'appeler dans le code
# % pour cibler tous les .o et .c la suite jsp 
# %.o: %.c
#       ${CC} ${CFLAGS} -c $< -o $@
###############################
NAME = launch
FLAGS = -Wall -Wextra -Werror
CC = gcc

all : ${NAME}

${NAME} : main.o 
	${CC} main.o -o ${NAME} 


%.o: %.c
	${CC} ${CFLAGS} -c main.c -o main.o

clean:
	rm -rf *.o
