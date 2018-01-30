#!/bin/sh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Source NVM

nvm exec forever stopall

nvm exec forever start index.js

nvm exec forever list
