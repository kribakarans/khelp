# Git Branch Usage:

## List Local Branches:
    `git branch`

## List Remote Branches:
    `git branch -r`

## List All Branches (Local and Remote)
    `git branch -a`

## Create a New Branch:
   `git branch <branch_name>`

## Switch to a Branch:
    `git checkout <branch_name>`
      (or)
    `git switch <branch_name>`

## Create and Switch to a New Branch:
    `git checkout -b <branch_name>`
      (or)
    `git switch -c <branch_name>`

## Rename a Branch:
    `git branch -m <new_branch_name>`

## Delete a Branch:
    `git branch -d <branch_name>`

## Force Delete a Branch:
If the branch has unmerged changes, Git will prevent the deletion.
To force deletion, you can use -D:
    `git branch -D <branch_name>`
