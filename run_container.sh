#/bin/bash
CONTAINER="cfs_docker"

sudo docker run --rm -ti -v $PWD/shared_env:/home/shared --privileged \
                --sysctl fs.mqueue.msg_max=2000 $CONTAINER /bin/bash

