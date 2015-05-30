---
title: Not in Internet Explorer 6
layout: post
categories: [Code]
tags: [CSS, Internet Explorer]
excerpt: Nobody wants to make websites for Internet Explorer 6, but unfortunately we do not always have a choice. Here is a useful list of features you cannot use if you are unlucky enough to be designing for the browser everyone loves to hate.
---

Nobody wants to make websites for Internet Explorer 6, but unfortunately we do not always have a choice. For a while now, I have been keeping a list of CSS 2.1 features absent in Internet Explorer 6 as a quick reference when I’m putting a new stylesheet together. If you have not already given up developing for this dinosaur of a browser, perhaps you too will find it useful.

### Element selectors ###

*   `e &gt; f`
*   `e + f`
*   `e ~ f`

### Attribute selectors ###

*   `e[attr]`
*   `e[attr="value"]`
*   `e[attr~="value"]`
*   `e[attr|="value"]`

### Pseudo-elements ###

*   `e:first-letter`
*   `e:first-line`
*   `e:before`
*   `e:after`

### Pseudo-classes ###

*   `e:hover`
*   `e:focus`
*   `e:first-child`
*   `e:lang(en)`

### Properties ###

*   `min-width`
*   `max-width`
*   `min-height`
*   `max-height`
*   `vertical-align`
*   `quotes`
*   `content`
*   `counter-increment`
*   `counter-reset`
*   `border-collapse`
*   `border-spacing`
*   `caption-side`
*   `empty-cells`
*   `outline`

### Values ###

*   `display: table;`
*   `display: inline-block;`
*   `white-space: pre-line;`
*   `white-space: pre-wrap;`
*   `inherit`
