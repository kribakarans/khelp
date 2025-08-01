# Manage Bash Command History:

## HISTCONTROL:
The `HISTCONTROL` variable in bash allows for efficient storage of command history.
It can be set to different options to control how commands are saved in the history list.

Here are some key options:
  `ignoredups`  : This option prevents the storage of commands that are the same as the immediate previous command
  `ignorespace` : Commands that begin with a white space character are not included in the history list
  `ignoreboth`  : This option combines ignorespace and ignoredups, ensuring that commands with leading white space characters and duplicates are not stored in the history
  `erasedups`   : With this option, all previous lines matching the current line are removed from the history list before saving it, preventing duplicates

By setting HISTCONTROL to one of these options in your ~/.bashrc file, you can control which commands are saved in your bash history efficiently.

**Example: ~/.bashrc**
```export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth:erasedups```
