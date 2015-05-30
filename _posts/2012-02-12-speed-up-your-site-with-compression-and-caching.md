---
title: Speed up your site with compression and caching
layout: post
categories: [Web]
excerpt: If your site is hosted on a Linux server, you might be able to speed it up a bit with a couple of easy htaccess tricks.
---

If your site is hosted on a Linux server, you might be able to speed it up a bit with a couple of easy `.htaccess` tricks.

### Compression ###

Some servers allow `gzip` compression before sending a response, which means smaller downloads for browsers. Image files are already compressed, so there is no need to use server resources to compress them. However, anything stored as plain text can be compressed based on extension:

    AddOutputFilter DEFLATE .html .css .js .php .xml

They can also be compressed by content type, but this is a bit more tedious to set up because different servers use different content types for JavaScript:

    AddOutputFilterByType DEFLATE application/javascript application/x-javascript application/xhtml+xml application/xml text/css text/html text/javascript text/plain text/xml

Unfortunately, not all servers allow compression.

### Caching ###

You might also be able to enable caching of static resources, so browsers do not have to download styles and images every time they access the site. Again, this can be done by extension:

    <FilesMatch "\.(css|flv|gif|ico|jpe?g|js|pdf|png|swf)$">
        ExpiresActive On
        ExpiresDefault "access plus 1 month"
    </FilesMatch>

And it can be done by content type:

    ExpiresActive On
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"

Again, not all servers support this. It also relies on browser settings, although these normally allow caching by default.

If you want more details on compression and caching with Apache, take a look at the documentation for [mod\_deflate](http://httpd.apache.org/docs/2.0/mod/mod_deflate.html) and [mod\_expires](http://httpd.apache.org/docs/2.0/mod/mod_expires.html). Remember, your mileage may vary.
