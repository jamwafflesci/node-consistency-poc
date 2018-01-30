#!/bin/sh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Source NVM

echo "$0: Using Node version $(node -v)"

echo "$0: Using Forever at $(which forever)"

nvm exec forever stopall

nvm exec forever start index.js

nvm exec forever list
