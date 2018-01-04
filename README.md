# node-consistency-poc
Testbench for automatically configuring a Node environment on clone/pull/update/whatever

## What assumptions are we making about the environment?

- It has `nvm` installed

## On clone it needs to:

- Check for the correct Node version (major and minor, no patch)
	- If not installed: `nvm install <version>` and `nvm alias default <version>`
- Check that Yarn is installed
	- If not installed: `npm install -g yarn`

The user needs to run `yarn install` (or just `yarn`) which should have a post-install hook to install the Git hooks into `.git/hooks`

## On pull it needs to:

- Check for the correct Node version (major and minor, no patch)
	- If not installed: `nvm install <version>` and `nvm alias default <version>`
- Check that Yarn is installed
	- If not installed: `npm install -g yarn`
- Run `yarn install` (or just `yarn`) to install/update node_modules

## Yarn

Yarn is used because it's faster than NPM, whilst also being compatible. There is a `yarn.lock` file that should be tracked in the repository that will ensure Node package and package dependency version consistency between developer machines, as well as Docker images and production boxes.

## Bootstrapping

The bootstrap script is `./install-git-hooks.sh`. It is run as a `postinstall` script when `yarn install` is ran. Seeing as `yarn install` must be run for the project to be used anyway, it's practically guaranteed that `install-git-hooks.sh` is run before anything else.

## Git hooks

The `post-merge` script runs on pull
The `post-checkout` script when the user changes a branch
