#!/bin/bash

echo "Installing/updating Git hooks"

cp -Rf githooks/ .git/hooks/

chmod +x .git/hooks/*

./githooks/check-node-env.sh
