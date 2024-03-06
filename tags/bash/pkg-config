# Package Config:

## List all available packages registered with pkg-config:
  `pkg-config --list-all`

## Retrive pkg-config information of a library:
  `pkg-config --cflags --libs <package-name>`

## Retrive static pkg-config information of a library:
  `pkg-config --static --libs <package-name>`

# Work samples with Curl package:

## Print CFLAGS:
  `pkg-config --cflags libcurl`
  Output:
  `-I/usr/include/x86_64-linux-gnu`

## Print CFLAGS and LDFLAGS:
  `pkg-config --cflags --libs libcurl`
  Output:
  `-I/usr/include/x86_64-linux-gnu -lcurl`

## Print CFLAGS and LDFLAGS for Static linking:
  `pkg-config --cflags --libs --static libcurl`
  Output:
  `-I/usr/include/x86_64-linux-gnu -L/usr/lib/x86_64-linux-gnu/mit-krb5 -lcurl -lnghttp2 -lidn2 -lrtmp -lssh -lpsl -lssl -lcrypto -lssl -lcrypto -Wl,-Bsymbolic-functions -Wl,-z,relro -lgssapi_krb5 -lkrb5 -lk5crypto -lcom_err -llber -lldap -llber -lbrotlidec -lz`

## PKG_CONFIG_PATH:
Set the PKG_CONFIG_PATH environment variable to include the directory where the .pc files for the library are located.

`export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/path/to/libexample/pkgconfig`

## How to use in Makefile:
```  CFLAGS  += $(shell pkg-config --cflags libexample)
  LDFLAGS += $(shell pkg-config --libs   libexample)
```
