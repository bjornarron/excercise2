FROM golang:1.16-alpine as build
WORKDIR /home
RUN apk add --no-cache git
RUN git clone https://github.com/betauia/Beetroot.git  
RUN cd ./Beetroot/cmd/beetroot && go build -o main .

FROM alpine:3.16.2
RUN apk add --no-cache tzdata
COPY --from=build /home/Beetroot/cmd/beetroot .
ENV TZ=Europe/Oslo
EXPOSE 8080
CMD ./main