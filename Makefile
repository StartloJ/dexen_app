VERSION := 0.1.0-dev
TAG := $(VERSION)
GIT_COMMIT := $(shell git rev-parse --short HEAD)
DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

.PHONY: dexen
build:
	GO111MODULE=on CGO_ENABLED=0 go build -ldflags "-X main.version=$(VERSION) -X main.commit=$(GIT_COMMIT) -X main.date=$(DATE)" -o dexen

docker:
	docker build -t dexen:$(TAG) --build-arg=COMMIT=$(GIT_COMMIT) --build-arg=VERSION=$(VERSION) --build-arg=DATE=$(DATE) .

## I add option `--network slirp4netns` for fix Podman bug. ref: https://github.com/containers/podman/issues/22109#issuecomment-2012040231
podman:
	podman build --network slirp4netns -t dexen:$(TAG) --build-arg=COMMIT=$(GIT_COMMIT) --build-arg=VERSION=$(VERSION) --build-arg=DATE=$(DATE) .

## lint: 🚨 Run lint checks
.PHONY: lint
lint:
	go run github.com/golangci/golangci-lint/cmd/golangci-lint@v1.57.1 run ./...

.PHONY: clean
clean:
	-rm dexen