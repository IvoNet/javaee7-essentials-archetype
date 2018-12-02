#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
#!/usr/bin/env bash
#DEPLOY="false"
DEPLOY="true"
IMAGE=${artifactId}
#VERSION=latest
VERSION=${version}

OPTIONS=""
OPTIONS="--no-cache --force-rm"
#OPTIONS="--no-cache"
#OPTIONS="--force-rm"

docker build ${OPTIONS} -t ivonet/${IMAGE}:${VERSION} .
if [ "$?" -eq 0 ] && [ ${DEPLOY} == "true" ]; then
    docker push ivonet/${IMAGE}:${VERSION}
fi