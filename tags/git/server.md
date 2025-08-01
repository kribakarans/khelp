# Setup private Git server:

## At Server End:
1. Create Git user
   `sudo adduser git`

2. Generate SSH folder
   `mkdir .ssh && chmod 700 .ssh`
   `touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys`

3. Add client public SSH keys to .ssh/authorized_keys

# Push existing project to the git-server
## At Server End:
1. Create bare git repo to push
   `git init --bare project.git`

## In Client end:
1. Add remote origin to the git-repo to push
   `git remote add origin git@localhost:/home/git/project.git`

2. Set default upstream branch
   `git branch --set-upstream-to=origin/master master`

3. Push the local commits to origin
   `git push` (or) `git push -u origin master`

# Clone existing remote repo from the git-server
   `git clone git@localhost:/home/git/project.git`
