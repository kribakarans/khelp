# Loop through all .jpg and .jpeg files in the current directory
```
shopt -s nullglob  # Prevent errors if no matching files are found
for img in *.jpg *.jpeg; do
    process_image "$img"
done
```
