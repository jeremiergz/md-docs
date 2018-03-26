#!/bin/bash
## Author: Jeremie Rodriguez <contact@jeremierodriguez.com> (https://github.com/jeremiergz)

CONTAINER_NAME=${1}
BLUE="\e[94m"
GRAY="\e[90m"
GREEN="\e[92m"
RED="\e[91m"
NORMAL="\e[0m"

usage() {
    echo "Usage: ${0} [container name]"
    exit 1
}

fail() {
    if [ -z "${*}" ]
    then
        echo -en ${NORMAL}
    else
        echo -e "${RED}${*}${NORMAL}"
    fi
    usage
    exit 1
}

if [ -z ${CONTAINER_NAME} ]; then fail "Error: missing container name parameter"; fi

echo -en ${RED}
VOLUMES=$(docker inspect --format='{{range $vol, $path := .Config.Volumes}}{{$vol}} {{end}}' ${CONTAINER_NAME}) || fail
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
FILENAME=${CONTAINER_NAME}"_"${DATE}.tar.gz
echo -en ${NORMAL}

echo -e "${BLUE}Backup Docker volume(s) from: ${GRAY}${CONTAINER_NAME}${NORMAL}"

echo "  - pause docker container"
docker pause ${CONTAINER_NAME} >> /dev/null

echo "  - backup data from container"
docker run --rm --volumes-from ${CONTAINER_NAME} -v $(pwd):/backup busybox tar -czf /backup/${FILENAME} ${VOLUMES} >> /dev/null 2>&1

echo "  - unpause docker container"
docker unpause ${CONTAINER_NAME} >> /dev/null

echo -e "${GREEN}Successfully created: ${GRAY}${FILENAME}${NORMAL}"
