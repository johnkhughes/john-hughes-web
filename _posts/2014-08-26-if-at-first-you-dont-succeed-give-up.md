---
title: If at first you don't succeed, give up
layout: post
categories: [Code]
tags: [PHP]
excerpt: Recursion is a useful programming technique, but it does risk creating an infinite loop. If your code tries doing the same thing again and again, at some point you have to tell it to stop. It should be obvious, but I find it easy to forget.
---

My teacher once said, "If at first you don't succeed, give up. You clearly aren't very good at it." She was being serious. It wasn't a very good school. But what was undoubtedly terrible advice to a classroom full of young people might be of some use when you are writing software.

I recently wrote a script to log in to a remote server. If the first attempt failed, perhaps because the server was busy, it would try again. The PHP looked something like this, where `get_token()` returns `FALSE` if the login fails:

~~~~~~~~ php
<?php

function connect($url) {
    $token = get_token($url);
    if (!$token) {
        connect($url);
    }
    $attempt++;
}
~~~~~~~~

So far so good, but what if there is a bigger problem with the remote server and you cannot log in at all? I had created an infinite loop. The fix is easy: if you don't succeed in a few attempts, give up. Here is a simplified version of the PHP:

~~~~~~~~ php
<?php

$attempt = 0;

function connect($url) {
    global $attempt;
    $token = get_token($url);
    if (!$token && attempt < 10) {
        connect($url);
    }
    $attempt++;
}
~~~~~~~~

It is an easy fix to an obvious problem, but still one I managed to overlook writing this small part of a much larger and more complex project. Perhaps it is not exactly what my teacher had in mind, but it is useful nonetheless.
