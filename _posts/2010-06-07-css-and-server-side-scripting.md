---
title: CSS and server-side scripting
layout: post
categories: [Code]
tags: [CSS, PHP]
excerpt: CSS is a powerful stylesheet language. However, you can get even more out of it if you combine it with a bit of server-side scripting. Here are two techniques I find useful to add a bit of programming magic to CSS.
---

CSS is a powerful stylesheet language. However, you can get even more out of it if you combine it with a bit of server-side scripting. Here are two techniques I find useful to add a bit of programming magic to CSS.

## Dynamic stylesheets ##

When you are designing a website, you probably find yourself using the same colour again and again throughout your CSS file. This is tedious enough, but it becomes even more frustrating if you suddenly decide you want to use a different colour instead. Using server-side scripting, you can make it a lot easier to make this kind of change.

Firstly, change the extension of your stylesheet to the extension of your scripting language of choice. In this example I’ll be using PHP, so the file will be called style.php. Make sure you change the link element in the HTML file as well:

~~~~~~~~ html
<link rel="stylesheet" type="text/css" href="style.css.php" />
~~~~~~~~

Next, make sure that the stylesheet file identifies itself as a CSS file. In PHP, this is done using:

~~~~~~~~ php
header('Content-Type: text/css; charset=utf-8'); ?>
~~~~~~~~

Now you have all the programming features of PHP at your disposal. You can use it to store colour values in variables to make it easy to insert the same ones throughout the file:

~~~~~~~~ php
$bg = '#fff';
$fg = '#c00';

?>

body {
    background: <?php echo $bg; ?>;
    color: <?php echo $fg; ?>;
}
~~~~~~~~

But why stop there? There are plenty of other uses for scripting in CSS. How about a different colour scheme on each day of the week? The possibilities are endless.

## Reducing HTTP requests ##

If you have a very small site, you can also combine CSS with server-side scripting to reduce the strain on your server. We all know that keeping you CSS in a separate file makes it easier to manage. However, this means that two HTTP requests are made when the page loads: one for the HTML file and one for the CSS stylesheet.

If you expect your visitors to view lots of pages on your site, this reduces downloads because the browser will cache the stylesheet and reuse it on subsequent pages. However, if people are just going to load one page and then leave, there is no advantage to caching the stylesheet. In these situations, you can keep the stylesheet in a separate file on the server for your own sanity, but use server-side includes to put it all in a single file for download and keep the number of HTTP requests down. The PHP page might look like this:

~~~~~~~~ php
<!DOCTYPE html>
<html>
    <head>
        <title>Title</title>
        <style type="text/css">
        <?php include 'style.css.php'; ?>
        </style>
    </head>
    <body>
        <!-- Content -->
    </body>
</html>
~~~~~~~~

The stylesheet itself could be static CSS or a dynamic file as described above.
