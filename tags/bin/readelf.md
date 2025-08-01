# ELF Symbol Lookup

## Using `readelf`

```sh
readelf -s <your-elf-file>
readelf -s <your-executable> | grep 'my_fun'
```

## Using `nm`

```sh
nm <your-executable> | grep 'my_fun'
```

## Using `objdump`

```sh
objdump -t <your-executable> | grep 'my_fun'
```

