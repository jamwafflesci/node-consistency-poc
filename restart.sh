#!/bin/sh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Source NVM

echo "$0: NVMRC version: $(cat .nvmrc)"

nvm install

echo "$0: Using Node version $(node -v)"

npm install -g yarn forever

./forever.sh
