#! /usr/bin/env bash

IMAGE=ethereum/client-go:alltools-stable

docker run --rm -v $(pwd):/data $IMAGE geth --datadir /data/data/genesis init /data/genesis.json

docker run --rm -v $(pwd):/data $IMAGE bootnode -genkey /data/data/keys/boot.key