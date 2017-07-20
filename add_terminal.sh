#/bin/bash
CONTAINER=$(docker ps -q)

sudo docker exec -it $CONTAINER /bin/bash

