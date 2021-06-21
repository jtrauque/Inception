NAME = "inception"

$(NAME) : 
	# wget -c https://wordpress.org/latest.tar.gz
	# tar xf latest.tar.gz -C ./srcs/requirements/tools/code/
	# rm -rf latest.tar.gz
	# cp ./srcs/requirements/wordpress/srcs/wp-config.php ./srcs/requirements/tools/code/wordpress/
	cd srcs/ &&\
	docker-compose up -d


all : 	$(NAME)

clean : 
	cd srcs/ &&\
	docker-compose down

re : clean all 

.PHONY : all clean re
