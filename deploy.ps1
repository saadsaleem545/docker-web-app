docker pull ghcr.io/saadsaleem545/docker-web-app:latest

docker stop docker-web-app 2>$null
docker rm docker-web-app 2>$null

docker run -d `
  --name docker-web-app `
  -p 8080:80 `
  ghcr.io/saadsaleem545/docker-web-app:latest

docker ps