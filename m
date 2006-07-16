From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Sun, 16 Jul 2006 11:14:44 -0700
Message-ID: <44BA8214.7040005@namesys.com>
References: <6xQ4C-6NB-43@gated-at.bofh.it> <6xQea-6ZX-13@gated-at.bofh.it> <E1G1QFx-0001IO-K6@be1.lrz> <44B7D97B.20708@suse.com> <44B9E6D5.2040704@namesys.com> <44BA61A2.5090404@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29016-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44BA61A2.5090404@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeffrey Mahoney <jeffm@suse.com>
Cc: 7eggert@gmx.de, Eric Dumazet <dada1@cosmosbay.com>, ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

This sounds like it should be fixed in the driver, not in reiserfs.  It
sounds like the driver is violating Posix naming, and should be fixed to
conform to it.  Have the driver create an fs mountpoint, and then have
the driver handle the number.  I really don't get why reiserfs has any
role in this problem.  Regarding "a separate name space that doesn't
follow the same rules
as the standard file system name space.", linux does not need those to
be created, but what I don't understand is exactly in what respect the
driver namespace does not conform.  It has components separated by
slashes.  Is this related to the difference between BSD's namei and
Linux's?  BSD is the one getting it right.....

Hans

Jeffrey Mahoney wrote:

> Hans Reiser wrote:
>
> >So the Plan 9 and Unix way would be to let the driver parse the number
> >part of the name after the last slash.  What I don't understand is why
> >reiserfs is getting involved here, rather than recognizing the driver as
> >an extension of the namespace, seeing the driver as a mountpoint, and
> >just passing number to the driver.  There must be something I don't
> >grasp here, can you help me?
>
>
> The name used in procfs isn't parsed anywhere, it could just as easily
> be fs0, fs1, fs2, etc, but that wouldn't be a very user friendly way of
> indicating which file system's statistics are described in that
> directory. It's just presented to the user as a pathname to identify a
> particular file system. The problem is that reiserfs is attempting to
> use a name from a separate name space that doesn't follow the same rules
> as the standard file system name space. Block device names, initially,
> weren't intended for use as self-contained path components and aren't
> part of the file system name space. If we wish to use those names, we
> need to sanitize them to conform to the rules of the file system name
> space by removing/replacing the path separator character.
>
> It's unfortunate that some drivers use a slash rather than sticking with
> the <type><letter> convention. I don't expect new drivers to be added
> with slashes in them. If at some point the existing drivers are changed
> to remove the slash, then this patch can be removed again.
>
>
> -Jeff

