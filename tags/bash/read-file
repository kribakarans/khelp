# Read file in bash:
```
while IFS= read -r line; do
    echo "Line: $line"
done < input.txt
```
IFS=: This sets the Internal Field Separator (IFS) to an empty string.
IFS is a special variable in Bash that determines how the shell recognizes word boundaries.
By setting it to an empty string, you ensure that leading and trailing whitespaces are preserved in the read input.

## Convert the output to a bash array, and then iterate through each elements:
```  # Run pip list and store the output in a variable
  pip_list_output=$(pip list)

  # Convert the output to a bash array
  IFS=$'\n' read -r -a pip_list_array <<< "$pip_list_output"

  # Iterate through each element in the array using a for loop
  for package_info in "${pip_list_array[@]}"; do
      # Print each package information
      echo "$package_info"
  done
```

## Read the file from bottom to top:
```while IFS= read -r LINE; do
    ...
    ...
    ...
done < <(tac "<file-name>")
```
