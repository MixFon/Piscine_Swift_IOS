# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: widraugr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/29 13:07:44 by widraugr          #+#    #+#              #
#    Updated: 2020/11/24 14:40:14 by mixfon           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = cards

FILE_C = main.swift\
		 Color.swift\
		 Value.swift

all : $(NAME)

$(NAME): $(FILE_C)
	swiftc $(FILE_C) -o $(NAME)
	./$(NAME)

clean:
	/bin/rm -rf $(DIROBJ)
	
files:
	cat $(FILE_C)

fclean: clean
	/bin/rm -f $(NAME)
	/bin/rm -rf *.dSYM
	
re: fclean all 
