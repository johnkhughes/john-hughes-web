---
title: Adding multiple load events
layout: post
categories: [Browsers, Code]
tags: [JavaScript]
excerpt: This is an old tip, but it’s still useful. With a simple function, you can add multiple load events to a page while maintaining cross-browser compatibility.
---

This is an old tip, but it’s still useful. Starting a function when your page loads using `window.onload` is well supported, but you can only add one onload event. The newer `window.addEventListener` method should make this easy, but it doesn’t work with old versions of Internet Explorer. However, with a simple function, you can add as many events as you want without worrying about backwards compatibility.

The trick is to check if `window.onload` already exists and then to make a copy of it that can be added to a new window.onload event.

~~~~~~~~ javascript
function addLoadEvent(fn) {
    var old = window.onload;
    if (typeof window.onload !== 'function') {
        window.onload = fn;
    } else {
        window.onload = function() {
            old();
            fn();
        };
    }
}
~~~~~~~~

I first spotted this in <a href="http://www.sitepoint.com/books/jsant1/"><cite>The JavaScript Anthology</cite></a> by James Edwards and Cameron Adams, but I’ve seen it in all sorts of places since then.
