FROM golang:1.21-alpine as builder

WORKDIR /go/src/github.com/StartloJ/dexen_app

COPY . .

ARG VERSION=dev
ARG COMMIT=dev
ARG DATE=dev

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w -X main.version=${VERSION} -X main.commit=${COMMIT} -X main.date=${DATE}" -a -o dexen .

FROM gcr.io/distroless/static-debian12

WORKDIR /app

COPY --from=builder /go/src/github.com/StartloJ/dexen_app/dexen ./

ENTRYPOINT [ "./dexen" ]