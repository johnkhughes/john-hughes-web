---
title: Doing more with links
layout: post
categories: [Code, Web]
tags: [HTML]
excerpt: We all know how to write a link to another page or a link to an email address. But did you know that you can also make a phone call or send a text message with a hyperlink?
---

Hyperlinks are the most important part of any web page. A page without a link is a dead end, no more useful than a printed document. However, you can do a lot more with a hyperlink than simply linking to other pages.

As a web developer, writing a hyperlink to another page is probably one of the first things you learned:

<pre><code class="language-html">&lt;a href="http://www.example.com/"&gt;example web page&lt;/a&gt;</code></pre>

And then there is the mailto: protocol for linking to an email address:

<pre><code class="language-html">&lt;a href="mailto:example@example.com"&gt;example email&lt;/a&gt;</code></pre>

However, did you know that you can also use mailto: links to specify multiple email addresses, subject lines, and even the text of the email itself:

<pre><code class="language-html">&lt;a href="mailto:&#8203;example@example.com,&#8203;second@example.com,&#8203;third@example.com?from=fromaddress&#8203;&amp;bcc=addresslist&#8203;&amp;cc=addresslist&#8203;&amp;reply-to=address&#8203;&amp;subject=subject%20text&#8203;&amp;body=body&#8203;%20text"&gt;example email&lt;/a&gt;</code></pre>

Smart phones provide more options, including the tel: protocol for telephone numbers. You cannot use spaces in the number, but you can add hyphens anywhere you want to make your code a bit more readable.

<pre><code class="language-html">&lt;a href="tel:&#8203;+44-1234-567890"&gt;example telephone number&lt;/a&gt;</code></pre>
And you can even use a hyperlink to send a text message:

<pre><code class="language-html">&lt;a href="sms:&#8203;+44-1234-567899"&gt;text message&lt;/a&gt;</code></pre>
As with mailto: links, you can specify multiple recipients and text of the message itself:

<pre><code class="language-html">&lt;a href="sms:&#8203;+44-1234-567890,&#8203;+44-0987-654321?body=body&#8203;%20text"&gt;example text message&lt;/a&gt;</code></pre>

Hyperlinks have always been vital for connecting web pages together. Now you can use them to connect to things outside of the internet as well.
