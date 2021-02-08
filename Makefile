# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mgavillo <mgavillo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/03/25 17:09:00 by mgavillo          #+#    #+#              #
#    Updated: 2021/02/03 22:45:23 by mgavillo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm

NAME_LIB = libasm.a

SRCS = 	ft_write.s \
		ft_read.s \
		ft_strcmp.s \
		ft_strcpy.s \
		ft_strdup.s \
		ft_strlen.s

SRCS_BONUS =	ft_atoi_base.s \
				ft_list_push_front.s \
				ft_list_size.s \
				ft_list_sort.s \
				ft_list_remove_if.s
				
CC = gcc

CFLAGS = -Wall -Wextra -Werror

NASM = nasm

NASMFLAGS = -f macho64

OBJ = $(SRCS:.s=.o)
OBJ_BONUS = $(OBJ) $(SRCS_BONUS:.s=.o)



all : $(NAME)

$(NAME) : $(OBJ)
	ar rcs $(NAME_LIB) $(OBJ)
	
%.o : %.s
	@echo "\033[0;32mGenerating binary..."
	$(NASM) $(NASMFLAGS) $< -o $@
	@echo "\033[0m"

test : fclean bonus
	$(CC) $(CFLAGS) main.c $(NAME_LIB) && ./a.out

bonus : $(OBJ_BONUS)
	ar rcs $(NAME_LIB) $(OBJ_BONUS)

clean :
	rm -f $(OBJ_BONUS)

fclean : clean
	rm -f $(NAME_LIB)
	rm -f ./a.out

bitcoin:
	@echo "$(DARK_PURPLE)______ _   ___   __    ______ _____ _____ _____ _____ _____ _   _"
	@echo "$(DARK_PURPLE)| ___ \ | | \ \ / /    | ___ \_   _|_   _/  __ \  _  |_   _| \ | |"
	@echo "$(DARK_PINK)| |_/ / | | |\ V /     | |_/ / | |   | | | /  \/ | | | | | |  \| |"
	@echo "$(PURPLE)| ___ \ | | | \ /      | ___ \ | |   | | | |   | | | | | | |     |"
	@echo "$(PINK)| |_/ / |_| | | |      | |_/ /_| |_  | | | \__/\ \_/ /_| |_| |\  |"
	@echo "$(PINK)\____/ \___/  \_/      \____/ \___/  \_/  \____/\___/ \___/\_| \_/"
	@echo "$(END)"

minotaure:
	@echo "$(PURPLE)                                                                 _"
	@echo "$(PURPLE)                                                               _( (~\\"
	@echo "$(PURPLE)        _ _                        /                          ( \> > \\"
	@echo "$(PURPLE)    -/~/ / ~\                     :;                \       _  > /(~\\/"
	@echo "$(PURPLE)   || | | /\ ;\                   |l      _____     |;     ( \/ /  \\ /"
	@echo "$(PURPLE)   _\\)\)\)/ ;;;                   '8o __/-~     ~\   d|     \       /"
	@echo "$(PURPLE)  ///(())(__/~;;\                  \"88p;.  -._ \_;.oP        (_._/_/"
	@echo "$(PURPLE) (((__   __ \\   \                   '>,% (\  (\./)8\"         ;:'  i"
	@echo "$(PURPLE) )))--'.'-- (( ;,8 \               ,;%%%:  ./V^^^V'          ;.   ;."
	@echo "$(PURPLE) ((\   |   /)) .,88  ': ..,,;;;;,-::::::'_::\   ||\          ;[8:  ;"
	@echo "$(PURPLE)  )|  ~-~  |(|(888; ..``'::::8888oooooo.     :\'^^^/,,~--._    |88::||"
	@echo "$(PURPLE)   \ -===- /|  \8;; '':.      oo.8888888888:'((( o.ooo8888Oo;:;:'  |"
	@echo "$(PURPLE)  |_~-___-~_|   '-\.   '        'o'88888888b' )) 888b88888P""'     ;/"
	@echo "$(PURPLE)   ;~~~~;~~         \"'--_'.       b'888888888;(.,"888b888"  ..::;-'"
	@echo "$(PURPLE)    ;      ;              ~\"-....  b'8888888:::::.'8888. .:;;;''"
	@echo "$(PURPLE)       ;    ;                 ':::. ':::OOO:::::::.'OO' ;;;''"
	@echo "$(PURPLE)  :       ;                     '.      \"''::::::''    .'"
	@echo "$(PURPLE)     ;                           '.   \_              /"
	@echo "$(PURPLE)   ;       ;                       +:   ~~--  ':'  -';"
	@echo "$(PURPLE)                                    ':         : .::/"
	@echo "$(PURPLE)       ;                            ;;+_  :::. :..;;;"

