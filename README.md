# node-consistency-poc

Testbench for automatically configuring a Node environment on clone/pull/update/whatever.

This example has two branches as an example:

- `master`, has a dependency on Express 4 (`yarn list express` shows 4.x)
- `express-3`, has a dependency on Express 3

Doing `git checkout <branch>` should set the correct Express version automatically.

## What assumptions are we making about the environment?

- It has `nvm` installed
- It has Bash somewhere
- `yarn` is installed globally with `npm install -g yarn`

## On Yarn install it needs to:

- Check for the correct Node version (major and minor, no patch)
	- If not installed: `nvm install <version>` and `nvm alias default <version>`
- Check that Yarn is installed
	- If not installed: `npm install -g yarn`

The user needs to run `yarn install` (or just `yarn`, or `npm install`) which should have a pre-install hook to install the Git hooks into `.git/hooks`

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

## Adding a Git hook

- It should be added into `githooks/`
- It should have the correct name for the Git hook you're targeting. Grep through [the Git hooks docs](https://git-scm.com/book/gr/v2/Customizing-Git-Git-Hooks) for the options.
- It should be executable (`chmod +x githooks/*`)
