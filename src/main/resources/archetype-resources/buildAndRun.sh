#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
#!/usr/bin/env bash
mvn clean package && docker build -t ivonet/${artifactId} .
docker rm -f ${artifactId} || true && docker run -d -p 8080:8080 -p 9990:9990 --name ${artifactId} ivonet/${artifactId}
