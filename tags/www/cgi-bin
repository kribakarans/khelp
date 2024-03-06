# Setup HTTP CGI environment in Ubuntu 20:

1. Install Apache webserver
   `$ sudo apt install apache2`

2. Enable CGI module and restart the webserver
   `$ sudo a2enmod cgi`
   `$ sudo service apache2 restart (or) systemctl restart apache2`

3. By default, apache2 server run CGI scripts in the path `/usr/lib/cgi-bin/` (or) `/var/www/cgi-bin`
   Refer the config file `'/etc/apache2/conf-available/serve-cgi-bin.conf'`:
     ```<IfModule mod_alias.c>
         <IfModule mod_cgi.c>
             Define ENABLE_USR_LIB_CGI_BIN
         </IfModule>

         <IfModule mod_cgid.c>
             Define ENABLE_USR_LIB_CGI_BIN
         </IfModule>

         <IfDefine ENABLE_USR_LIB_CGI_BIN>
             ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
             <Directory "/usr/lib/cgi-bin">
                 AllowOverride None
                 Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
                 Require all granted
             </Directory>
         </IfDefine>
     </IfModule>```

## Helloworld in CGI programming:
1. Paste the below snippet to hello.cgi file at `'/usr/lib/cgi-bin'`.
     **hello.cgi:**
     ```#!/bin/bash
     echo "Content-type: text/html"
     echo ""
     echo "<html>"
     echo "<head>"
     echo "<title>Hello, World! CGI</title>"
     echo "</head>"
     echo "<body>"
     echo "<h1>Hello, World!</h1>"
     echo "<h1>Running CGI script in '$PWD'.</h1>"
     echo "</body>"
     echo "</html>"```

2. Access the site via `'http://localhost/cgi-bin/hello.cgi'`.

## Customizing the `'cgi-bin'` path:
1. Create your own directory that act as `'cgi-bin'` root.
   `$ mkdir /usr/lib/kdev`

2. Put your CGI files at `'/usr/lib/kdev'`.

3. Added your CGI configs to `'apache2.conf'` file.
     **kdev.cgi:**
     ```ScriptAlias /kdev/ "/usr/lib/kdev/hello.cgi/"
     RedirectMatch ^/kdev$ /kdev/
     #Alias /kdev-css "/usr/share/kdev/"
     <Directory "/usr/lib/kdev/">
         AllowOverride None
         Options ExecCGI FollowSymlinks
         Require all granted
     </Directory>```

   **Follow the below steps for seperate config file:**
   1. Place the config file at `'/etc/apache2/conf-available'` directory.
   1. Create a soft link to enable the config.
        ```$ cd /etc/apache2/conf-enabled
        $ ln -sf ../conf-available/kdev.conf ./kdev.conf```

4. Optionally verify Configuration Changes.
   `$ apachectl configtest`

5. Optionally review the Apache module status.
   `$ apachectl -M`

6. Restart the apache2 server.
   `$ sudo systemctl restart apache2`

## Let's break down the configuration:
1. `ScriptAlias /kdev/ "/usr/lib/kdev/kdev.cgi/"`:
   This line establishes a mapping between the URL path `"/kdev/"` and the physical location of the Kdev CGI script (`"/usr/lib/kdev/kdev.cgi/"`).
   It means that when you access URLs starting with `"/kdev/"`, the server will execute the Kdev CGI script.

2. `RedirectMatch ^/kdev$ /kdev/`:
   This line is a redirection rule that ensures that if someone accesses `"/kdev"` (without a trailing slash),
   they will be redirected to "/kdev/" (with a trailing slash). This helps maintain consistency in URL handling.

3. `Alias /kdev-css "/usr/share/kdev/"`:
   This line creates an alias for the `"/kdev-css"` URL path, mapping it to the physical directory `"/usr/share/kdev/"`.
   This is often used to serve static CSS files or other assets.

4. `<Directory "/usr/lib/kdev/">`:
   This block of directives applies specifically to the directory `"/usr/lib/kdev/"`.
     a. `AllowOverride None`             : Disables the use of .htaccess files for overrides in this directory.
     b. `Options ExecCGI FollowSymlinks` : Configures the options for this directory. It allows the execution of CGI scripts and following of symbolic links.
     c. `Require all granted`            : Specifies that access to this directory is granted to all users.

In summary, this configuration sets up the Kdev CGI script to be executed when accessing URLs under `"/kdev/"` and
establishes some additional rules for URL handling and serving static assets. It also defines the permissions and
options for the `"/usr/lib/kdev/"` directory. The actual Kdev web interface should be accessible at a URL like:

  http://localhost/kdev/

