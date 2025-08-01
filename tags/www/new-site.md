# Setup new virtual host in Apache2

## 1. Create site file at /usr/local/test

    index.html

## 2. Add site configs at /etc/apache2/sites-available/test.conf

```
    <VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /usr/local/test
        ServerName localhost
        Alias /test /usr/local/test

        <Directory /usr/local/test>
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/test_error.log
        CustomLog ${APACHE_LOG_DIR}/test_access.log combined
    </VirtualHost>
```

## 3. Enable site test.conf

    sudo a2ensite test.conf

## 4. Access the new test site

    http://localhost/test/


# For new CGI site

```
    <VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        # Alias for your CGI application
        ScriptAlias /test /usr/local/test

        <Directory "/usr/local/test">
            Options +ExecCGI
            AddHandler cgi-script .cgi .pl .py .sh
            Require all granted
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/test_error.log
        CustomLog ${APACHE_LOG_DIR}/test_access.log combined
    </VirtualHost>
```
