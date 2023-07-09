FROM golang:latest AS build

WORKDIR /usr/src/app
COPY ./app .
RUN go build

FROM scratch 
COPY --from=build /usr/src/app/fullcycle-go . 
ENTRYPOINT [ "./fullcycle-go" ]