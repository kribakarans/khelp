There are several special characters and notations that can be used in Makefiles:

    @ - Suppresses the command from being printed to the terminal. For example:
        sanity:
            @echo "Running sanity checks"
            -shellcheck -x $(SRCDIR)/kdeploy.sh
            -shellcheck -x $(SRCSCRIPTS)/utils.sh
        In this example, the echo command will be printed to the terminal, but the shellcheck commands will be executed silently.

    $@ - Represents the name of the current target being executed. For example:
        install:
            mkdir -p $(PREFIX)/bin
            cp myprogram $(PREFIX)/bin/$@
        In this example, the myprogram binary will be installed to the $(PREFIX)/bin/install directory.

    $< - Represents the first dependency of the current target being executed. For example:
        build: main.c foo.c bar.c
            gcc -o $@ $<
        In this example, the gcc command will compile main.c and produce an output binary called build.

    $^ - Represents all the dependencies of the current target being executed. For example:
        build: main.c foo.c bar.c
            gcc -o $@ $^
        In this example, the gcc command will compile all three source files and produce an output binary called build.

    $(...) - Represents the value of a variable or the result of a command. For example:
        VERSION := $(shell cat VERSION)
        In this example, the VERSION variable will be set to the contents of the VERSION file.
