docker image ls
docker ps -a
docker stop simple-front-app && docker rm simple-front-app
docker rmi simple-front-app
docker build -t simple-front-app .
docker run -d --name simple-front-app -p 3000:3000 simple-front-app 