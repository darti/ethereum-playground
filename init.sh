#! /usr/bin/env bash

IMAGE=ethereum/client-go:alltools-stable

docker volume create ethereum-keys
docker volume create ethereum-master

docker run --rm -v ethereum-master:/data -v $(pwd):/conf/ $IMAGE geth --datadir /data init /conf/genesis.json

docker run --rm -v ethereum-keys:/keys $IMAGE bootnode -genkey /keys/boot.key

docker run --rm -v ethereum-keys:/keys $IMAGE sh -c "bootnode -writeaddress -nodekey=/keys/boot.key > /keys/boot.url"