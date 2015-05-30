---
title: Fix the prefixes
layout: post
categories: [Browsers, Web]
tags: [CSS]
excerpt: There’s been a lot of noise on the web today over the possibility that several browser vendors are considering supporting a proprietary prefix so that websites made by stupid people will look pretty on their platform. This is a bad thing.
---

There’s been a lot of noise on the web today over the possibility that several browser vendors are considering supporting the proprietary `-webkit-` prefix so that websites made by stupid people will look pretty on their platform. This is a _bad thing_.

Open web standards and cross-browser support make the web a better place. Monopolies by dominant browsers make the web a worse place. How do we know this? Internet Explorer 6. That’s how.

Vendor prefixes are useful tools for developers, but they are designed for experimental features and should not be relied upon for core features of your site. If you use them, you should follow the principle of [progressive enhancement](http://www.alistapart.com/articles/understandingprogressiveenhancement), so your site can be used as many people and as many browsers as possible.

For more information on exactly why this is important, I suggest reading today’s posts by [Remy Sharp](http://remysharp.com/2012/02/09/vendor-prefixes-about-to-go-south/), [Bruce Lawson](http://www.brucelawson.co.uk/2012/on-the-vendor-prefixes-problem/), [Eric Meyer](http://meyerweb.com/eric/thoughts/2012/02/09/unfixed/), and [Daniel Glazman](http://www.glazman.org/weblog/dotclear/index.php?post/2012/02/09/CALL-FOR-ACTION%3A-THE-OPEN-WEB-NEEDS-YOU-NOW).
