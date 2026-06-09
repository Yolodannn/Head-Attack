#!/bin/bash

CASEFILE=${1:-"testcase/docker-compose-late-block.yml"}

if [ ! -f "$CASEFILE" ]; then
  echo "invalid param, case file is not exist"
  exit 1
fi

./scripts/build_late_block.sh || exit 1
./scripts/clear.sh || exit 1
./scripts/genesis.sh || exit 1

cp "$CASEFILE" docker-compose.yml && docker compose -f docker-compose.yml up -d || echo "start late-block testcase failed"

echo "start late-block testcase success"
