#! /usr/bin/env bash

IMAGE=ethereum/client-go:alltools-stable

docker run --rm -v $(pwd)/conf:/keys $IMAGE bootnode -genkey /keys/boot.key
docker run --rm -v $(pwd)/conf:/keys $IMAGE sh -c "bootnode -writeaddress -nodekey=/keys/boot.key > /keys/boot.url"