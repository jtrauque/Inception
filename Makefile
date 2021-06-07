NAME = "inception"

$(NAME) : 
	docker-compose --project-directory srcs -f srcs/docker-compose.yml up -d

all : 	$(NAME)

clean : 
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down

re : clean all 

.PHONY : all clean re
