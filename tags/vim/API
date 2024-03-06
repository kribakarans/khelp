Vim functions:

Debug message:
echo "The value of myvar is: " . myvar
echom "The value of myvar is: " . myvar

Time format:
strftime("%Y-%m-%d %H:%M:%S")

Assign variable:
let l:backup_root = $HOME . '/.vim/backup' (or)
let l:backup_root = expand("~/.vim/backup")

Check directory:
  if !isdirectory('.git')
    silent! !git init > /dev/null
  endif

Run system command:
execute 'silent! !mkdir -p ' . backup_path

Call the GitBackup function on save:
autocmd BufWritePost * call GitBackup()

