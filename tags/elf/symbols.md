# Explore ELF symbols

## With 'readelf' command:

    `readelf -s <executable> | grep 'my_fun'`

## With 'nm' command:

    `nm <executable> | grep 'my_fun'`

## With 'objdump' command:

    `objdump -t <executable> | grep 'my_fun'`
