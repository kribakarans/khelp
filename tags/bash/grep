# Grep usage:

## Grep for a string only in regular files:
`grep -r "STRING" . | while IFS=: read -r file _; do file "$file" | grep -q "text" && echo "$file"; done`
