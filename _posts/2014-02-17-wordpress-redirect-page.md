---
title: WordPress redirect page
layout: post
categories: [Code]
tags: [WordPress]
excerpt: Sometimes a page isn’t really a page, it is a container for other pages. This WordPress template automatically redirects to the first child page so any page can be a container without content.
---

Sometimes a page isn’t really a page, it is a container for other pages. In WordPress, this would be a parent page with one or more child pages. The problem is that the empty parent page still exists and can viewed on the site. A simple solution to this is to create a template that redirects to the first child page:

~~~~~~~~ php
/*
Template Name: Redirect Page
*/

$pages = get_pages(array(
    'child_of' => $post->ID,
    'sort_column' => 'menu_order',
));

if (count($pages)) {
    wp_redirect(get_permalink($pages[0]->ID));
    exit;
}
~~~~~~~~

The template checks that a child page exists before redirecting, so it is safe to use with any page.
