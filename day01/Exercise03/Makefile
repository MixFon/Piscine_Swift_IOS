# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: widraugr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/29 13:07:44 by widraugr          #+#    #+#              #
#    Updated: 2020/11/24 20:27:07 by mixfon           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = cards

FILE_C = main.swift\
		 Color.swift\
		 Value.swift\
		 Card.swift\
		 Deck.swift

all : $(NAME)

$(NAME): $(FILE_C)
	swiftc $(FILE_C) -o $(NAME)
	./$(NAME)

files:
	cat $(FILE_C)

clean:
	/bin/rm -f $(NAME)
	
re: fclean all 
