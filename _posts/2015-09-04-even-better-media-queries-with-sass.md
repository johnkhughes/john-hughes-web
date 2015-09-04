---
title: Even better media queries with Sass
layout: post
categories: [Code, Web]
tags: [CSS]
---

In a [previous post](/2015/02/sass-media-queries-and-ie8/), I described a Sass media query mixin that makes it a bit easier to generate CSS for old versions of IE that don't support media queries. The idea was to use a global variable to decide whether or not to surround the CSS rules with `min-width` media queries. Modern browsers get a mobile first responsive site and old versions of IE get the equivalent of the largest breakpoint.

This is a refinement of my previous Sass media query mixin, using an array of values to make it easier to set the breakpoints. It also lets you bypass IE altogether and switch to `max-width` media queries as required.

~~~~~~~~ scss
@mixin media($name, $ie: true, $prefix: min) {

    $env: 'main' !default;
    $sizes: (small: 30em, medium: 40em, large: 60em);

    @if $env == ie and $ie == true {
        @content;
    }

    @else {

        $size: map-get($sizes, $name);

        @if $prefix != min {
            $size: $size - 0.001;
        }

        @media screen and (#{$prefix}-width: #{$size}) {
            @content;
        }

    }

}
~~~~~~~~

We need to subtract a little from the `max-width` breakpoints to prevent them overlapping with the `min-width` breakpoints. If you are using `px` values, you can simply subtract `1` instead. As before, the main Sass file will look something like this:

~~~~~~~~ scss
@import 'media';
@import 'foo';
~~~~~~~~

And the IE file will be similar, but with the global variable set at the top:

~~~~~~~~ scss
$env: ie;
@import 'media';
@import 'foo';
~~~~~~~~

If you have already given up on browsers that don't support media queries, the mixin can be simplified further:

~~~~~~~~ scss
@mixin media($name, $prefix: min) {

    $sizes: (small: 30em, medium: 40em, large: 60em);
    $size: map-get($sizes, $name);

    @if $prefix != min {
        $size: $size - 0.001;
    }

    @media screen and (#{$prefix}-width: #{$size}) {
        @content;
    }

}
~~~~~~~~

It's still not perfect: old versions of IE will still receive a lot of redundant code. But it is convenient and now it is a bit more flexible and a bit easier to update as well.
