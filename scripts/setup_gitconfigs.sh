#!/usr/bin/env bash

# Automatically sets up a remote tracking branch when pushing a new branch.
git config --global push.autosetupremote true

# Sets the default branch name to `main` for new repositories.
git config --global init.defaultBranch main

# Configures `git pull` to rebase instead of merge by default.
git config --global pull.rebase true

# Sets the conflict style to `diff3` for merge conflicts.
git config --global merge.conflictstyle diff3

# Enables the "reuse recorded resolution" feature for merges.
git config --global rerere.enabled true

# Enables automatic command correction with a delay of 1.0 seconds.
git config --global help.autocorrect 10

# Sets the diff algorithm to `histogram`.
git config --global diff.algorithm histogram

# Specifies a global `.gitignore` file.
git config --global core.excludesfile ~/.gitignore

# Enables integrity checking of objects on transfer.
git config --global transfer.fsckobjects true

# Ensures objects fetched from a remote repository are checked for integrity.
git config --global fetch.fsckobjects true

# Ensures objects received by push operations are checked for integrity.
git config --global receive.fsckobjects true

# Overwrite https with git for all github.com urls
git config --global url."git@github.com:".insteadOf "https://github.com/"
