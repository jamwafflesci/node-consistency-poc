#!/bin/sh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Source NVM

nvm install

npm install -g yarn forever

./forever.sh
