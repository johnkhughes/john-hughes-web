---
title: WordPress holding page
layout: post
categories: [Code]
tags: [WordPress]
excerpt: If you are developing a new WordPress site on a live server, you might want to display a holding page to anyone who isn’t working on the site. You can do this very easily, using a few lines to check whether the current user is logged in.
---

If you are developing a WordPress site on a live server, you might want to display a holding page to anyone who isn’t working on the site. You can do this very easily by using a few lines of PHP to check whether the current user is logged in.

~~~~~~~~ php
if (!is_user_logged_in()) {
    exit('Holding Page');
}
~~~~~~~~

You can put this somewhere in `functions.php` or `header.php` to stop the rest of the page being displayed. Use `exit()` to show the content of the holding page. Any user who is logged in will be able to view the site as normal.
