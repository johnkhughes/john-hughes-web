---
title: Normalize headings
layout: post
categories: [Code]
tags: [HTML, PHP]
excerpt: I recently wrote a PHP class that promotes or demotes HTML headings to allow content to be reused without affecting the overall document outline. This means you can use any heading structure you like in your content and not worry about fitting it into an existing template.
---

The last time I updated my site, I decided I wanted to display full posts on the home page instead of short excerpts. I was already using `<h2>` for post titles, so I needed a way of making sure the subheadings in the content do not break the document outline. But I also wanted to avoid making permanent changes to my content because `<h2>` would be entirely appropriate on a single post page.

Essentially, I needed a way of dynamically promoting or demoting headings in an arbitrary fragment of HTML. So I wrote a [PHP class](https://github.com/johnkhughes/normalize-headings) to do just that. It is very easy to use. You can specify the content and the highest permitted headings level when you create the object. In this example, headings cannot be higher than `<h3>`.

~~~~~~~~ php
<?php

$content = new Normalize_Headings($html, 3);
~~~~~~~~

You can also set the content and heading level manually.

~~~~~~~~ php
<?php

$content->set_content($html);
$content->set_level(3);
~~~~~~~~

The `get_content()` method returns the HTML content with the top level headings converted to `<h3>` and any subheadings promoted or demoted accordingly.

~~~~~~~~ php
<?php

$content->get_content();
~~~~~~~~

If you need the original HTML, you can return that at any time too.

~~~~~~~~ php
<?php

$content->get_original_content();
~~~~~~~~

It is also easy to set it up as a WordPress filter, in this case making subheadings `<h2>` on single posts and pages and `<h3>` everywhere else.

~~~~~~~~ php
<?php

function normalize_headings_filter($html) {
    $content = new Normalize_Headings($html, 3);
    if (is_page() || is_single()) {
        $content->set_level(2);
    }
    return $content->get_content();
}

add_filter('the_content', 'normalize_headings_filter');
~~~~~~~~

You can grab the [source code on GitHub](https://github.com/johnkhughes/normalize-headings) and it is released under the MIT license, so you can use it and change it as much as you want.

## A note on HTML5 ##

I realise that HTML5 allows you to [create an outline](http://html5doctor.com/outlines/) with `<section>` elements and whatever headings you like as a way of overcoming these sorts of problems. However, HTML5 outlines are [not exactly reliable](http://blog.paciellogroup.com/2013/10/html5-document-outline/) at the moment and it always good to use [backward compatible code](http://www.456bereastreet.com/archive/201205/make_sure_your_html5_document_outline_is_backwards_compatible/)!
