# Bash Output Redirection

## Redirect @echo output to stdout

  `echo "Helloworld!"`

## Redirect @echo output to stderr

  `echo "Helloworld!" > &2`

## Redirect @echo output to file

  `echo "Helloworld!" > <file-name>`

## Redirect @echo output to sudoer's file

  `echo "Helloworld" | sudo tee <sudoer-file>`

## Redirect @echo output to sudoer's file with new shell

  `sudo sh -c 'echo "Helloworld!" > <sudoer-file>'`

## Redirect command output (stdout and stderr) to stdout

  `$ bash-command 2>&1`
  `$ bash-command &> /dev/stdout`

## Redirect command output (stdout and stderr) to stderr

  `$ bash-command 1>&2`

## Redirect both stdin and stderr streams to the /dev/null

  `$ bash-command &> /dev/null`
  `$ bash-command > /dev/null 2>&1`

## To redirect both `stderr` to a file and display it on the console as `stdout`

  `$ bash-command 2> >(tee build-err.log >&2) | tee build.log`
