---
title: Mostly default
layout: post
categories: [Design, Site]
excerpt: You might have noticed that the current iteration of my site doesn't have much in the way of design. In most respects, it is mostly text and mostly default. But choosing to avoid additional code and customization has had a number of benefits, not least in performance and accessibility.
---

You might have noticed that the current iteration of my site doesn't have much in the way of design. No colours, backgrounds, icons, images, or animations. In most respects, it is mostly text and mostly default.

<figure>
    <a href="/content/2015-05-07-screenshot.png"><img src="/content/2015-05-07-screenshot.png" alt="Site screenshot from May 2015" /></a>
    <figcaption>The current, mostly default appearance of my site</figcaption>
</figure>

This might seem a little strange for someone with "web design" in their job description. And, yes, part of the reason is a combination of apathy, indecision, and laziness. But it has also turned into an experiment in minimalism and one that has had some significant benefits:

1.  Performance. The average web page is now [more than 1&nbsp;MB in size](http://www.webperformancetoday.com/2015/01/14/mobile-page-growth/). The [home page](/) of my site is less than 20&nbsp;KB. There are no images, no big JavaScript libraries, and no web fonts, so it needs only two HTTP requests. It's fast on 3G. Heck, it's probably fast on dial up.

2.  Compatibility. I have yet to find a browser that cannot render this design. It's fine on old versions of IE, [Lynx](http://lynx.isc.org/), even Opera Mini on an [old Nokia](http://en.wikipedia.org/wiki/Nokia_C1-01) I had lying around.

3.  Accessibility. There are no hidden elements, nothing moves around, and all the links are clear and consistent. The underlying structure of the page is exactly as it appears in the browser. As far as I am aware, there is nothing on the site that a screen reader cannot access.

4.  Experience. I use this site like I would a notebook. I have nothing to sell, nothing to advertise, and nowhere else I want to direct visitors. There is nothing else to do here except read the text. And that is the whole point of the site.

While I was thinking about this post, I realised that these are all default features of the web. Plain HTML is naturally fast and responsive, it works everywhere, and it is accessible to everyone. We don't realise we are doing it, but these are actually things we often take away from a site when we add complex designs and code.

I don't want to suggest that every site should throw away its design or typography or rich user experience. After all, these are the things that make my job interesting and the web a beautiful place. But it is worth considering these fundamental properties as features we might want to keep when we are building websites. For now, at least, I will making full use of them here on my own site.
