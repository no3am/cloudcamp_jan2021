### To build the docker image

`docker build -t nginx-webserver`

### Test docker image locally:

`docker run -it --rm -d -p 8080:80 --name web webserver`

Using your browser navigate to `http://localhost:8080`