bitcoin_autore:
	@echo "$(PURPLE)                                                                 _"
	@echo "$(PURPLE)                                                               _( (~\\"
	@echo "$(PURPLE)        _ _                        /                          ( \> > \\"
	@echo "$(PURPLE)    -/~/ / ~\                     :;                \       _  > /(~\\/"
	@echo "$(PURPLE)   || | | /\ ;\                   |l      _____     |;     ( \/ /  \\ /"
	@echo "$(PURPLE)   _\\)\)\)/ ;;;                   '8o __/-~     ~\   d|     \       /"
	@echo "$(PURPLE)  ///(())(__/~;;\                  \"88p;.  -._ \_;.oP        (_._/_/"
	@echo "$(PURPLE) (((__   __ \\   \                   '>,% (\  (\./)8\"         ;:'  i"
	@echo "$(PURPLE) )))--'.'-- (( ;,8 \               ,;%%%:  ./V^^^V'          ;.   ;."
	@echo "$(PURPLE) ((\   |   /)) .,88  ': ..,,;;;;,-::::::'_::\   ||\          ;[8:  ;          $(DARK_PURPLE)______ _   ___   __    ______ _____ _____ _____ _____ _____ _   _"
	@echo "$(PURPLE)  )|  ~-~  |(|(888; ..``'::::8888oooooo.     :\'^^^/,,~--._    |88::||          $(DARK_PURPLE)| ___ \ | | \ \ / /    | ___ \_   _|_   _/  __ \  _  |_   _| \ | |"
	@echo "$(PURPLE)   \ -===- /|  \8;; '':.      oo.8888888888:'((( o.ooo8888Oo;:;:'  |          $(DARK_PINK)| |_/ / | | |\ V /     | |_/ / | |   | | | /  \/ | | | | | |  \| |"
	@echo "$(PURPLE)  |_~-___-~_|   '-\.   '        'o'88888888b' )) 888b88888P""'     ;/           $(PURPLE)| ___ \ | | | \ /      | ___ \ | |   | | | |   | | | | | | |     |"
	@echo "$(PURPLE)   ;~~~~;~~         \"'--_'.       b'888888888;(.,"888b888"  ..::;-'             $(PINK)| |_/ / |_| | | |      | |_/ /_| |_  | | | \__/\ \_/ /_| |_| |\  |"
	@echo "$(PURPLE)    ;      ;              ~\"-....  b'8888888:::::.'8888. .:;;;''              $(PINK)\____/ \___/  \_/      \____/ \___/  \_/  \____/\___/ \___/\_| \_/"
	@echo "$(PURPLE)       ;    ;                 ':::. ':::OOO:::::::.'OO' ;;;''"
	@echo "$(PURPLE)  :       ;                     '.      \"''::::::''    .'"
	@echo "$(PURPLE)     ;                           '.   \_              /"
	@echo "$(PURPLE)   ;       ;                       +:   ~~--  ':'  -';"
	@echo "$(PURPLE)                                    ':         : .::/"
	@echo "$(PURPLE)       ;                            ;;+_  :::. :..;;;"

re : fclean all

