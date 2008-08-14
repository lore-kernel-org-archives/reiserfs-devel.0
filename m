From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: files as directorys
Date: Fri, 15 Aug 2008 01:18:37 +0400
Message-ID: <48A4A12D.5030704@gmail.com>
References: <200808141747.48141.sascha_lucas@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200808141747.48141.sascha_lucas@web.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sascha Lucas <sascha_lucas@web.de>
Cc: reiserfs-devel@vger.kernel.org

Sascha Lucas wrote:
> Hi list,
>
> I like to try the "files as directorys" plugin.

It is not a plugin ;)
It is a set of concepts with similar semantics.

One of them is so-called "pseudo-files" (or "metas"), a reiser4
extension that allows to access attributes of any regular file
foo via the following construction : foo/..../bar (and, yes,
chdir to foo/.... is possible).
Unfortunately, this is deprecated because it allows to create
incorrect constructions using hard links functionality. AFAIK,
the problem is not yet resolved.

There is a patch for pseudo-files extension against ~2.6.14

>  Please tell me first if I 
> understand it right, what this can do:
>
> An often made example is /etc/passwd. If used with the "files as directorys"

This is another concept which allows to aggregate various
records in a handy manner as "subfiles" of a regular file.
I even know that Hans discussed with R.M. Stallman, which
found this possibility useful. Linus also likes this idea. There
is a special technical thread in lkml devoted to this functionality
opened by Al Viro:
http://readlist.com/lists/vger.kernel.org/linux-kernel/7/39039.html

> plugin then passwd is a directory and a file at the same time. You can chdir 
> into passwd and have i.e. each line in a separate file. Legacy apps can still 
> open passwd like a file as "normal"/before.
>   

Yes, but this concept has not been worked out in details.
I remember there were two approaches for the implementation:

1) as a directory, so that every record has a directory entry nature;
2) as a "symfile", so that every record has a symlink nature.

> And now the question, why I can't verify this myself:
>
> $ /sbin/mkfs.reiser4 -o create=dir40 reiser4.img
> /sbin/mkfs.reiser4 1.0.6
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by 
> reiser4progs/COPYING.
>
> Overriding the plugin profile by "create=dir40".
> Error: Can't override profile slot "create" by the found plugin "dir40": a 
> plugin of the same type but of another group is found.
>
> Any hints for me what I'm doing wrong?

"create" is a directory attribute (actually regular files also have it,
but it makes sense for directory only). So this attribute specifies a
plugin to manage _regular_ files created in the directory (the name
"create" was chosen in conformity with the system call creat (2)).

dir40 is a plugin, which manages directories, not a regular files.
This explains mkfs complaints.

Currently there are two plugins to manage regular files in reiser4:
1) unix-file plugin (reg40, default value)
2) cryptcompress plugin  (ccreg40) .

Edward.

>  Distro is gentoo with: 
>  - gentoo-sources-2.6.25 and reiser4-patch from kernel.org/edward
>  - reiser4progs-1.0.6-r1 from gentoo-portage
>
> TIA Sascha.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

