NAME = "inception"

$(NAME) : 
	cd srcs/ &&\
	docker-compose up -d


all : 	$(NAME)

clean : 
	cd srcs/ &&\
	docker-compose down

re : clean all 

.PHONY : all clean re
