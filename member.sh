set -x

PORT=30301
HASH=`cat /conf/boot.url`
BOOTNODE=`getent hosts bootnode | awk '{ print $1 }'`
ENODE=enode://$HASH@$BOOTNODE:$PORT

geth init /conf/genesis.json

echo $ENODE

geth --verbosity=4 --bootnodes="$ENODE" --networkid=666 --rpc --ws --rpccorsdomain="*" --wsaddr="0.0.0.0" --rpcaddr="0.0.0.0" --rpcapi="db,personal,eth,net,web3"
