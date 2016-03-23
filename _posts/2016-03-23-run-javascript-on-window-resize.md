---
title: Run JavaScript on window resize
categories: [Code]
tags: [JavaScript, RWD]
excerpt: The JavaScript resize event fires continuously while the window is resizing, which is a problem for responsive web design. Luckily, it is easy to implement a custom event that only fires after the window has finished resizing.
---

If you are working on a responsive site and you want to run some JavaScript when the viewport changes size or shape, you might think about using the `resize` event. Unfortunately, `resize` will fire _continuously_ while the window is resizing, which means your JavaScript will be run repeatedly until the window has finished being resized. This is less than ideal.

It would be better to run the code only when the window has finished resizing and to do that, we need to create our own event. Luckily, this is fairly trivial using jQuery:

~~~~ javascript
var resizeDone;

$(window).on('resize', function() {
    clearTimeout(resizeDone);

    resizeDone = setTimeout(function() {
        $(window).trigger('resizeDone');
    }, 100);
});

$(window).on('load resizeDone', function() {
    // do something after the window has been resized
});
~~~~

This creates an event called `resizeDone`, which fires 100&nbsp;ms _after_ the window has finished resizing. In this example, I have also run the code on `$(window).on('load')` so that it takes effect on initial page load as well. Note that `$(document).ready()` fires as soon as the DOM is ready, which is often before the CSS has finished parsing, and so isn't a suitable way of invoking code that affects page layout.
