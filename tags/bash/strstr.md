## strstr() implemenation in Bash
```
string="Hello World"
substring="lo"

if [[ $string == *$substring* ]]; then
    echo "Substring found in the string"
else
    echo "Substring not found in the string"
fi
```
