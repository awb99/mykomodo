#!/bin/bash
: ${CONTAINER_NAME:="mykomodo_komodod_1"}
docker exec ${CONTAINER_NAME} ./komodo-cli "$@"
