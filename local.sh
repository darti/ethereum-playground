# /usr/bin/env bash

ENODE=enode://d368043614502b18c940ef23cf3e409f6520fb449b1e17e0f3354e26b871fa862fa76bbe5d03f03d25fdfcd91f0eca6fe5a2495079e491f861a617e6dcc8a2da@127.0.0.1:30303


geth init ./conf/genesis.json  --datadir ./data
geth  --datadir ./data --verbosity=4 --bootnodes "$ENODE" --networkid 666 --nodiscover --rpc --ws --wsapi eth,admin