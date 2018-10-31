IMAGE = roquie/docker-swoole-webapp
VERSION = latest

image:
	docker build -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)

all: image push
