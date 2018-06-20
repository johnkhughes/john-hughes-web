---
title: Hide the WordPress content editor with Advanced Custom Fields
excerpt: You can use Advanced Custom Fields to hide the main content editor in WordPress. However, this becomes unreliable when you have multiple custom field groups. Here is a more reliable method using a single, dedicated field group to hide the editor.
---

If you use [Advanced Custom Fields](https://www.advancedcustomfields.com/) for WordPress, you may already be aware that you can hide the main content editor. This is useful for templates where the main content is actually assembled from one or more custom fields. However, this only takes effect if it is set on the _first_ custom field group. If you define another custom field group later and it appears above the group that hides the content editor, the editor reappears. This is annoying.

To solve this problem, I have begun to define a separate field group with the sole purpose of hiding the main content and then placing it above all the other field groups:

~~~
<?php

acf_add_local_field_group([
    'location' => [
        [
            [
                'param' => 'page_template',
                'operator' => '==',
                'value' => 'foo.php',
            ],
        ],
    ],
    'menu_order' => -1,
    'style' => 'seamless',
    'hide_on_screen' => ['the_content'],
]);
~~~

Setting `menu_order` to `-1` ensures that the group always appears above any other field groups and setting `style` to `seamless` means that the empty group will not be visible to users editing the page. You can also add as many items to the `locations` array as you need, so you only need to define this one field group to hide the main content editor where ever you want on the site.
