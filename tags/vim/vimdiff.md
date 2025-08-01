# Vimdiff Commands:

## Opening files for comparison:
  `vimdiff file1 file2 file3`

## Navigating between windows:
  `Ctrl + W + W`           : Switch between the split windows
  `Ctrl + W + <Arrow Key>` : Move to the split window in the indicated direction

## Saving and Quitting:
  `:wqa` or `:wqall` : Save changes and quit all windows
  `:qa!` or `:qall!` : Quit all windows without saving changes

## Enable Diff manually:
  `:windo diffthis` : Enable vimdiff
  `:diffthis` : Run on both windows enables the vimdiff
  `:diffoff`  : Turn off the diff

# Toggle Vim Folds:
  `zo` and `zc`  : Open and close folds, respectively

## Export Diff to the HTML Web Page
  `:TOhtml | w ~/Desktop/diff.html`

## Resolving conflicts:
  `]c` and `[c`       : Navigate to the next and previous differences
  `do` (diff obtain ) : Get changes from the other window into the current window
  `dp` (diff put)     : Put changes from the current window into the other window

## Viewing and navigating differences:
  `:diffupdate` or `:diffu`   : Update the diff highlighting
  `:diffget` and `:diffput`   : Similar to do and dp, but for the whole file
  `:diffg RE` and `:diffp RE` : Get or put changes from/to the RE (ours, theirs, base) window

## Resolve Git merge conflicts with vim:
  `]c` and `[c` : Navigate to the next and previous conflicts
  `:diffget LO` : Get the changes from the local version
  `:diffget RE` : Get the changes from remote version
  `:diffget BA` : Get the changes from the base version
  `:cquit`      : To abort merging
