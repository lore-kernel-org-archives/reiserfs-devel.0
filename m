From: Pavel Machek <pavel@ucw.cz>
Subject: Re: file as a directory
Date: Fri, 26 Nov 2004 00:09:37 +0100
Message-ID: <20041125230937.GA2909@elf.ucw.cz>
References: <2c59f00304112205546349e88e@mail.gmail.com> <41A1FFFC.70507@hist.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22579-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41A1FFFC.70507@hist.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Hafting <helge.hafting@hist.no>
Cc: Amit Gud <amitgud1@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hi!

> Such support may happen for a few fs'es - people who
> want this will then use those fses.  Those who don't
> like the ideas will use others.
> 
> >(.tar, .tar.gz, ...) support in the VFS itself, and of course
> >transparent to any fs and any user-land application. There are many
> >archive FSs around, but how feasible would it be to implement the
> >archive file support in the VFS at dentry-level? I'd be happy to share
> >my proposal.
> >
> > 
> >
> You won't get .tar or .tar.gz support in the VFS, for a few simple reasons:
> 1. .tar and .tar.gz are complicated formats, and are therefore better
>   left to userland.  You can get some of the same effect by using a shared
>   library that redefines fopen() and fread() though.  It'll work fine for
>   the vast majority of apps that happens to use the C library.

It is not same effect -- with shared library you get no caching. And
that hurts a lot.

>   It is hard to make a guaranteed bug-free decompressor that
>   is efficient and works with a finite amount of memory.  The kernel
>   needs all that - userland doesn't.

If you have bug in decompressor, you are screwed, anyway, because you
get remote user exploit when mozilla gets the file from
web. Oops. [Ok, you at least do not get remote root exploit, but...]

								Pavel 
-- 
People were complaining that M$ turns users into beta-testers...
...jr ghea gurz vagb qrirybcref, naq gurl frrz gb yvxr vg gung jnl!
