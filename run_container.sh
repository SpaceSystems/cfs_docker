#/bin/bash
CONTAINER="cfs_docker"

sudo docker run --rm -ti -v $PWD/shared_env:/home/shared --privileged \
                --sysctl fs.mqueue.msg_max=2000 -p 127.0.0.1:1234:1234/udp \
                $CONTAINER /bin/bash

