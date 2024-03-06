## Setting multiple variables while running 'make':
  `make VARIABLE1=value1 VARIABLE2=value2 ... all`

## Print the arguments passed to a make:
```debug:
    @echo "Arguments passed to make: $(MAKECMDGOALS)"```

## Print all inputs, including targets, variables, and flags:
```debug:
    @echo "Targets: $(MAKECMDGOALS)"
    @echo "Variables:"
    @$(foreach v, $(.VARIABLES), \
        $(if $(filter-out environment% default% automatic%, $v), \
            $(info $v = $($v))))
    @echo "Flags: $(MAKEFLAGS)"```
