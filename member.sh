set -x

PORT=30301
HASH=`cat /keys/boot.url`
BOOTNODE=`getent hosts bootnode | awk '{ print $1 }'`
ENODE=enode://$HASH@$BOOTNODE:$PORT

geth --datadir /data --networkid 666 --bootnodes $ENODE