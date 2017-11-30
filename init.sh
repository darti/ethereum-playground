#! /usr/bin/env bash

IMAGE=ethereum/client-go:alltools-stable

docker run --rm -v $(pwd)/genesis:/data $IMAGE geth --datadir /data init /data/genesis.json