FROM golang:latest AS builder

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY ./cmd ./cmd

RUN go build -o pvzmanager ./cmd/main.go

FROM alpine:3.19

WORKDIR /root/

RUN apk --no-cache upgrade

COPY --from=builder /app/pvzmanager .

CMD ["./pvzmanager"] 

EXPOSE 8080