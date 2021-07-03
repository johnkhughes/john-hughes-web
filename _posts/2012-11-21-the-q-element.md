---
title: The q element
layout: post
categories: [Code, Web]
tags: [HTML]
excerpt: The q element first turned up in HTML4 for inline quotations. Lack of support is not the problem it used to be, but I think there are still good reasons to avoid using this element.
---

The `<q>` element first turned up in HTML4 for inline quotations and is still a part of HTML5. The idea is that the browser adds the correct quotation marks around the text, taking into account the current language and whether the text is nested inside another quotation. However, [lack of support](http://www.alistapart.com/articles/qtag/) meant that it was largely ignored. By the time support was added to Internet Explorer 8 more than eleven years after the `<q>` element was standardised, most developers had forgotten about it.

These days, all the major browsers support the element and the related `quotes` CSS property. Despite this, I still don’t think it is a good idea to use the `<q>` element. Take a look at the following extract from [The Sign of the Four](http://www.gutenberg.org/ebooks/2097).

> He laughed until his ears were quite red. “That would hardly do,” he cried. “I don’t know what he would say if I brought you in that sudden way. No, I must prepare you by showing you how we all stand to each other. In the first place, I must tell you that there are several points in the story of which I am myself ignorant. I can only lay the facts before you as far as I know them myself.
>
> “My father was, as you may have guessed, Major John Sholto, once of the Indian army. He retired some eleven years ago, and came to live at Pondicherry Lodge in Upper Norwood …

Where would you put the `<q>` tags? The dialogue is interspersed with text that is not part of the quotation, but then the quotation spans more than one paragraph. It is a bit late to ask Arthur Conan Doyle to use a `<blockquote>` instead.

The obvious solution is to use real quotation marks. And if we can use real quotation marks, why do we need `<q>` at all? We don’t have HTML elements for other punctuation. The characters exist in Unicode, they are semantically correct, and they are right there on your keyboard.
