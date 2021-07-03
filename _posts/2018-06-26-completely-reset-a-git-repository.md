---
title: Completely reset a Git repository
---

If you have added files to a Git repository since your last commit and you want to completely reset the repository to that last commit, you need to run `reset` and `clean`.

    git reset --hard
    git clean -df

The first command undoes changes; the second removes untracked directories (`-d`) and files (`-f`). This should reset the entire repository to its last commit.
