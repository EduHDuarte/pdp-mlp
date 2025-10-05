C_SOURCES = $(wildcard matrix/*.c neural/*.c util/*.c *.c)
HEADERS = $(wildcard matrix/*.h neural/*.h util/*.h *.h)
OBJ = ${C_SOURCES:.c=.o}
DEBUGFLAGS = -g 
CFLAGS = -fopenmp

MAIN = main
CC = /usr/bin/gcc
LINKER = /usr/bin/ld

main: ${OBJ}
	${CC} ${CFLAGS} ${DEBUGFLAGS} $^ -o $@ -lm

# Generic rules
%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} ${DEBUGFLAGS} -c $< -o $@ -lm

clean:
	rm matrix/*.o *.o neural/*.o util/*.o ${MAIN} results out
