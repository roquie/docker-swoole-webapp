IMAGE = roquie/docker-swoole-webapp
VERSION = latest
PHP = 74

# build dockerfile from template
alpine:
	docker run --rm -it -v $$(pwd):/app roquie/docker-jinja2-cli jinja2 images/alpine.tmpl "templates/alpine/php${PHP}.yaml" --format=yaml > "Dockerfile.alpine-${PHP}"

fix_circleci_bug:
	sed 's/\^\@\^\@//' "Dockerfile.alpine-${PHP}" > Dockerfile
	rm "Dockerfile.alpine-${PHP}"
	mv Dockerfile "Dockerfile.alpine-${PHP}"

image:
	docker build -f "Dockerfile.alpine-${PHP}" -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)

run:
	docker run --rm -it -p 8080:8080 $(IMAGE):$(VERSION)

test:
	docker run --rm -it -v $$(pwd):/app $(IMAGE):$(VERSION) php tests.php


all: alpine image push
