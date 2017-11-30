#! /usr/bin/env bash

IMAGE=ethereum/client-go:alltools-stable

docker volume create ethereum-keys

docker run --rm -v $(pwd):/data $IMAGE geth --datadir /data/data/genesis init /data/genesis.json

docker run --rm -v ethereum-keys:/keys $IMAGE bootnode -genkey /keys/boot.key

docker run --rm -v ethereum-keys:/keys $IMAGE sh -c "bootnode -writeaddress -nodekey=/keys/boot.key > /keys/boot.url"