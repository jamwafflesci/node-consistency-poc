#!/bin/bash

echo "Installing/updating Git hooks"

cp -f githooks/* .git/hooks/

chmod +x .git/hooks/*
