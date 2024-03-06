# Vim color configurations:

## Set highlight search color:
`  #!~/.vimrc
  " Set foreground color to black and background color to light yellow
  highlight Normal ctermfg=black ctermbg=yellow`

## Run below command to view supported colors:
  `:h highlight-args
  :h cterm-colors
  :so $VIMRUNTIME/syntax/colortest.vim`

## Commonly supported color values for ctermbg:
  0  - black
  1  - darkred
  2  - darkgreen
  3  - darkyellow/brown
  4  - darkblue
  5  - darkmagenta
  6  - darkcyan
  7  - lightgray/darkwhite
  8  - darkgray
  9  - red
  10 - green
  11 - yellow
  12 - blue
  13 - magenta
  14 - cyan
  15 - white

## Vim Diff Colors:
cterm      - sets the style
ctermfg    - set the text color
ctermbg    - set the highlighting
DiffAdd    - line was added
DiffDelete - line was removed
DiffChange - part of the line was changed (highlights the whole line)
DiffText   - the exact part of the line that changed

**Example:**
```highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red```

## Vim script to load vimdiff color scheme:
**vimrc:**
```if &diff
    colorscheme <color-scheme>
endif
```
