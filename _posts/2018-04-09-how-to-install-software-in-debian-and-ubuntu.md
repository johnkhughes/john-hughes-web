---
title: How to install software in Debian and Ubuntu
---

There are lots of different ways of installing software on Debian and Ubuntu. Here is a quick overview of the most common methods of adding software packages to Debian-based Linux distributions and when you might want to use them.

## Graphical tools

If you have a desktop environment with a graphical package manager, such as [Gnome Software](https://wiki.gnome.org/Apps/Software), you may be able to find and install the software you need with a few clicks. This is often the easiest way to install something, but it will only work with a desktop environment and you are generally restricted to your distribution's default repositories.

## apt-get

If you need---or want---to work in the terminal, you can use `apt-get` to install any of the packages from your distribution's default software repositories. Before you install anything, you should first make sure that the packages that are already installed are up-to-date:

    sudo apt-get update
    sudo apt-get dist-upgrade

It is then safe to install the package:

    sudo apt-get install foo

This is often the easiest and safest way to install software on a Debian-based system. By using packages provided by your distribution, you can be confident that they will be secure, free of bugs, and compatible with the other software on your system.

Some software vendors provide their own repositories that you can add to your system, making it easier to install and update packages from outside your distribution. Each one is slightly different, however, so you are best reading the instructions for the individual repositories if and when you need them.

## dpkg

If the package is not provided directly by your distribution, you may still be able to download a `.deb` package from the software vendor. If this is the case, you can install the package with `dpkg`:

    sudo dpkg -i foo.deb

This is also pretty easy and means you can install software from outside the standard repositories. It also means you can use `dpkg` to remove the package cleanly later on. Just be aware that it is up to you to manage dependencies, compatibility with the other software on your system, and updates.

## Binary packages

Software that is not specifically packaged for Debian may still be available as a pre-compiled Linux binary package. In this case, installation involves a little more work. After downloading and extracting the package, you need to copy all its files to the `/opt` directory, where they will be available to all users and will not interfere with the software on the system that is managed by your package manager:

    sudo cp -r ~/foo-package /opt/foo-package

If the package provides binaries that need to be available in your `$PATH`, you should symlink these to `/usr/local/bin`:

    sudo ln -s /opt/foo-package/bin/foo /usr/local/bin/foo

If you are using a desktop, you might also want to add an entry in your desktop's menu or application list. You can so this by creating a file such as `/usr/share/applications/foo.desktop` with the following content:

    [Desktop Entry]
    Name=Foo
    Comment=Example package
    Exec=/opt/foo-package/bin/foo
    Terminal=false
    Type=Application
    Icon=/opt/foo-package/foo-icon.png

Installing a generic binary package involves a bit more effort than the other methods mentioned so far and still leaves you with the problems of dependencies, compatibility, and updates. However, it may be your only option if the vendor does not explicitly support Debian and the source code is not available.

## Source packages

Most open source projects provide the source code for their software in a convenient package, allowing you to compile and install it on your machine. The first step is to download and extract the source code. Then you need to navigate to the source directory in the terminal and run:

    ./configure
    make

At this point, you would normally run `sudo make install` to install the compiled package. However, Debian provides a utility called [checkinstall](/2016/06/create-linux-packages-from-source-with-checkinstall/), which installs the software as if it were a `.deb` package:

    sudo checkinstall

This makes it easier to view, change, or remove the package later using `dpkg` or `apt-get`.

Installation from source can be slow and might cause a few headaches if you need to install multiple dependencies to compile the software in the first place. However, if you simply cannot get hold of a suitable binary package, it might be your only option.

## Snaps

The newest method of installing software on Linux is to use [snap packages](https://snapcraft.io/). These are entirely self-contained software packages that include all their dependencies, potentially allowing them to run on any Linux system without conflicts with other software. You can run the `snap` tool from the terminal to install packages:

    sudo snap install foo

Because snaps are relatively new, you might not always be able to find the package you want. You should also be aware that snap packages are often larger than their `.deb` counterparts because they come bundled with all their dependencies. However, snaps should be pretty robust and are a good choice for third-party software that you want to keep isolated from your core system.

## Conclusion

The quickest and easiest method of installing something on Debian or Ubuntu is to use a graphical or terminal package manager to install a package from the distribution's own repositories. You can be very confident that what you get will be compatible, secure, and stable. If that's not an option, you might have to do some work yourself to make sure what you install is going to run on your system. Snap packages, however, have the potential to solve the compatibility and security problems of third-party software and are definitely worth a look before you start compiling packages yourself.
