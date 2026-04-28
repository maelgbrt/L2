CFLAGS = -Wall -Wextra -std=c99

all : hash

hash : main.o contact.o hash.o maillon.o extraire.o menu.o 
	gcc $(CFLAGS) -o $@ $^

main.o: main.c annuaire.h
	gcc $(CFLAGS) -c $<

contact.o : contact.c
	gcc $(CFLAGS) -c $<

hash.o : hash.c
	gcc $(CFLAGS) -c $<

maillon.o : maillon.c
	gcc $(CFLAGS) -c $<

extraire.o : extraire.c
	gcc $(CFLAGS) -c $<

menu.o : menu.c
	gcc $(CFLAGS) -c $<

clean:
	rm *.o hash

