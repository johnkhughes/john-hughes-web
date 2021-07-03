---
title: Doing more with links
layout: post
categories: [Code, Web]
tags: [HTML]
excerpt: We all know how to write a link to another page or a link to an email address. But did you know that you can also make a phone call or send a text message with a hyperlink?
---

Hyperlinks are the most important part of any web page. A page without a link is a dead end, no more useful than a printed document. However, you can do a lot more with a hyperlink than simply linking to other pages.

As a web developer, writing a hyperlink to another page is probably one of the first things you learned:

~~~~~~~~ html
<a href="http://www.example.com/">example web page</a>
~~~~~~~~

And then there is the mailto: protocol for linking to an email address:

~~~~~~~~ html
<a href="mailto:example@example.com">example email</a>
~~~~~~~~

However, did you know that you can also use mailto: links to specify multiple email addresses, subject lines, and even the text of the email itself:

~~~~~~~~ html
<a href="mailto:example@example.com,second@example.com,third@example.com?from=fromaddress&amp;bcc=addresslist&amp;cc=addresslist&amp;reply-to=address&amp;subject=subject%20text&amp;body=body%20text">example email</a>
~~~~~~~~

Smart phones provide more options, including the tel: protocol for telephone numbers. You cannot use spaces in the number, but you can add hyphens anywhere you want to make your code a bit more readable.

~~~~~~~~ html
<a href="tel:+44-1234-567890">example telephone number</a>
~~~~~~~~
And you can even use a hyperlink to send a text message:

~~~~~~~~ html
<a href="sms:+44-1234-567899">text message</a>
~~~~~~~~
As with mailto: links, you can specify multiple recipients and text of the message itself:

~~~~~~~~ html
<a href="sms:+44-1234-567890,+44-0987-654321?body=body%20text">example text message</a>
~~~~~~~~

Hyperlinks have always been vital for connecting web pages together. Now you can use them to connect to things outside of the internet as well.
