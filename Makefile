SRCS		=	ft_strlen.s ft_strcmp.s ft_strcpy.s ft_write.s ft_read.s ft_strdup.s
OBJS		=	$(SRCS:.s=.o)

NA			=	nasm
NA_FLAGS	=	-f macho64
FLAGS 		=	-Wall -Werror -Wextra
NAME		=	libasm.a
TEST		=	test
FILE        =   test.txt

%.o:			%.s
				$(NA) $(NA_FLAGS) $< 

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)

clean:
				rm -rf $(OBJS) 

fclean:			clean
				rm -rf $(NAME) $(TEST) $(FILE)

re:				fclean $(NAME)

test:			$(NAME) main.c
				@gcc  -o $(TEST) main.c $(NAME)
				@./$(TEST)