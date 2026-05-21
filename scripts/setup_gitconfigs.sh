#!/usr/bin/env bash

# =============================================================================
# CORE REPOSITORY SETTINGS
# =============================================================================

# Sets the default branch name to `main` for new repositories.
echo "🌟 Setting default branch to 'main' for new repositories"
git config --global init.defaultBranch main

# Specifies a global `.gitignore` file.
echo "🚫 Setting global .gitignore file location"
git config --global core.excludesfile ~/.gitignore

# =============================================================================
# PUSH/PULL/MERGE BEHAVIOR
# =============================================================================

# Automatically sets up a remote tracking branch when pushing a new branch.
echo "📤 Enabling automatic remote tracking branch setup"
git config --global push.autosetupremote true

# Use simple push strategy (only push current branch to its upstream)
echo "🎯 Setting push strategy to 'simple' for safer pushes"
git config --global push.default simple

# Automatically push tags along with commits
echo "🏷️  Enabling automatic tag pushing with commits"
git config --global push.followTags true

# Configures `git pull` to rebase instead of merge by default.
echo "🔄 Setting git pull to rebase by default"
git config --global pull.rebase true

# Sets the conflict style to `diff3` for merge conflicts.
echo "⚔️  Setting merge conflict style to diff3"
git config --global merge.conflictstyle diff3

# Enables the "reuse recorded resolution" feature for merges.
echo "🧠 Enabling reuse recorded resolution (rerere)"
git config --global rerere.enabled true

# Automatically stage rerere resolutions
echo "⚡ Enabling automatic rerere staging"
git config --global rerere.autoupdate true

# Automatically force-update ref branches
echo "🔗 Enabling automatic ref branch updates during rebase"
git config --global --add --bool rebase.updateRefs true

# Auto-stash before rebasing
echo "💾 Enabling automatic stash before rebase"
git config --global rebase.autoStash true

# Enable autosquash for interactive rebases
echo "🔧 Enabling autosquash for interactive rebases"
git config --global rebase.autoSquash true

# Remove .orig backup files after merge conflicts
echo "🗑️  Disabling backup files during merge conflicts"
git config --global merge.keepBackup false

# =============================================================================
# BRANCH AND TAG MANAGEMENT
# =============================================================================

# Sort branches by most recent commit date
echo "📅 Setting branch sort to most recent commit date"
git config --global branch.sort -committerdate

# Sort tags by version (semantic versioning)
echo "🏷️  Setting tag sort to version format"
git config --global tag.sort version:refname

# Automatically prune deleted remote branches during fetch
echo "🧹 Enabling automatic cleanup of deleted remote branches"
git config --global fetch.prune true

# Automatically prune deleted remote tags during fetch
echo "🏷️  Enabling automatic cleanup of deleted remote tags"
git config --global fetch.pruneTags true

# =============================================================================
# DIFF AND DISPLAY SETTINGS
# =============================================================================

# Sets the diff algorithm to `histogram`.
echo "📊 Setting diff algorithm to histogram"
git config --global diff.algorithm histogram

# Highlight moved code differently in diffs
echo "🎨 Enabling moved code highlighting in diffs"
git config --global diff.colorMoved plain

# Use meaningful prefixes in diff output
echo "📝 Enabling meaningful diff prefixes"
git config --global diff.mnemonicPrefix true

# Better rename detection in diffs
echo "🔄 Enabling improved rename detection"
git config --global diff.renames true

# Follow file renames in git log
echo "👁️  Enabling file rename following in log"
git config --global log.follow true

# Show decorations (branch/tag names) in log by default
echo "🎭 Enabling decorations in git log"
git config --global log.decorate short

# Format output in columns when possible
echo "📋 Enabling columnar output formatting"
git config --global column.ui auto

# Enables automatic command correction with a delay of 1.0 seconds.
echo "🔧 Enabling automatic command correction (1.0s delay)"
git config --global help.autocorrect 10

# =============================================================================
# PERFORMANCE OPTIMIZATIONS
# =============================================================================

# Enable filesystem monitoring for faster git operations
echo "⚡ Enabling filesystem monitoring for performance"
git config --global core.fsmonitor true

