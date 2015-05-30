---
title: Writing JavaScript for WordPress
layout: post
categories: [Code]
tags: [JavaScript, WordPress]
excerpt: When you are writing JavaScript for a WordPress site, it is tempting to shove script elements straight into the header. However, you can avoid a lot of problems by enqueueing scripts properly. This way, you can always be sure your code will load in the right order and without duplicating dependencies.
---

When you are writing JavaScript for a WordPress site, it is tempting to shove `<script>` elements straight into `header.php`. This might work at first, but you will quickly run into problems. Themes and plugins can load their own scripts, so eventually you will end up trying to load the same library twice and something will break.

Thankfully, WordPress has a simple way of adding scripts, including their dependencies, without loading the same thing twice and keeping everything in the right order. The trick to is use `wp_enqueue_script()`:

~~~~~~~~ php
function my_scripts() {
    $dir = get_template_directory_uri();
    wp_enqueue_script('my-script', "$dir/my-script.js", array('jquery'));
}

add_action('wp_enqueue_scripts', 'my_scripts');
~~~~~~~~

The first argument is a unique identifier used for the script, the second is the script URI, and the third is an array of dependencies. There is a [complete list of parameters in the WordPress Codex](http://codex.wordpress.org/Function_Reference/wp_enqueue_script). Adding scripts this way means they all get loaded, they only get loaded once, and they always appear in the right order.

This is the _right way_ of adding JavaScript to a WordPress site. A quick word of warning when using jQuery, however: the copy of jQuery included with WordPress uses `jQuery.noConflict()` so anything you have written using the usual `$` function won't work out of the box. In this case, an [IIFE](http://hughesblog.co.uk/2014/09/is-it-safe/) can save the day again:

~~~~~~~~ javascript
(function($) {
    // code
})(jQuery);
~~~~~~~~

This passes the `jQuery` object as an argument to the IIFE, which then refers to it as `$`. Easy.
