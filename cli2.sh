#!/bin/bash
: ${CONTAINER_NAME:="mykomodo_komodod2_1"}
docker exec ${CONTAINER_NAME} ./komodo-cli \
 -rpcport=13000 -rpcuser=coinrpc -rpcconnect=127.0.0.1 \
  "$@"
