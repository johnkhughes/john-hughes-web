---
title: You already use HTML5
layout: post
categories: [Code, Web]
tags: [HTML]
excerpt: As the development of HTML5 picks up speed, people are starting to think about how they are going to migrate their own sites to the upcoming version of the world’s favourite markup language. However, there seems to be a fairly common misconception that XHTML is a dead end and that we are going to have to “go back” to HTML.
---

As the development of HTML5 picks up speed, people are starting to think about how they are going to migrate their own sites to the upcoming version of the world’s favourite markup language. There has been a lot of excitement surrounding the new elements, particularly the ability to embed multimedia content using the `<video>` tag. However, there also seems to be a fairly common misconception that XHTML is a dead end and that we are going to have to “go back” to HTML. This ignores a hugely important part of HTML5, namely its backward compatibility.

The dash to XHTML 1.0 relied on authors being allowed to send it using the `text/html` content type so it was treated the same as plain old HTML. The [original specification](http://www.w3.org/TR/xhtml1/) allowed this, although [not everyone liked it](http://hixie.ch/advocacy/xhtml). However, regardless of the technical arguments, lack of support for the “real” XHTML content type in Internet Explorer meant that this is how the vast majority of XHTML pages have been sent for the last twelve years.

At the same time, XHTML became _very_ popular. Perhaps because it was so simple to understand, or perhaps the “X” made it sound cool, it was used for about [two-thirds of websites](http://www.webdirections.org/sotw10/markup/) by 2008. Like it or not, XHTML pretending to be HTML is the dominant markup language on the web and in practice XHTML itself has become a dialect of HTML and not the XML language it was originally intended to be.

The [draft specification for HTML5](http://dev.w3.org/html5/spec/spec.html) recognizes this and incorporates the widely-used features of XHTML into the new standard. For example, empty elements can be written as either `<img>` or `<img />`. It is designed to be compatible with existing web pages and existing browser behaviour. This means that your valid XHTML 1.0 Strict page can be turned into a valid HTML5 page simply by changing the DOCTYPE. There is no need to switch back to HTML 4.01. If you don’t believe me, [try it out](http://validator.nu/).
