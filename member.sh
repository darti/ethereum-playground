PORT=30303
HASH=`cat /conf/boot.url`
BOOTNODE=`getent hosts bootnode | awk '{ print $1 }'`
ENODE=enode://$HASH@$BOOTNODE:$PORT

geth init /conf/genesis.json

geth --bootnodes "$ENODE" --networkid 666
