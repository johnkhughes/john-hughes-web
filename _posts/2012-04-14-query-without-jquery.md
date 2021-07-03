---
title: Query without jQuery
layout: post
categories: [Code, Web]
tags: [JavaScript]
excerpt: One of the great advantages of using jQuery is that it makes it easy to select a set of elements on the page using the familiar syntax of CSS. But did you know you can also do that without jQuery?
---

One of the great advantages of using [jQuery](http://jquery.com/) is that it makes it easy to select a set of elements on the page using the familiar syntax of CSS. But did you know you can also do that without jQuery?

The [Selectors API](http://www.w3.org/TR/selectors-api/) has been around for a while now, but not many people know about it. The API is supported by all the recent versions of the major browsers, including Internet Explorer 8 and above. It provides two methods, `querySelector()` and `querySelectorAll()`, which take a CSS selector as an argument and which return a DOM object.

The `querySelector()` method only returns the first match, whereas the `querySelectorAll()` method returns all the matches as a collection of objects. For example, the following will return the first element with the example class:

~~~~~~~~ javascript
document.querySelector('.example');
~~~~~~~~

And this will return _all_ the elements with the `example` class _and_ the third `span` element child of each `p` element:

~~~~~~~~ javascript
document.querySelectorAll('.example, p > span:nth-of-type(3)');
~~~~~~~~

Using these methods, it is possible to select a relatively complex range of elements very quickly and easily. Obviously, these methods will only work with the CSS selectors actually supported by the browser and so it is not a replacement for all the possible jQuery selectors. And if you need to support Internet Explorer 7 or below, you are out of luck. But for other situations, it is a simple method that might save you some time and bandwidth.
