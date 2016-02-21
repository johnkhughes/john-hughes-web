---
title: Another image replacement method
layout: post
categories: [Code]
tags: [CSS]
excerpt: I recently discovered what I think is a new method for image replacement, so I thought I would share it here. It might not work in old versions of Internet Explorer, but it will at least display something useful.
---

I recently discovered what I think is a new method for image replacement, so I thought I would share it here. It is very simple, but it uses the `:before` pseudo-element so it will not work in old versions of Internet Explorer. However, it should simply display the text instead so it is a pretty safe technique.

Essentially, the method is the same as the [Gilder/Levin Method](http://www.mezzoblue.com/tests/revised-image-replacement/), but using a pseudo-element instead of an empty `span`. The code:

~~~~~~~~ css
h1 {
    position: relative;
    height: 100px; /* height of image.png */
}

h1:before {
    content: url(image.png);
    height: 100%;
    position: absolute;
}
~~~~~~~~

I apologize if someone else has already discovered this, but I could not find it anywhere else. I am not a big fan of image replacement, but perhaps someone will find useful.
