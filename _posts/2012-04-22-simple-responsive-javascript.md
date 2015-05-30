---
title: Simple responsive JavaScript
layout: post
categories: [Browsers, Web]
tags: [JavaScript, RWD]
excerpt: There are lots of ways of creating a responsive navigation menu, but many of them involve using JavaScript to detect browser size. This is my method, which produces a collapsible menu on smaller screens without relying on JavaScript techniques for size detection.
---

Brad Frost recently wrote a great summary of [responsive navigation patterns](http://bradfrostweb.com/blog/web/responsive-nav-patterns/). Personally, I prefer the [toggle method](http://bradfrostweb.com/blog/web/responsive-nav-patterns/#toggle), which keeps the menu out of the way until you need it and that is the method I chose for my own site. Here is how I implemented it.

My own approach is similar to an [example by Filament Group](http://filamentgroup.com/lab/responsive_design_approach_for_navigation/), but mine completely avoids trying to detect the size of the window with JavaScript.

I’ll start with a simple HTML navigation menu:

~~~~~~~~ html
<div class="nav">
    <ul>
        <li><a href="#">Lorem Ipsum</a></li>
        <li><a href="#">Dolor Sit Amet</a></li>
        <li><a href="#">Consectetur</a></li>
    </ul>
</div>
~~~~~~~~

Because I am going to use a [mobile first](http://stuffandnonsense.co.uk/projects/320andup/) approach, the menu will start out as a vertical list:

~~~~~~~~ css
@media screen {

    .nav li {
        display: block;
    }

}
~~~~~~~~

On larger screens, the menu will be converted into a horizontal list:

~~~~~~~~ css
@media screen and (min-width: 60em) {

    .nav li {
        display: inline;
    }

}
~~~~~~~~

The navigation menu will now adapt to the size of the screen. The next job is to use JavaScript to collapse the menu at small screen sizes and add a control to toggle the menu on and off.

The script is very simple. The first part adds a link to the top of the menu to act as a control:

~~~~~~~~ javascript
// Get existing nav elements
var nav = document.getElementsByClassName('nav')[0];
var ul = nav.getElementsByTagName('ul')[0];

// Create new nav control elements
var control = document.createElement('div');
var link = document.createElement('a');

// Function to add control elements
var setNavControl = function() {
    link.href = '#';
    link.innerHTML = 'Show Navigation';
    control.className = 'mq-control';
    control.appendChild(link);
    nav.insertBefore(control, nav.firstChild);
    ul.className = 'mq-small-hidden';
};

// Add the nav control elements
setNavControl();
~~~~~~~~

The toggle control only needs to be visible on small screens, so I can now hide it on large screens in the stylesheet:

~~~~~~~~ css
@media screen and (min-width: 60em) {

    .mq-control {
        display: none;
    }

}
~~~~~~~~

The second part of the script then toggles a class on the navigation list element when the control is clicked:

~~~~~~~~ javascript
// Function to toggle nav list class
var toggleNavControl = function(event) {
    if (ul.className === 'mq-small-hidden') {
        link.innerHTML = 'Hide Navigation';
        ul.className = '';
    } else {
        link.innerHTML = 'Show Navigation';
        ul.className = 'mq-small-hidden';
    }
    link.blur();
    return false;
};

// Call toggle function when user clicks the nav control link
link.onclick = toggleNavControl;
~~~~~~~~

In this case, the text of the link is also updated. For this to work, this class should be hidden on small screens, but visible on large screens (where there will be no toggle control). Therefore, another bit of CSS is required:

~~~~~~~~ css
@media screen {

    .mq-small-hidden {
        display: none;
    }

}

@media screen and (min-width: 60em) {

    .mq-small-hidden {
        display: block;
    }

}
~~~~~~~~

The result is a navigation menu that collapses at small screen sizes but does not rely on any detection of browser size or orientation with JavaScript. It is quick to produce and accessible, and progressive enhancement means that the menu will function with or without the script.
