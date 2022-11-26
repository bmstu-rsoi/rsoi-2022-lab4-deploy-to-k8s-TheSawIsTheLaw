makeJars:
	cd src/gateway && sudo ./gradlew bootJar
	cd src/cars && sudo ./gradlew bootJar
	cd src/payment && sudo ./gradlew bootJar
	cd src/rental && sudo ./gradlew bootJar

imgs:
	make makeJars
	cd src/gateway && sudo docker build --no-cache -t thesawisthelaw/gateway . && sudo docker push thesawisthelaw/gateway:latest
	cd src/cars && sudo docker build --no-cache -t thesawisthelaw/cars . && sudo docker push thesawisthelaw/cars:latest
	cd src/rental && sudo docker build --no-cache -t thesawisthelaw/rental . && sudo docker push thesawisthelaw/rental:latest 
	cd src/payment && sudo docker build --no-cache -t thesawisthelaw/payment . && sudo docker push thesawisthelaw/payment:latest 

shit:
	sudo docker-compose rm -f
	sudo docker-compose down --volumes
	sudo docker-compose build --no-cache
	sudo docker-compose up --force-recreate
