---
title: Easy label definitions for WordPress custom post types and taxonomies
excerpt: When you define a new custom post type or taxonomy in WordPress, you need to set labels for all the different buttons and links in the interface. This is usually a tedious process of writing each label individually. Here is a function to make the process quick and easy instead.
---

When you define a new custom post type or taxonomy in WordPress, you need to set labels for all the different buttons and links in the interface. This is usually a tedious process of writing each label individually:

~~~ php
<?php

register_post_type('book', [
    'labels' => [
        'name' => 'Books',
        'singular_name' => 'Book',
        'add_new_item' => 'Add New Book',
        // ...
    ],
    // ...
]);
~~~

So here is a function that generate all the necessary labels, based on the singular and plural names of the post type or taxonomy:

~~~ php
<?php

function post_type_labels($single, $plural = null)
{
    if (is_null($plural)) {
        $plural = $single . 's';
    }

    return [
        'name' => $plural,
        'singular_name' => $single,
        'add_new' => 'Add New',
        'add_new_item' => 'Add New ' . $single,
        'add_or_remove_items' => 'Add or remove ' . $plural,
        'all_items' => 'All ' . $plural,
        'archives' => $single . ' Archives',
        'attributes' => $single . ' Attributes',
        'choose_from_most_used' => 'Choose from the most used ' . $plural,
        'edit_item' => 'Edit ' . $single,
        'insert_into_item' => 'Insert into ' . $single,
        'menu_name' => $plural,
        'new_item' => 'New ' . $single,
        'new_item_name' => 'New ' . $single . ' Name',
        'not_found' => 'No ' . $plural . ' found',
        'not_found_in_trash' => 'No ' . $plural . ' found in Trash',
        'parent_item' => 'Parent ' . $single,
        'parent_item_colon' => 'Parent ' . $single . ':',
        'popular_items' => 'Popular ' . $plural,
        'search_items' => 'Search ' . $plural,
        'separate_items_with_commas' => 'Separate ' . $plural . ' with commas',
        'update_item' => 'Update ' . $single,
        'uploaded_to_this_item' => 'Uploaded to this ' . $single,
        'view_item' => 'View ' . $single,
        'view_items' => 'View ' . $plural,
    ];
}
~~~

You can omit the plural version of the name and the function will create a plural form by appending an "s" to the singular form of the name. Now you can define post type and taxonomy labels with a single line:

~~~ php
<?php

register_post_type('book', [
    'labels' => post_type_labels('Book'),
    // ...
]);

register_taxonomy('book-category', 'book', [
    'labels' => post_type_labels('Book Category', 'Book Categories'),
    // ...
]);
~~~

Much less effort!
