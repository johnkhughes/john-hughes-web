---
title: JavaScript NaN is a number
categories: [Code]
tags: [JavaScript]
excerpt: This just caught me out so I thought I would share it here as a warning to others. In JavaScript, `NaN` is a number. Seriously. The property that specifically means "not a number" is a number.
---

This just caught me out so I thought I would share it here as a warning to others. In JavaScript, `NaN` is a number. Seriously. The property that specifically means "not a number" is a number:

~~~ javascript
console.log(typeof NaN); // number
~~~

So if you want to check whether a variable is not a number, you should use the `isNaN()` function instead. I honestly have no idea why the `NaN` property exists at all, except as a really bad joke.
