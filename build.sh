#!/bin/sh
export VERSION=2.0.1

echo Building mongo-cli:${VERSION}

docker build --no-cache -t mongo-cli:${VERSION} . \
                --build-arg http_proxy=http://10.171.41.73:3128 \
		--build-arg HTTP_PROXY=http://10.171.41.73:3128 \
                --build-arg https_proxy=http://10.171.41.73:3128 \
		--build-arg HTTPS_PROXY=http://10.171.41.73:3128

echo Pushing last version on docker-hub
docker tag mongo-cli:${VERSION} jraverdyorange/mongo-cli:${VERSION}
docker tag jraverdyorange/mongo-cli:${VERSION} jraverdyorange/mongo-cli:latest
docker push jraverdyorange/mongo-cli
