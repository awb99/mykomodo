source ./coin.conf
curl -s -v \
     --user $rpcuser:$rpcpassword \
     --data-binary '{"jsonrpc": "1.0", "id": "curltest4", "method": "coinsupply", "params": []}' \
     -H 'content-type: text/plain;' \
     http://127.0.0.1:$rpcport/
