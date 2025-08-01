# C tags in Vim

## Ctags

### 1. Jump to Definition

```
    Ctrl-]
```

### 2. Return Back

```
    Ctrl-T
```

### 3. List Matching Tags

```
    :ts   " (stands for tag-select)
```

- Lists all matching tags if multiple definitions exist.
- Then press the number and hit Enter to jump.

### 4. Tag Stack Navigation

Vim maintains a tag stack:

```
    :tags → shows the tag stack
    :pop or Ctrl-T → go back
    :tag or Ctrl-] → go forward
```

You can also do:

```
    :pop 2    " Go back 2 tags
    :tag 3    " Go forward to the 3rd tag in the stack
```

### 5. Manually Search Tags

```
    :tag TAGNAME
```

### 6. Autocompletion with Tags

```
    <C-x><C-]>   " Ctrl-X Ctrl-] in insert mode
```

### 7. Use :tselect to pick from multiple matches

```
    :tselect TAGNAME
```

- Shows a list of locations (like function overloads).
- Pick the one you want.

### 8. Use :tjump to jump to a specific match

Like :tselect, but jumps to first if only one match

```
    :tjump TAGNAME
```

### 9. Browse All Tags

You can open the tags file or use:

To open the tag in a split window.

```
    :stag some_tag
```

### 10. Explore with Tagbar Plugin

## Auto-Generate Ctags on Save

Keeps tags up to date automatically.

Add to .vimrc (optional):

```
    autocmd BufWritePost *.c,*.h silent! !ctags -R .
```

### Search manually for usages

- Press / (search)
    - n — next occurrence
    - N — previous occurrence

## Using VimGrep

### Use vimgrep to get all global references

This gives you a list of all matches in your project:

```
    :vimgrep /TAGNAME/ **/*.c **/*.h
    :copen # To open the quickfix window
```

Then use:

```
    :cnext / :cprev to jump through results
    :cclose to close it
```

### Use vimgrep to get all local references

This gives you a list of all matches in your project:

```
    :lvimgrep /TAGNAME/ **/*.c **/*.h
    :copen
```

Now, use:

```
    :lnext  — go to next match in location list
    :lprev  — go to previous match
    :lclose — close it
```

### Summary

| Feature       | Quickfix List (:c*)     | Location List (:l*)
|---------------|-------------------------|--------------------
| Scope         | Global (all windows)    | Local (current window only)
| Command       | `:cnext`, `:cprev`, etc | `:lnext`, `:lprev`, etc
| Open list     | `:copen`                | `:lopen`
| Populate with | `:vimgrep`, `:grep`     | `:lvimgrep`, `:lgrep`
