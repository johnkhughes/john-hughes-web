---
title: Remove WordPress parent theme templates
---

WordPress lets you extend themes by creating "child" themes. If the parent theme includes templates that you do not want to appear in your child theme, you can use a filter to remove them.

~~~ php
add_filter('theme_page_templates', function ($templates) {
    unset($templates['template-foo.php']);
    unset($templates['template-bar.php']);

    return $templates;
});
~~~

This gives you much more control over which parent theme features you need to support in your child theme.
