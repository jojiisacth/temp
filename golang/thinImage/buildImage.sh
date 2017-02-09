echo stopping any docker instances 
docker stop $(docker ps -q)

#rm myapp

export GOPATH=$PWD
echo 'go path set :'$GOPATH 
go get github.com/gorilla/context
echo got gorilla/context
go get github.com/gorilla/mux
echo got gorilla/mux

echo building app 

docker run --rm -v "$PWD":/usr/src/myapp   -v  "$PWD"/src/github.com:/usr/local/go/src/github.com  -w /usr/src/myapp golang:1.8-alpine    go build 
echo running conianer
docker run   -v $PWD:/app   -w /app  -p  8083:8081  alpine:3.5  ./myapp &
sleep 5
curl http://localhost:8083