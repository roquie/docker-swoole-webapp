IMAGE = roquie/docker-swoole-webapp
VERSION = latest

# build dockerfile from template
build:
	docker run --rm -it -v $$(pwd)/alpine:/app roquie/docker-jinja2-cli jinja2 Dockerfile.tmpl php73.yaml --format=yaml > Dockerfile

image: build
	docker build -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)

all: image push
