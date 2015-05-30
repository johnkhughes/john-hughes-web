---
title: JavaScript, innerHTML, and the DOM
layout: post
categories: [Code, Web]
tags: [HTML, JavaScript]
excerpt: In JavaScript, the innerHTML property is a quick and easy way to get or set the contents of an element. However, it is also non-standard. Here is a standards-based alternative.
---

In JavaScript the `innerHTML` property can be used to get or set the contents of an element. It’s quick and easy, which means it turns up everywhere. However, it is also non-standard and does not necessarily update the Document Object Model (DOM), which means it can produce unpredictable results when combined with other functions. Here is standards-based alternative.

Changing the content of an element with `innerHTML` is easy:

~~~~~~~~ javascript
var element = document.getElementById('example');
element.innerHTML = 'new content';
~~~~~~~~

It is possible to achieve the same effect using DOM methods:

~~~~~~~~ javascript
var element = document.getElementById('example');
while (element.firstChild) {
    element.removeChild(element.firstChild);
}
element.appendChild(document.createTextNode('new content'));
~~~~~~~~

This deletes the content of the element while it still has content, then appends a text node using standard DOM techniques. The new content can then be accessed as part of the DOM.

As you can see, it takes a few more lines of code. However, it is still quite straightforward and has the advantage of conforming to established web standards.
