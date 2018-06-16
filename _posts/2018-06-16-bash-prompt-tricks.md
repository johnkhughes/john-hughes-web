---
title: Bash prompt tricks
---

Did you know you can customize your Bash prompt? The possibilities are [endless](https://wiki.archlinux.org/index.php/Bash/Prompt_customization), but here are few simple tricks for displaying some more useful information in your terminal prompt.

## Basics

You can make changes to your Bash prompt by editing `~/.bashrc` and defining (or redefining) `PS1`. A typical prompt looks something like this:

~~~ bash
export PS1='\u@\h:\w \$ '
~~~

The escape sequences will be expanded to various strings containing information about your system and your terminal session. In this case, `\u` is the current user name, `\h` is the host name, and `\w` is the current directory:

    john@example:~/example $

Run `man bash` to see a full list of escape sequences.

## Exit status

Terminal commands return a status code on exit, which makes it easy to distinguish between successful commands, which return `0`, and errors, which return non-zero codes. Bash lets us embed commands in `PS1`, which means we can detect the status returned by the previous command change the prompt accordingly. For example:

~~~ bash
export PS1='\u@\h:\w$([[ $? != 0 ]] && echo " :(")\$ '
~~~

In this case, you will see a sad face in your prompt `:(` when a command exits with errors.

## Git branch and status

If you use Git for version control, you can also add the current branch name and status to your prompt, which can save you typing `git status` quite so often. Git even provides a function `__git_ps1` that we can drop into our prompt to save us writing any complicated code:

~~~ bash
export PS1='\u@\h:\w$(__git_ps1 " (%s)") \$ '
~~~

We can tweak how the information is displayed by defining some variables _before_ we define `PS1`:

~~~ bash
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="verbose"
~~~

This ensures that the full status of the repository is visible in the prompt whenever you are browsing a Git repository.

## Colour

You can also use colour to highlight different parts of your prompt. Colours are set with escape codes, which go before the text you want to change colour:

    \[\e[1;00m\] # default
    \[\e[0;30m\] # black
    \[\e[0;31m\] # red
    \[\e[0;32m\] # green
    \[\e[0;33m\] # yellow
    \[\e[0;34m\] # blue
    \[\e[0;35m\] # purple
    \[\e[0;36m\] # cyan
    \[\e[0;37m\] # white
    \[\e[1;30m\] # black bold
    \[\e[1;31m\] # red bold
    \[\e[1;32m\] # green bold
    \[\e[1;33m\] # yellow bold
    \[\e[1;34m\] # blue bold
    \[\e[1;35m\] # purple bold
    \[\e[1;36m\] # cyan bold
    \[\e[1;37m\] # white bold

For example, the following with highlight the user and host names in green, the current directory in blue, the Git repository status in purple, and exit status of the previous command in red:

~~~ bash
export PS1='\[\e[1;32m\]\u@\h\[\e[1;00m\]:\[\e[1;34m\]\w\[\e[1;35m\]$(__git_ps1 " (%s)")$([[ $? != 0 ]] && echo "\[\e[1;31m\] :(")\[\e[1;00m\] \$ '
~~~

The result should look something like this:

<pre><span style="color: green;">john@example</span>:<span style="color: blue;">~/example</span> <span style="color: purple;">(master)</span> <span style="color: red;">:(</span> $</pre>

## More?

These are just a few examples of Bash prompt customizations. You can combine escape sequences, colours, embedded commands, and any number of Unicode characters to achieve almost anything you can imagine in your terminal prompt. The Bash man page is a good place to start if want to explore further. For the impatient, there is also the [bashrc PS1 generator](http://bashrcgenerator.com/), which does all the hard work for you.
