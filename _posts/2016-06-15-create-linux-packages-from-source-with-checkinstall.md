---
title: Create Linux packages from source with CheckInstall
categories: [Code]
tags: [Linux]
excerpt: If you have Linux for a while, you might have tried installing something from source. However, removing it again can be a slow and tedious process. CheckInstall makes it easy to manage software installed from source by creating standard binary packages first.
---

If you have used Linux, or its cousin BSD, for a while, you might have tried installing something from source. It's pretty easy. Typically, you download a compressed archive, extract it, `cd` into the directory and type the following into your terminal:

    ./configure
    make
    sudo make install

And that's it: you've compiled some software from source and installed it on your computer. You're a proper Linux user now. The problem comes when you want to _remove_ it. Some packages will provide a convenient `make uninstall` command, but then again they might not and you could very well be stuck hunting down all the files yourself and removing them one by one.

But there is a better way. Instead of running `make install`, Debian-based distributions provide a little program called [CheckInstall](https://wiki.debian.org/CheckInstall), which assembles a `.deb` package from the source first and then installs it with the usual package management tools. Now our terminal input looks like this:

    ./configure
    make
    sudo checkinstall

The effect is the same: the software is installed. But now you can use your regular package management tools, such as `dpkg` or `apt`, to remove it again later:

    dpkg -r foo

Interestingly, CheckInstall can also produce `.rpm` packages, so this should work on Fedora-based distributions as well.
