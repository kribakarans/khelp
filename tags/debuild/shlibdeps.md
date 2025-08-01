shlibdeps: Shared library dependencies

List_deps:
    objdump -p ./app.out | grep NEEDED
    dpkg-shlibdeps -O ./app.out (it requires debian/control)

Create_deps_file: Create debian/substvars deps file:
    dpkg-shlibdeps -e ./app.out (it requires debian/control)
