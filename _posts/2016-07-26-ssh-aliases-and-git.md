---
title: SSH aliases and Git
categories: [Code]
tags: [Git, SSH]
excerpt: If you use SSH from the command line, you can use aliases to avoid having to remember usernames, domains, and IP addresses. You can also use those aliases with anything else that communicates via SSH, including Git.
---

If you use SSH from the command line, you will be used to typing something like this into the terminal:

    ssh john@example.com

You are probably also aware of the `~/.ssh` directory where all your private keys live. But did you also know that you can save aliases for servers in the same directory so you don't have to remember usernames, domains, or IP addresses when you log in? First you need to create a file called `~/.ssh/config`. Then you can enter the details for each server:

    Host foo
    HostName example.com
    User john

    Host bar
    HostName 192.168.1.1
    Port 22000
    User john
    IdentityFile ~/.ssh/bar_rsa

Then you can log in using the alias:

    ssh foo

But wait. There's more. If you use Git, you can create aliases for your Git SSH accounts and use them when setting up remotes.

    Host github
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_rsa

And where you would have used:

    git remote add origin git@github.com:foo/bar.git

You can now use the easier to remember:

    git remote add origin github:foo/bar.git

In fact, you can use these aliases with anything that sends data via SSH, including scp and rsync. Think of all the time you can save now you never have to remember another domain or IP address again.
