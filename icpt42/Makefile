all:
	docker-compose -f ./srcs/docker-compose.yml up --build 
up:
	docker-compose -f ./srcs/docker-compose.yml up
down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker system prune -af

 fclean:
	docker system prune -af 
	sudo rm -rf /home/rdoukali/data/wordpress/* 
	sudo rm -rf /home/rdoukali/data/mariadb/* 
	docker volume rm mariadb wordpress