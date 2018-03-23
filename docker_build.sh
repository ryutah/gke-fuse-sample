# GOOS=linux GOARCH=amd64 go build -o sample main.go
docker build -t ${DOCKER_IMAGE_NAME} .
