docker build -t simple-front-app .
docker run --name simple-front-app -p 3000:3000 simple-front-app 