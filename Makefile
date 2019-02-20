# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: skunz <skunz@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/09/23 20:21:22 by skunz             #+#    #+#              #
#    Updated: 2019/02/20 11:39:54 by skunz            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

##################################  GENERAL  ###################################

INC = -I ./includes/

SRC_DIR = ./src/

OBJ_DIR = ./.obj/

NAME =	libft.a

FLAGS = -Wall -Wextra -Werror

####################################  LIBC  ####################################

#SOURCES
LIBCS = ft_atoi.c ft_bzero.c ft_isalnum.c ft_isalpha.c ft_isascii.c            \
		ft_isdigit.c ft_isprint.c ft_memccpy.c ft_memchr.c ft_memcmp.c         \
		ft_memcpy.c ft_memmove.c ft_memset.c ft_strcat.c ft_strchr.c           \
		ft_strcmp.c ft_strcpy.c ft_strdup.c ft_strlen.c ft_strncat.c           \
		ft_strncmp.c ft_strlcat.c ft_strncpy.c ft_strnstr.c ft_strrchr.c       \
		ft_strstr.c ft_tolower.c ft_toupper.c

#################################  ADDITIONAL  #################################

#SOURCES
ADDIS = ft_itoa.c ft_memalloc.c ft_memdel.c ft_putchar.c ft_putchar_fd.c       \
		ft_putendl.c ft_putendl_fd.c ft_putnbr.c ft_putnbr_fd.c ft_putstr.c    \
		ft_putstr_fd.c ft_strclr.c ft_strdel.c ft_strequ.c ft_striter.c        \
		ft_striteri.c ft_strjoin.c ft_strmap.c ft_strmapi.c ft_strnequ.c       \
		ft_strnew.c ft_strsplit.c ft_strsub.c ft_strtrim.c

####################################  BONUS  ###################################

#SOURCES
BNUSS =	ft_lstnew.c ft_lstadd.c ft_lstiter.c ft_lstmap.c ft_lstdel.c           \
		ft_lstdelone.c

################################  MY-FUNCTIONS  ################################

#SOURCES
MYS = 	ft_intlen.c ft_islower.c ft_isupper.c ft_iswhitespace.c ft_lstsize.c \
		ft_printinbaselower.c ft_printinbaseupper.c ft_putnbru.c ft_free2d.c \
		ft_uintlen.c ft_lltoa_base.c ft_lllen.c ft_ulllen.c ft_putnbrll.c    \
		ft_print_double.c ft_pow.c get_next_line.c ft_lstpush.c

################################ QUEUE #########################################

#NAME
Q_NAME = libftq.a

#DIR
Q_DIR = ./queue/

#SOURCES
SRC_Q = queue.c

#OBJ
Q_OBJ = $(addprefix $(OBJ_DIR), $(SRC_Q:.c=.o))

#MSG
Q_COM_STRING  = "Queue Compilation Successful"

#####################################  ALL  ####################################

#OBJECTS
OBJ = $(addprefix $(OBJ_DIR),$(LIBCS:.c=.o))
OBJ += $(addprefix $(OBJ_DIR),$(ADDIS:.c=.o))
OBJ += $(addprefix $(OBJ_DIR),$(BNUSS:.c=.o))
OBJ += $(addprefix $(OBJ_DIR),$(MYS:.c=.o))

###############################  COLORS AND TEXT  ##############################

#COLORS
COM_COLOR   = \033[0;32m
NO_COLOR    = \033[m

#TEXT
COM_STRING  = "Library Compilation Successful"
CLEAN_OBJ	= "Cleaned Libft Objects"
CLEAN_NAME	= "Cleaned Library"

####################################  RULES  ###################################

all: obj $(NAME)

obj:
	@mkdir -p $(OBJ_DIR)

$(NAME): $(OBJ)
	@ar rc $@ $^
	@ranlib $@
	@echo "$(COM_COLOR)$(COM_STRING)$(NO_COLOR)"

#BASE OBJ
$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@gcc $(FLAGS) $(INC) -c $< -o $@

#QUEUE OBJ
$(OBJ_DIR)%.o: $(Q_DIR)%.c
	@gcc $(FLAGS) $(INC) -c $< -o $@

queue: $(OBJ) $(Q_OBJ)
	@ar rc $(Q_NAME) $(OBJ) $(Q_OBJ)
	@ranlib $(Q_NAME)
	@echo "$(COM_COLOR)$(Q_COM_STRING)$(NO_COLOR)"

clean:
	@/bin/rm -rf $(OBJ_DIR)
	@echo "$(COM_COLOR)$(CLEAN_OBJ)$(NO_COLOR)"

fclean: clean
	@/bin/rm -f $(NAME)
	@/bin/rm -f $(Q_NAME)
	@echo "$(COM_COLOR)$(CLEAN_NAME)$(NO_COLOR)"

re: fclean all
