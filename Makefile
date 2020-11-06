REPO:="minyk"
IMAGE:="pyspark-notebook"
TAG:="latest"

build:
	docker build . -t $(REPO)/$(IMAGE):$(TAG)

custom:
	docker build . -t $(REPO)/$(IMAGE):$(TAG) -f Dockerfile.custom-spark

dev:
	docker run -it -p 8888:8888 --rm $(REPO)/$(IMAGE):$(TAG) bash
