@echo off
set IMAGE_NAME=my-2048-game

docker rm -f game-instance-1 game-instance-2
docker rmi %IMAGE_NAME%

echo Building Docker image...
docker build -t %IMAGE_NAME% .

echo Running first container on port 8080...
docker run -d -p 8080:8080 --name game-instance-1 %IMAGE_NAME%

echo Running second container on port 9090...
docker run -d -p 9090:8080 --name game-instance-2 %IMAGE_NAME%

echo Containers started successfully on localhost:8080 and localhost:9090!
pause