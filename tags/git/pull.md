# Git Pull Usage:

Fetch and integrate changes from a remote repository into your current branch.

## Basic pull:
  `git pull`

## Pull from a specific remote and branch:
  `git pull <remote> <branch>`

## Rebase instead of merge:
Fetches the remote content but does not create a new merge commit.
This simply moves your local changes onto the top of what everybody else has already contributed.

  `git pull --rebase`
  `git pull --rebase origin`

## Pull with rebase from a specific remote and branch:
  `git pull --rebase <remote> <branch>`

## Pull forcefully:
  `git pull --force`

## Pull and prune remote-tracking branches:
  `git pull --prune`

## Pull without merging or rebasing:
  `git pull --ff-only`

## Verbose output:
  `git pull --verbose`

## Dry run:
  `git pull --dry-run`

## Revert Pull Changes:
  `git reset --hard <commit-before-pull>`
