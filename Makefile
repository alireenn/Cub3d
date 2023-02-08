# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mruizzo <mruizzo@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/25 19:02:32 by mruizzo           #+#    #+#              #
#    Updated: 2023/02/08 17:02:22 by mruizzo          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME    = cub3d
NAME_B  = cub3d_bonus
SRCS    = libs/Get_Next_Line/get_next_line_utils.c libs/Get_Next_Line/get_next_line.c \
		 libs/string.c srcs/game/bres_algo.c srcs/game/colliding.c srcs/game/events.c \
		 srcs/game/game.c srcs/game/loop_event.c srcs/game/moves.c \
		 srcs/game/raycast_calc.c srcs/game/raycast.c srcs/game/render.c srcs/parsing/check.c \
		 srcs/parsing/get_rules.c srcs/parsing/parse_map.c srcs/utils/choose.c srcs/utils/easy_math.c \
		 srcs/utils/error_and_debug.c srcs/utils/img_utils.c srcs/utils/init.c srcs/utils/math_stuff.c srcs/main.c srcs/parsing/check_utils.c
B_SRCS  = libs/Get_Next_Line/get_next_line_utils.c libs/Get_Next_Line/get_next_line.c libs/string.c \
		 bonus/game/bres_algo.c bonus/game/colliding.c bonus/game/events.c bonus/game/game.c bonus/game/loop_event.c \
		 bonus/game/minimap.c bonus/game/moves.c bonus/game/raycast_calc.c bonus/game/raycast.c bonus/game/render.c bonus/parsing/check.c \
		 bonus/parsing/get_rules.c bonus/parsing/parse_map.c bonus/utils/choose.c bonus/utils/easy_math.c bonus/utils/error_and_debug.c bonus/utils/img_utils.c bonus/parsing/check_utils.c bonus/game/win.c\
		 bonus/utils/init.c bonus/utils/math_stuff.c bonus/main.c
HEADER  = incl/cub3d.h incl/get_next_line.h incl/libft.h
CC      = @gcc
CFLAGS  = -g -O3 -I -Wall -Werror -Wextra
MLXFLAG = -lmlx -framework OpenGL -framework AppKit
SRCS_DIR        = ./srcs
OBJS_DIR        = ./objs
OBJS            = $(patsubst $(SRCS_DIR)%,$(OBJS_DIR)%,$(SRCS:.c=.o))
B_OBJS          = $(patsubst $(SRCS_DIR)%,$(OBJS_DIR)%,$(B_SRCS:.c=.o))

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(MLXFLAG)

%.o: %.c $(HEADER)
	$(CC) -c -o $@ $< $(CFLAGS)
clean:
	@rm -f $(OBJS)
fclean: clean
	@printf "removing program executable...\n"
	@/bin/rm -f ./cub3d
	@/bin/rm -rf bin
	@printf "\033[0;35mExecutable removed!\n"
	@echo "\033[0;37m"
	
git:
	make fclean
	git add .
	git commit -m cub3d
	git push
re: fclean all
my: all clean