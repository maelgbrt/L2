CFLAGS = -Wall -Wextra -std=c99

all : hash

hash : annuaire.o
	gcc $(CFLAGS) -o $@ $^

main.o: annuaire.c annuaire.h
	gcc $(CFLAGS) -c $<