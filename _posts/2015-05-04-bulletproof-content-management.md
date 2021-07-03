---
title: Bulletproof content management
layout: post
categories: [Code, Design]
excerpt: Building a website with a content management system is hard. An over-enthusiastic client with a WYSIWYG editor and too much experience of Microsoft Word can wreak havoc on your design. Here are a few lessons I have learned about building sites that clients can update, but not break.
---

Building a website with a content management system is hard. Just making the content editable in the first place can be bad enough. But the real fear is that an over-enthusiastic client with a WYSIWYG editor and too much experience of Microsoft Word will turn your carefully coded site into a botched experiment in desktop publishing. It doesn't have be this way. Here are a few lessons I have learned about building sites that clients can update, but not break.

## Control the input ##

Don't give a client tools you don't want them to use. You might be stuck with a WYSIWYG editor, but you are not stuck with its default controls. Remove anything that might be dangerous: colours, font sizes, and underlined text can only hurt your design. Why stop there? You can also get rid of anything that doesn't fit in that particular content area. Don't think you should put `<h1>` elements here? Remove the button from the editor and they won't turn up.

Another way of controlling user input is to apply filters to the data before it is stored in the database. For example, I want to prevent users from entering long sequences of non-breaking spaces and empty paragraphs in an attempt to affect page layout. My WYSIWYG editor doesn't allow this sort of control. However, a [simple filter](https://github.com/castlegateit/cgit-wp-no-nbsp) can strip out the white space before the HTML is saved.

## Keep it simple ##

Don't expect clients to know anything about HTML. Don't expect them to enter anything except the simplest range of elements and especially don't expect them to enter anything they can't see on the page, such as `class` or `id` attributes. They will appreciate the simpler interface and you will benefit from cleaner, more predictable markup.

## Control the output ##

Controlling user input means you always get the HTML you expect. However, this might not be all the HTML you need. Applying filters on output as well means you can add attributes, format images, and even transform placeholder content into complex, custom HTML. For example, [shortcodes in WordPress](https://codex.wordpress.org/Shortcode) let you add rich content that would be difficult to get right with a WYSIWYG interface, particularly for someone with no experience of writing HTML.

## Prove it works ##

So you have taken control of the content and you think the system works. Now you have to prove it. Pretend to be the client and really try to break the site. Make sure you use their user account so you only see what they will see. Add too much or too little text. Add an image without a caption. Skip an important heading field. Does the system let you do it? What does the output look like? Required fields should be required in the back end and optional fields should be truly optional in the front end.

While you trying to break it, check that the interface makes sense. Do all the fields have descriptive names? Is it obvious what they are for? Do you get meaningful error messages when you get something wrong? Are the fields arranged in a logical order? Again, do as much as you can to make the interface easy to understand and hard to break.

## Educate the client ##

Even the easiest and most intuitive system can be difficult for a new user. For a typical client, it will be unfamiliar and using it will only be a small part of their job. Take the time to explain how the site works and, if possible, watch them edit the content themselves. If they struggle, consider whether the interface can be improved to help them. You can't expect them to remember everything, so write a simple user guide. Keep it short, avoid technical language, and use images. Ideally, [make this part of the CMS itself](https://github.com/castlegateit/cgit-wp-user-guide) so it never gets lost and new users can find it easily. If you make a change to the system, update the guide.

## Expect the unexpected ##

You can expect a successful site to grow and evolve over time, sometimes in unexpected ways. The design, the code, and the CMS all need to be flexible enough to allow this. You should always be able to add a page or a section or a widget without breaking something else. Keep the system modular and anticipate change so when your client asks for a new feature, you can simply drop it in.

I have used WordPress as an example here, but the same principles can be applied to any content management system. No system is going to be unbreakable or be perfectly understood by every user, but you can avoid a lot of problems by filtering content, testing the system, and training your users. And that means fewer headaches for you as well as a better experience for your client.
