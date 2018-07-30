---
title: WordPress excerpt ellipsis
---

An ellipsis is the sequence of dots that appears at the end of something that has been truncated. In WordPress, the default ellipsis added to excerpts is surrounded by square brackets: "[...]". If you don't like it, you can change it with a filter.

~~~ php
<?php

add_filter('excerpt_more', function ($ellipsis) {
    return '&nbsp;&hellip;';
});
~~~

You can change it to anything you want, using HTML entities or Unicode characters if you need them.
