---
title: Goodbye WebKit
layout: post
categories: [Browsers]
tags: [Chrome]
excerpt: When Opera announced their move to WebKit, I wanted to write about the poorer place the web would be without the Presto rendering engine. And then Google announced Blink and suddenly I am faced with another browser testing headache.
---

When Opera announced their move to WebKit, I wanted to write about the loss of competition, the growing WebKit monoculture, and the poorer place the web would be without the Presto rendering engine. And then Google announced [Blink](http://blog.chromium.org/2013/04/blink-rendering-engine-for-chromium.html) and everything changed again.

Personally, I think Blink is a good thing. More browsers and more rendering engines means more competition and innovation. Remember the long years of IE6? That’s what a monoculture looks like. And because Blink is a fork of WebKit, it will already have solid support for standards and developers don’t need to worry about a sudden change in the next version of Chrome.

Another reason to be optimistic is that Google seem to be committed to an [open development process](http://www.chromium.org/blink). Thanks to Chrome, Blink will inherit an enormous number of users and Google are aware of their dominance in a space that relies on cooperation and interoperability. So far, they appear to be taking their responsibility to the wider web seriously.

As I said, I think Blink is going to be good for the web. However, it does present some of us developers with a new browser testing headache. I _know_ I am supposed to test in all the browsers and I _know_ that you cannot assume that two WebKit browsers will work exactly the same. But I cannot test in Safari because I haven’t got a Mac.

I _want_ to test my sites in Safari, but there is no way I can afford a Mac just for browser testing. And Windows remains dominant on the desktop, so it still makes sense to focus my testing there than on any other platform. With Chrome and Opera moving to Blink, there is no mainstream WebKit browser on Windows and as the two rendering engines diverge, this is going to become a problem. A headache for me, but something worse for Safari? Suddenly, and unexpectedly, WebKit is no longer the dominant force on the web.
