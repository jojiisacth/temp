FROM alpine:3.3
MAINTAINER Frederic Gingras <frederic@gingras.cc> (@kiasaki)

RUN apk update && apk add curl git mercurial bzr 'go=1.5.4-r0' && rm -rf /var/cache/apk/*

ENV GOROOT /usr/lib/go
ENV GOPATH /gopath
ENV GOBIN /gopath/bin   
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN mkdir /src

#RUN cd /src; go get -u github.com/kataras/iris/iris
RUN cd /src; go get -u github.com/gorilla/mux; 

COPY . /src

EXPOSE 8081

CMD cd /src && go run ./server.go