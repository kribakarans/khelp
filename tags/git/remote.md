# Git Remote Handling:

## Check Existing Remotes:
  `git remote -v`

## Add a New Remote:
  `git remote add origin git@localhost:/home/git/reponame.git`
  `git remote add origin git@github.com:username/reponame.git`

## Update Remote URLs (Optional):
  `git remote set-url origin https://new-url.git`

## Remove Git Remote
  `git remote remove origin`

## Muliple Remotes
```
  $ git remote -v
  gitlab  git@gitlab.com:username/reponame.git (push)  << Remote-1
  origin  git@github.com:username/reponame.git (push)  << Remote-2
```

Push Changes to Gitlab Remote;

  `git push gitlab`

or

  `git push gitlab master`
