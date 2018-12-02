#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
#!/usr/bin/env bash

RUNNING=$(docker inspect --format="{{ .State.Running }}" ${artifactId} 2> /dev/null)
if [ $? -eq 1 ] || [ "$RUNNING" == "false" ]; then
    rm -rfv ./artifact/*.war

    docker run \
        -d \
        --rm \
        --name ${artifactId} \
        -p 8080:8080 \
        -p 4848:4848 \
        -p 8009:8009 \
        -p 8181:8181 \
        -v "$(pwd)/artifact:/autodeploy" \
        ivonet/payara:4

    echo "WildFly admin console credentials:"
    echo "Url: http://localhost:4848"
    echo "Usr: admin"
    echo "Pwd: secfet"

    mvn clean package
else
    /usr/bin/osascript -e 'display notification "Stopping..." with title "${artifactId}"'
    docker rm -f ${artifactId}
fi

