---
title: Ignore committed files in Git
---

You can prevent files from being added to a Git repository by adding them to a `.gitignore` file. However, if a file was previously committed to the repository and you want to remove it and ignore it from now on, you need to perform an additional step.

First, update the `.gitignore` file to ignore the file in future:

    foo.txt

Then remove it from the repository:

    git rm --cached foo.txt

The local file will be unchanged, but Git will consider it to have been deleted and will ignore it when adding and committing files in future.
