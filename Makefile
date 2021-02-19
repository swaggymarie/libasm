# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mgavillo <mgavillo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/03/25 17:09:00 by mgavillo          #+#    #+#              #
#    Updated: 2021/02/15 16:01:13 by mgavillo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRC =	 	ft_write.s \
		ft_read.s \
		ft_strcmp.s \
		ft_strcpy.s \
		ft_strdup.s \
		ft_strlen.s

SRC_BONUS =	ft_atoi_base.s \
		ft_list_push_front.s \
		ft_list_size.s \
		ft_list_sort.s \
		ft_list_remove_if.s

SRC_DIR = ./srcs

CC = clang
CFLAGS = -I $(INCLUDE) -L. -Wall -Wextra -Werror

NASM = nasm
NASMFLAGS = -f elf64 -I$(INCLUDE)

INCLUDE = ./include
HEADER = $(INCLUDE)/libasm.h

OBJ_DIR = ./objs
OBJ = $(patsubst %.s, ${OBJ_DIR}/%.o, ${SRC})
OBJ_BONUS = $(OBJ) $(patsubst %.s, ${OBJ_DIR}/%.o, ${SRC_BONUS})

BIN = test
TEST_FILE = test.txt
#vpath %.s ./src
#vpath %.h ./include

.PHONY : all test bonus clean fclean re

all : $(NAME)

$(NAME) : $(OBJ)
	ar rcs $@ $^
	ranlib $(NAME)
	@echo "$(NAME) has been created"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s $(HEADER)
	mkdir -p $(OBJ_DIR)
	@echo "\033[0;32mGenerating binary..."
	$(NASM) $(NASMFLAGS) -s $< -o $@
	@echo "\033[0m"

test : fclean bonus main.c $(NAME)
	touch $(TEST_FILE)
	$(CC) main.c $(CFLAGS) -o $(BIN) -lasm
	./$(BIN)

bonus : $(OBJ_BONUS)
	ar rcs $(NAME) $^
	ranlib $(NAME)
	@echo "$(NAME) with bonus has been created"

clean :
	rm -f $(OBJ_BONUS)

fclean : clean
	rm -f $(NAME)
	rm -f $(BIN)

re : fclean all
