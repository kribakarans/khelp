# Assign conditional values in bash:

## Usage:
Check if PREFIX is set, if not, set it to /usr/local.
    `PREFIX=${PREFIX:=/usr/local}`

In Bash, `:-` and `:=` are two different operators used in variable expansion and assignment.

## Operator ':-':
  **Syntax:** ${variable:-default}.

  - The ':-' operator is used for default value assignment.
    It assigns a default value to a variable if the variable is unset or null.
  - If variable is unset or null, it will be assigned the value of default.

  **Example:**
    `echo ${FOO:-default_value} #If FOO is unset or null, set it to "default_value"`

## Operator ':=':
   **Syntax:** ${variable:=value}.

    - The := operator is used for assigning a value to a variable only if the variable is unset (not if it's null).
    - If variable is unset, it will be assigned the value of value.

  **Example:**
    `echo ${BAR:=new_value} # If BAR is unset, set it to "new_value"`

## In summary:
  - `${variable:-default}` assigns a default value if the variable is unset or null.
  - `${variable:=value}` assigns a value only if the variable is unset.
