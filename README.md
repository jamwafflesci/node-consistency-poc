# node-consistency-poc

Testbench for automatically configuring a Node environment on clone/pull/update/whatever.

[Spec here](https://docs.google.com/document/d/1LAhKlTEY4pT_OyHIJWOpMV5LXL8GwZeHBv5PlaHlNHs/)

## Demo

This example has two branches as an example:

- `master`, has a dependency on Express 4 (`yarn list express` shows 4.x)
- `express-3`, has a dependency on Express 3

Doing `git checkout <branch>` should set the correct Express version automatically. You can see this with `yarn list express`.

## What assumptions are we making about the environment?

- It has `nvm` installed
- It has Bash somewhere

## Yarn

Yarn is used because it's faster than NPM, whilst also being compatible. There is a `yarn.lock` file that should be tracked in the repository that will ensure Node package and package dependency version consistency between developer machines, as well as Docker images and production boxes.

The `check-node-env.sh` script will install the latest Yarn globally if it's not already present.

## Bootstrapping

The bootstrap script is `./install-git-hooks.sh`. It is run as a `postinstall` script when `yarn install` is ran. Seeing as `yarn install` must be run for the project to be used anyway, it's practically guaranteed that `install-git-hooks.sh` is run before anything else.

## Git hooks

The `post-merge` script runs on pull
The `post-checkout` script when the user changes a branch

## Adding a Git hook

- It should be added into `githooks/`
- It should have the correct name for the Git hook you're targeting. Grep through [the Git hooks docs](https://git-scm.com/book/gr/v2/Customizing-Git-Git-Hooks) for the options.
- It should be executable (`chmod +x githooks/*`)
