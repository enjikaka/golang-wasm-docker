FROM golang:latest as wasm-builder

RUN mkdir /new-go
WORKDIR /new-go
RUN git clone https://go.googlesource.com/go
WORKDIR /new-go/go
RUN git remote add neelance https://github.com/neelance/go
RUN git fetch --all
RUN git checkout wasm-wip
WORKDIR /new-go/go/src
RUN ./make.bash

RUN ls -la /new-go/go

ENV GOPATH /new-go/go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

ENV GOARCH wasm
ENV GOOS js
