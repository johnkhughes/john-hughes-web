---
title: Sass, media queries, and IE8
layout: post
categories: [Code]
tags: [CSS, Sass]
excerpt: Mobile first responsive design applies progressive enhancement to layout, using media queries to add complexity only when the screen is large enough to use it. The lack of support for media queries in IE8 can be a problem, but one you can work around with a little bit of Sass.
---

Taking a [mobile first][1] approach to responsive web design often means starting with the smallest screen size and adding design and layout with `min-width` media queries. You can look at it as another form of [progressive enhancement][2], which is always a _good thing_. However, it does have the unfortunate side effect of leaving IE8 with the narrowest layout stretched across the widest screen. This is less than ideal.

The simplest solution is to write a second CSS file and link to it from within a conditional comment. But that's tedious and means that any change you make later has to be carefully replicated in the IE8 CSS as well. If you are not fortunate enough to have dropped support for IE8 and you don't mind getting your hands dirty with [Sass][3], you can save yourself some time and effort with a simple mixin and a variable.

If you are already using Sass, you might have written a mixin such as this to make it easier to write media queries:

~~~~~~~~ scss
@mixin media($size) {
    @if $size == small {
        @media screen and (min-width: 40em) { @content; }
    }
    @else if $size == large {
        @media screen and (min-width: 60em) { @content; }
    }
}
~~~~~~~~

Now you can write media queries in Sass:

~~~~~~~~ scss
.foo {
    color: red;
    @include media(small) {
        color: blue;
    }
}
~~~~~~~~

And you will get the following compiled CSS:

~~~~~~~~ scss
.foo {
    color: red;
}
@media screen and (min-width: 40em) {
    .foo {
        color: blue;
    }
}
~~~~~~~~

Now let's assume the mixin and the styles for `.foo` are stored in separate files, included in a `main.scss` file:

~~~~~~~~ scss
@import 'media';
@import 'foo';
~~~~~~~~

We also want to create an `ie.scss` file that includes the same source files, but without the media queries. With a slight modification to our mixin, we can do just that:

~~~~~~~~ scss
@mixin media($size) {
    $env: main !default;
    @if $env == ie {
        @content;
    }
    @else if $size == small {
        @media screen and (min-width: 40em) { @content; }
    }
    @else if $size == large {
        @media screen and (min-width: 60em) { @content; }
    }
}
~~~~~~~~

Now the output of the mixin is dependent on a variable, `$env`. If `$env` is not set, it will take the default value `main` and the mixin will work exactly as before. However, if `$env` is given the value `ie`, the mixin returns the CSS unmodified; without wrapping it in a media query. We don't have to make any changes to the main Sass file or to the styles for `.foo`. But we can create an IE8 stylesheet from `ie.scss` by including the same source files and defining the `$env` variable at the top:

~~~~~~~~ scss
$env = ie;
@import 'media';
@import 'foo';
~~~~~~~~

Compiling `main.scss` will give the same result as before, with media queries, but compiling `ie.scss` will provide CSS without media queries:

~~~~~~~~ scss
.foo {
    color: red;
    color: blue;
}
~~~~~~~~

It's not perfect: the CSS will contain duplicate properties where the wider media queries would have overridden the narrower styles, so there could be a lot of redundant code. But the file will only ever be downloaded by an ever smaller number of IE8 users, so I think that's a small price to pay for the convenience of writing---and maintaining---a single source.

**Update (4 Sep 2015):** Since writing this post, I have refined this mixin to produce [even better media queries with Sass](/2015/09/even-better-media-queries-with-sass/).

[1]: http://www.lukew.com/ff/entry.asp?933
[2]: http://bradfrost.com/blog/web/mobile-first-responsive-web-design/
[3]: http://sass-lang.com/