# Cache untracked files for faster status operations
echo "💨 Enabling untracked file caching for performance"
git config --global core.untrackedCache true

# =============================================================================
# COMMIT AND EDITING IMPROVEMENTS
# =============================================================================

# Show diff in commit message editor for better context
echo "📝 Enabling verbose commit messages (shows diff)"
git config --global commit.verbose true

# Ensure consistent line endings across platforms
echo "🔄 Setting consistent line ending handling"
git config --global core.autocrlf false

# Use ISO date format in logs (more readable)
echo "📅 Setting ISO date format for logs"
git config --global log.date iso

# =============================================================================
# URL SHORTCUTS FOR COMMON GIT HOSTS
# =============================================================================

# Use SSH instead of HTTPS for GitHub (avoids password prompts)
echo "🔑 Setting up SSH shortcuts for GitHub"
git config --global url."git@github.com:".insteadOf "https://github.com/"

# Optional: Add shortcuts for common Git operations
echo "⚡ Setting up Git URL shortcuts"
git config --global url."git@github.com:".insteadOf "gh:"
git config --global url."git@gitlab.com:".insteadOf "gl:"

# =============================================================================
# SECURITY AND INTEGRITY
# =============================================================================

# Enables integrity checking of objects on transfer.
echo "🔒 Enabling integrity checking on object transfers"
git config --global transfer.fsckobjects true

# Ensures objects fetched from a remote repository are checked for integrity.
echo "🔍 Enabling integrity checking on fetch operations"
git config --global fetch.fsckobjects true

# Ensures objects received by push operations are checked for integrity.
echo "🛡️  Enabling integrity checking on receive operations"
git config --global receive.fsckobjects true

# Enable GPG signing for commits if a signing key is configured
if git config --global user.signingkey > /dev/null 2>&1; then
    signingkey=$(git config --global user.signingkey)
    git config --global commit.gpgsign true
    echo "✓ GPG auto-signing enabled for commits (Key: $signingkey)"
else
    echo "✗ GPG auto-signing not enabled (no signing key configured)"
fi

# =============================================================================
# GIT LFS SETTINGS
# =============================================================================

# Disable lock validation
echo "🔓 Disabling LFS lock validation"
git config --global lfs.locksverify false

# =============================================================================
# CUSTOM ALIASES
# =============================================================================

# Essential shorthand aliases (very common)
echo "⚡ Adding common shorthand aliases"
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit

# Utility aliases
echo "📋 Adding utility aliases"
git config --global alias.alias '!git config --get-regexp ^alias\. | sed "s/^alias\.//" | sort'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.root 'rev-parse --show-toplevel'

# Branch and tag listing aliases
echo "📂 Adding listing aliases"
git config --global alias.branches 'branch --all'
git config --global alias.tags 'tag --list'
git config --global alias.remotes 'remote --verbose'

# Enhanced log aliases
echo "📊 Adding enhanced log aliases"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lga "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"

# Safe force push
echo "🛡️  Adding safe force push alias"
git config --global alias.pushf 'push --force-with-lease --force-if-includes'

# Quick amend without editing message
echo "🔧 Adding quick amend alias"
git config --global alias.oops 'commit --amend --no-edit'

# Workflow aliases (your existing ones)
echo "🔄 Adding workflow aliases"
git config --global alias.acp '!f() { git add . && git commit -m "$1" && git pull ; git push; }; f'
git config --global alias.acps '!f() { git add . && git commit --no-verify -m "$1" && git pull ; git push --no-verify; }; f'
git config --global alias.staging '!f() { git pull; git push ; git checkout staging && git pull;}; f'
git config --global alias.develop '!f() { git pull; git push ; git checkout develop && git pull;}; f'
git config --global alias.master '!f() { git pull; git push ; git checkout master && git pull;}; f'
git config --global alias.b '!f() { git add . && git checkout -b "$1"; }; f'

# Advanced aliases
echo "🚀 Adding advanced aliases"
git config --global alias.cleanup '!git branch --merged | grep -E -v "(^\*|main|master|staging)" | xargs -n 1 git branch -d'
git config --global alias.contributors 'shortlog --summary --numbered'
git config --global alias.find '!git log --pretty="format:%Cgreen%H %Cblue%s" --name-status --grep'
