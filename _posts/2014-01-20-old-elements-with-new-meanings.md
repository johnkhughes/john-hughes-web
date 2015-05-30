---
title: Old elements with new meanings
layout: post
categories: [Code, Web]
tags: [HTML]
excerpt: There are lots of new elements in HTML5, but there are also a few old elements with new meanings. In particular, there are several formerly presentational elements that have been redefined to have semantic value.
---

There are lots of new elements in HTML5, but there are also a few old elements with new meanings. In particular, there are several formerly presentational elements that have been redefined to have semantic value. The following summary is based on [Differences from HTML4](http://www.w3.org/TR/html5-diff/#changed-elements), which is a W3C working draft.

The `<i>` element can now be used to indicate a “different quality of text”, such as a taxonomic name, a phrase in another language, or the name of a ship. The `<b>` element can be used to draw attention to a span of text without giving it increased importance or emphasis. You can use `<small>` for side comments or small print. You can also use `<s>` to mark text as no longer accurate or relevant. And the `<hr>` element now represents a “paragraph-level thematic break”.

We are used to thinking of elements like `<i>` as purely presentational and having no place on the semantic web. However, there are lots of things that are traditionally set in italic and that are definitely not forms of emphasis. Now we have a good way of marking them up. This is a good thing.

Having said that, these new semantic meanings do present a slight technical problem. A lot of WYSIWYG editors have buttons marked “italic” and “bold” that actually insert `<em>` and `<strong>` tags. Some will even replace `<i>` and `<b>` tags entered manually with their supposedly semantic equivalents. A content management system, therefore, may only permit italic and bold in the form of emphasis. I am pleased to report that WordPress no longer substitutes the elements you enter, but it still doesn’t make it easy for a beginner to use the redefined elements.

Giving new meaning to these old elements makes them immediately useful on the web. However, we still need better support for them in common editors before they can really be used by people who don’t write HTML by hand.
