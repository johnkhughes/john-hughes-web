---
title: Easy data URIs in PHP
layout: post
categories: [Code]
tags: [PHP]
excerpt: A data URI can be used to embed files directly in HTML or CSS as base64 encoded strings. Here is a quick PHP function to do just that.
---

A [data URI](https://developer.mozilla.org/en-US/docs/Web/HTTP/data_URIs) can be used to embed files, such as images, directly in HTML or CSS as base64 encoded strings. PHP provides a useful `base64_encode()` function, but to complete the data URI, you need to include the scheme, media type, and encoding. Here is a simple function to make it easier:

~~~~~~~~ php
function data_uri($file, $type) {
    $contents = file_get_contents($file);
    $base64 = base64_encode($contents);
    return "data:$type;base64,$base64";
}
~~~~~~~~

Now you can embed files in HTML with a simple function:

~~~~~~~~ php
<img src="<?php echo data_uri('example.png', 'image/png'); ?>" />
~~~~~~~~

And that's another HTTP request saved. You're welcome.
