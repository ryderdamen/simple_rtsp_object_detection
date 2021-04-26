IMAGE_NAME=ryderdamen/simple-rtsp-object-detector
VERSION=latest

.PHONY: run
run:
	@docker run --env-file settings.env -p 8000:80 $(IMAGE_NAME):$(VERSION)

.PHONY: build
build:
	@export IMAGE_NAME=$(IMAGE_NAME):$(VERSION) && cd deployment && bash install.sh

.PHONY: install
install:
	@make build

.PHONY: deploy
deploy:
	@kubectl apply -f deployment/kubernetes

.PHONY: push
push:
	@docker push $(IMAGE_NAME):$(VERSION)
