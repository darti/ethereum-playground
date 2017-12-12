
function bootnode_address() {
    PORT=30301
    HASH=`cat /conf/boot.url`
    BOOTNODE=`getent hosts bootnode | awk '{ print $1 }'`
    ENODE=enode://$HASH@$BOOTNODE:$PORT
}

function bootnode() {
    bootnode -genkey /conf/boot.key 
    bootnode -writeaddress -nodekey=/conf/boot.key > /conf/boot.url
    bootnode -nodekey=/conf/boot.key -addr 0.0.0.0:30301 -verbosity=4
}

function master() { 
    geth init /conf/genesis.json

    sleep 3

    geth \
        --bootnodes="$ENODE" \
        --networkid=666 \
        --rpc --ws \
        --rpccorsdomain="*" --wsorigins="*" \
        --wsaddr="0.0.0.0" --rpcaddr="0.0.0.0" \
        --rpcapi="db,personal,eth,net,web3,admin,debug" && \
        --nodiscover

}

function node() { 
    geth init /conf/genesis.json

    sleep 3

    geth \
        --bootnodes="$ENODE" \
        --networkid=666 && \
        --nodiscover
}

function miner() {
    geth init /conf/genesis.json

    sleep 3
    
    geth --mine --minerthreads=1  \
        --networkid=666 \
        --etherbase=0x0000000000000000000000000000000000000666 \
        --nodiscover
}

bootnode_address

"$@"