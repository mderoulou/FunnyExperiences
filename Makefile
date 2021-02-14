##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## Makefile for my_printf
##

NAME	=		a.out

SRCT 	=		tests/test_one.c	\

FLAGS	=		-L./lib/my -lmy -I./include/

TFLAG 	= 	-lcriterion --coverage -fprofile-arcs

COV 	=	--exclude tests/ -o coverage.html

all:
		make -C ./lib/my re
		gcc -g -o $(NAME) main.c $(FLAGS)
		strip -w --strip-symbol=puts@@GLIBC_2.2.5 a.out

clean:
		rm -f $(OBJ)
		make -C ./lib/my clean
		rm -f *.html
		rm -f *.gcno
		rm -f *.gcda

fclean:	clean
		rm -f $(NAME)
		make -C ./lib/my fclean
		rm -f *.gcno
		rm -f *.gcda
		rm -f *.html

re: fclean all

valgrind: fclean
	make -C ./lib/my re
	gcc -g -o $(NAME) $(SRC) main.c $(FLAGS)
	valgrind -s --leak-check=full --track-origins=yes ./$(NAME) test
