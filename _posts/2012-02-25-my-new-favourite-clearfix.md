---
title: My new favourite clearfix
layout: post
categories: [Code]
tags: [CSS]
excerpt: You can avoid unnecessary empty elements and awkward overflow issues when clearing floats with a few short lines of CSS.
---

Adding empty `<div>` elements for purely presentational purposes used to be a necessary evil. The `overflow: hidden` trick fixed that problem, but raised the obvious issue that anything that flowed over the edge of the element was … hidden. Bad news for our new CSS box shadows. Now, thanks to the [work of clever people](http://www.positioniseverything.net/easyclearing.html), there is a really good solution.

The technique uses the `:after` pseudo-element:

~~~~~~~~ css
.clearfix:after {
    clear: both;
    content: "";
    display: block;
}
~~~~~~~~

Now, you can simply add the `clearfix` class to any elements containing floats. Easy.

For a more detailed explanation and support for old versions of Internet Explorer, see [Nicolas Gallagher’s blog](http://nicolasgallagher.com/micro-clearfix-hack/).
