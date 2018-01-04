#!/bin/sh

NVM_VERSION=$(nvm --version &> /dev/null)

DESIRED_NODE_VERSION="9.3.0"

CURRENT_NODE_VERSION=$(node -v)

if [[ "$CURRENT_NODE_VERSION" != "v${DESIRED_NODE_VERSION}" ]]; then
	echo "Node v$DESIRED_NODE_VERSION is required. You are on $CURRENT_NODE_VERSION"
	echo "Installing Node v$DESIRED_NODE_VERSION"

	if [ -z "$NVM_VERSION" ]; then
		echo "Sourcing NVM"

		export NVM_DIR="$HOME/.nvm"

		. "/usr/local/opt/nvm/nvm.sh"
	fi

	nvm install "$DESIRED_NODE_VERSION" --reinstall-packages-from "$CURRENT_NODE_VERSION"

	nvm alias default "$DESIRED_NODE_VERSION"

	nvm use "$DESIRED_NODE_VERSION"

	echo
	echo "Run 'nvm use $DESIRED_NODE_VERSION' to start using the correct Node version, or restart your shell"
fi

if [ -z $(which yarn) ]; then
	echo "No Yarn version found"

	npm install -g yarn
fi
