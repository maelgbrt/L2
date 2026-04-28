CFLAGS = -Wall -Wextra -std=c99

all : hash

hash : main.o
	gcc $(CFLAGS) -o $@ $^

main.o: main.c main.h
	gcc $(CFLAGS) -c $<