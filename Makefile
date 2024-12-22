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
CFLAGS = -Wall -Wextra -Werror -g $(shell sdl2-config --cflags)
LDFLAGS = $(shell sdl2-config --libs)
CC = gcc
SRCS = main.c
OBJS = main.o

all : ${NAME}

${NAME} : ${OBJS} 
	${CC} -o ${NAME} ${OBJS} ${LDFLAGS}


%.o: %.c
	${CC} ${CFLAGS} -c $< -o $@

clean:
	rm -f ${OBJS} ${NAME}
