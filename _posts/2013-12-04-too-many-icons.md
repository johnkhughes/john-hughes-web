---
title: Too many icons
layout: post
categories: [Browsers, Web]
excerpt: Icons used to be easy, but now there are lots of formats, names, and links. There are tools and articles to help, but you can still end up with a lot of files and a lot of code. I am not interested in chasing competing non-standard browser behaviour and so I have given up. From now on, my site will only use one icon.
---

Icons used to be easy. You created a 16 × 16&#160;px image, saved it as `favicon.ico`, and put it in the root of your site. Lately, things have become more complicated. You might want to use larger images for higher resolution screens and there are different naming conventions and `<link>` elements and `<meta>` elements for different browsers. You need to know about Apple touch icons and Windows tile images. It’s hard.

Help is available, of course. [Mathias Bynens](http://mathiasbynens.be/notes/touch-icons) and [Jonathan T. Neal](http://www.jonathantneal.com/blog/understand-the-favicon/) have done a great job documenting the various formats, names, and links used by modern browsers. There is also [Real Favicon Generator](http://realfavicongenerator.net/), which can produce all the icons you could possibly want and even check your existing icons for you.

This makes it easier to get a comprehensive set of icons, but it turns out to be a heck of a lot: 21 images, 15 additional lines of HTML, and an XML file. Worse, all these files and links are aimed at specific browsers. They are not necessarily based on standards and a new browser could add even more. So I have given up. From now on, I will be using a single icon on my site:

~~~~~~~~ html
<link rel="icon" href="icon.png" />
~~~~~~~~

The icon is a high resolution PNG, which actually turned out to be a lot smaller than my old `favicon.ico` after [compression](http://pnggauntlet.com/). It’s a standard image format, a standard `<link>` element, it’s easy to do, and it works in a lot of browsers. And if it doesn’t work, it doesn’t matter. It’s only an icon.
