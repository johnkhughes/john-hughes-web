---
title: Normalize headings redux
categories: [Code]
tags: [JavaScript, PHP, Python, Ruby]
excerpt: A little while ago, I wrote a PHP class to promote and demote headings in HTML content so that they fit in with the surrounding document outline. Since then, I have found a much simpler method, using regular expression substitutions with callbacks. As a bonus, here is how you do it in four different languages.
---

A little while ago, I wrote a [PHP class](/2013/12/normalize-headings/) to promote and demote headings in HTML content so that they fit in with the surrounding document outline. Since then, I have found a much easier way of doing that. The trick is to work out the difference between the current and the desired heading level and then to use a regular expression substitution with a callback to promote or demote each heading within the content.

It is so simple that you don't really need a class; a short function or method is sufficient. As a bonus, here is how you do it in four different languages.

## PHP ##

My original version was written in PHP, so let's start with that.

~~~~ php
function normalize($html, $limit = 2) {
    $levels = range(1, 6);
    $diff = 0;

    foreach ($levels as $level) {
        if (strpos($html, '<h' . $level) !== false) {
            $diff = $limit - $level;
            break;
        }
    }

    if ($diff == 0 || !in_array($limit, $levels)) {
        return $html;
    }

    return preg_replace_callback('/(<\/?)h(\d)/', function($matches) use ($levels, $diff) {
        $level = intval($matches[2]) + $diff;
        return $matches[1] . (in_array($level, $levels) ? 'h' . $level : 'p');
    }, $html);
}
~~~~

## JavaScript ##

The JavaScript version is a little more verbose. If you are using [jQuery](http://jquery.com/) or you can safely use [ES6](https://github.com/lukehoban/es6features) syntax, you can probably make this a lot shorter and neater, but this should work with any old JavaScript engine.

~~~~ javascript
var normalize = function(html, limit) {
    var levels = [];
    var diff = 0;

    if (typeof limit === 'undefined') {
        limit = 2;
    }

    while (levels.length < 6) {
        levels.push(levels.length > 0 ? levels.length + 1 : 1);
    }

    (function() {
        for (var i = 0, len = levels.length; i < len; i++) {
            if (html.indexOf('<h' + levels[i]) !== -1) {
                diff = limit - levels[i];
                break;
            }
        }
    })();

    if (diff === 0 || levels.indexOf(limit) === -1) {
        return html;
    }

    return html.replace(/(\/?)h(\d)/g, function(m, p1, p2) {
        var level = parseInt(p2, 10) + diff;
        return p1 + (levels.indexOf(level) !== -1 ? 'h' + level : 'p');
    });
};
~~~~

I have got into the habit of surrounding `for` loops in [IIFEs](https://en.wikipedia.org/wiki/Immediately-invoked_function_expression) to control the scope of variables such as `i`, but you can usually get away without it.

## Python ##

In Python, you will need the `re` module for regular expression support. This version works fine in Python 2 and 3.

~~~~ python
def normalize(html, limit=2):
    levels = list(range(1, 7))
    diff = next((limit - n for n in levels if '<h' + str(n) in html), 0)

    if diff == 0 or limit not in levels:
        return html

    def callback(match):
        n = int(match.group(2)) + diff
        return match.group(1) + ('h' + str(n) if n in levels else 'p')

    return re.sub(r'(</?)h(\d)', callback, html)
~~~~

The built-in `next()` function makes it easy to find the top-level heading in the content without using a `for` loop.

## Ruby ##

Like everything in Ruby, there are lots of ways of writing this. However, this version has the advantage of passing [Rubocop's various syntax checks](https://github.com/bbatsov/rubocop) without too many complaints.

~~~~ ruby
def normalize(html, limit = 2)
  levels = (1..6)
  diff = limit - levels.detect(-> { limit }) { |n| html.match("<h#{n}") }

  return html if diff == 0 || !levels.include?(limit)

  html.gsub(%r{(</?)h(\d)}) do
    level = Regexp.last_match(2).to_i + diff
    Regexp.last_match(1) + (levels.include?(level) ? "h#{level}" : 'p')
  end
end
~~~~

The `detect` method works a little like Python's `next()` function.

So there you go. The same function in four different languages and in far fewer lines than the original PHP class.
