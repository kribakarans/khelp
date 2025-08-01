# Lookup symbols in an ELF file:

## Using `readelf`:

  `readelf -s <your-elf-file>`

  `readelf -s <your-executable> | grep 'my_fun'`

## Using 'nm':

  `nm <your-executable> | grep 'my_fun'`

## Using `objdump`:

  `objdump -t <your-executable> | grep 'my_fun'`

