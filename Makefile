#####PETITS RAPPELS PERSO#######
################################
#NAME = nom de l'executable
#FLAGS = choix de flags
#CC = choix de la compilation
#${NAME} pour  l'appeler dans le code
# <cible> : <dependance>
# 			<commande>
# % cible tous les .o et .c 
# %.o: %.c
#       ${CC} ${FLAGS} -c $< -o $@
# on peut SRCS = $(wildcard *.c) (recupere *.c)
# on peut aussi $(SRCS:.c=.o) (transforme .c -> .o)
###############################
NAME = launch
FLAGS = -Wall -Wextra -Werror
CFLAGS = -g $(shell sdl2-config --cflags)
LDFLAGS = $(shell sdl2-config --libs)
CC = gcc
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)

all : ${NAME}

${NAME} : ${OBJS} 
	${CC} -o ${NAME} ${OBJS} ${LDFLAGS}


%.o: %.c
	${CC} ${FLAGS} ${CFLAGS} -c $< -o $@

clean:
	rm -f ${OBJS} ${NAME}
