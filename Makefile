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
SRCS = main.c
OBJS = main.o

all : ${NAME}

${NAME} : ${SRCS} 
	${CC} -o ${NAME} ${OBJS}


%.o: %.c
	${CC} ${CFLAGS} -c ${SRCS} -o ${OBJS}

clean:
	rm -f ${OBJS} ${NAME}
