VERSION = 0.1.0-dev
TAG = $(VERSION)
GIT_COMMIT = $(git rev-parse --short HEAD)
DATE= $(date -u +"%Y-%m-%dT%H:%M:%SZ")
GOLANGCI_CONTAINER=golangci/golangci-lint:v1.44-alpine

export DOCKER_BUILDKIT = 1

.PHONY: dexen
build:
	GO111MODULE=on CGO_ENABLED=0 go build -ldflags "-X main.version=$(VERSION) -X main.commit=$(GIT_COMMIT) -X main.date=$(DATE)" -o dexen

docker:
	docker build -t xendit/dexen:$(TAG) --build-arg=COMMIT=$(GIT_COMMIT) --build-arg=VERSION=$(VERSION) --build-arg=DATE=$(DATE) .

.PHONY: lint
lint:
	docker run --rm -v $(pwd):/go/src/github.com/StartloJ/dexen_app -w /go/src/github.com/StartloJ/dexen_app $(GOLANGCI_CONTAINER) golangci-lint run

.PHONY: clean
clean:
	-rm dexen