# Clear line in Bash:
```
clear_line() {
    printf "\r\033[K"
}

text="Hello, World!" # Text to be printed
clear_line           # Clear the line and print the text
printf "%s" "$text"
```

In this script:
- '`\r'` moves the cursor to the beginning of the line.
- '`\033[K`' is an ANSI escape code that clears the line from the current cursor position to the end of the line.
- The `clear_line` function combines these escape codes to clear the line.
