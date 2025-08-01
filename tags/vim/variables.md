# Vim Variable Scopes

Vim has a well-defined scoping system that helps control **where** and **how long** variables exist.

Here's a breakdown of all scopes, with examples and when to use them.

## 🔹 1. `g:` → Global Scope

- Exists everywhere, across all files, windows, and buffers.
- Used for options, flags, plugin settings.

### Example:

```vim
let g:enable_logging = 1

if g:enable_logging
  echom "Logging is enabled globally"
endif
```

## 🔹 2. `b:` → Buffer-local Scope

- Tied to the current file/buffer.
- Each buffer (open file) has its own copy.

### Example:

```vim
let b:indent_size = 4
echo "This buffer's indent size is " . b:indent_size
```

## 🔹 3. `w:` → Window-local Scope

- Tied to the current Vim window (not the buffer).

### Example:

```vim
let w:my_win_color = "blue"
echo "Window color = " . w:my_win_color
```

## 🔹 4. `t:` → Tab-local Scope

- Scoped per tab (`:tabnew`, `:tabnext`).

### Example:

```vim
let t:current_mode = "debug"
echo "Tab mode = " . t:current_mode
```

## 🔹 5. `s:` → Script-local Scope

- Only visible inside the same `.vim` script file.

### Example (in `plugin/foo.vim`):

```vim
let s:count = 0

function! s:IncrementCount()
  let s:count += 1
  echom "Count = " . s:count
endfunction
```

## 🔹 6. `l:` → Function-local Scope

- Declared and used only inside functions.

### Example:

```vim
function! SayHello()
  let l:name = "Hello"
  echom "Hello, " . l:name
endfunction
```

## 🔹 7. `a:` → Function Argument Scope

- Refers to arguments passed to user-defined functions.

### Example:

```vim
function! Greet(a:name)
  echom "Welcome " . a:name
endfunction

call Greet("Hello")
```

## 🔹 8. No Prefix

- Avoid using unscoped variables.
- Vim searches in this order: `l:` → `a:` → `s:` → `b:` → `w:` → `t:` → `g:`.

### Example:

```vim
let count = 0  " Ambiguous! Avoid this.
```

## 📚 Summary Table

| Prefix | Scope          | Lifespan          | Example use                  |
|--------|----------------|-------------------|------------------------------|
| `g:`   | Global         | Forever           | Plugin options, toggles      |
| `b:`   | Buffer         | Per file/buffer   | File-specific config         |
| `w:`   | Window         | Per split         | Layout/window state          |
| `t:`   | Tab            | Per tab           | Tab-based configuration      |
| `s:`   | Script-local   | Per Vim script    | Plugin internals             |
| `l:`   | Function-local | Inside function   | Temporary local values       |
| `a:`   | Argument       | Inside function   | Passed parameters            |

## 🛠 Practical Use

```vim
let g:enable_log = 1
let b:indent_size = 4
let w:current_mode = "debug"

function! ShowState()
  if g:enable_log
    echom "Indent: " . b:indent_size . ", Mode: " . w:current_mode
  endif
endfunction
```
---
