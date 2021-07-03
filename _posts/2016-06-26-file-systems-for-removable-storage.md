---
title: File systems for removable storage
categories: [Uncategorized]
tags: [Linux]
excerpt: I recently wanted to reformat a memory stick so I could move a big file between two computers. It should have been easy, but instead it sent me down a rabbit hole of options for file systems. Here is what I found.
---

I recently wanted to reformat a memory stick so I could move a big file between two computers. It should have been easy, but instead it sent me down a rabbit hole of options for file systems. So, in case anyone else wants some objective facts and subjective opinions on what file system to use for their removable storage, here is what I found.

*   Your first, oldest, and most obvious option is __FAT32__. In fact, it's probably already formatted as FAT32. And there are several reasons why that might be a good thing. It's entirely free, in the sense that it is unencumbered by patents, and that means it's supported by every operating system under the sun. It's also fast, because it's incredibly simple. Unfortunately, it was also designed at a time when storage was measured in megabytes and so its maximum file size is just 4&nbsp;GB. My file was bigger. I needed to think again.

*   __NTFS__ is the native file system for all versions of Windows since NT. It can handle large volumes and large files, but it's proprietary and so it isn't easy to use on other operating systems. Mac support is read-only. I use a Mac. So that's no good.

*   The native Mac file system is __HFS+__, which also supports large volumes and files. However, not only is it proprietary, its cross-platform support is even worse than NTFS. I also use Linux, so that's just not going to work.

*   If you use Linux or Android, you are almost certainly using the __ext4__ file system. It is free, open source, and supported natively by the Linux kernel. Perfect, right? The problem is that Windows and Mac pretend that it doesn't exist. You can install software on both to add support on [Mac](http://brewformulas.org/osxfuse) or [Windows](http://www.ext2fsd.com/), but it's not very friendly if you want to give your memory stick to a friend who doesn't care about Linux, file systems, software patents, or anything else in this post.

*   My search for a standard, free, open source file system led me to __UDF__, which seemed at first to meet all my criteria. Being the file system of choice for optical media, such as DVDs, means that it is fully supported across all the major operating systems. However, the problem is that nobody expects you to use it for anything other than optical media. It's not an option in any of the simple, GUI formatting tools and formatting it manually requires an understanding of block sizes and other technical details that, to be honest, I am not at all interested in. I just want a disk that works. UDF looks good in principle, but hard to achieve in practice.

*   There are other open source file systems, such as __ZFS__ or __btrfs__, but their operating system support is so limited they weren't worth considering.

*   Finally, there is __exFAT__. I knew this as a proprietary file system developed by Microsoft, so I wasn't optimistic about it. It has all the right features for a removable disk: simple, fast, and with support for very large files. It also has pretty good operating system support: out of the box on Mac and Windows and via the open source FUSE project on Linux. But still: Microsoft? Proprietary? It seems just slightly evil.

So what did I pick? In the end, I went with __exFAT__. Despite its origins and its license, it is actually very widely supported. You can be confident that you can put files on an exFAT disk and that anyone will be able to read them without installing any special software. And that was what mattered most.
