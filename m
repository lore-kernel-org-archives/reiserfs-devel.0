From: Oleg Drokin <green@namesys.com>
Subject: Re: Unicode policy
Date: Thu, 1 May 2003 19:48:19 +0400
Message-ID: <20030501154819.GA15670@namesys.com>
References: <200305011538.h41FcFn01653@linux1.futureware.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13912-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200305011538.h41FcFn01653@linux1.futureware.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp G?hring <p.guehring@futureware.at>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, May 01, 2003 at 05:38:04PM +0200, Philipp G?hring wrote:

> I have some question regarding the Unicode policy of filenames in filesystem, 
> especially ReiserFS. 
> Are filenames stored in UTF-8?

No. filenames are stored "as is". If you write those as unicode, you get unicode.

There are several restrictions on filenames in Unix/Linux:
You cannot use 0-byte and '/'-byte as part of filename.

> Should they be stored in UTF-8?

You decide how do you want to store your filenames.

> Is it a question of the filesystem?

Some filesystems do it, but I doubt FS should do it.

> Is it the applications job to interpret it?

It is debatable. Kernel/VFS/some library might do this as well.

> Or is the filesystem encoding independent?

Some filesystems are encoding-dependent and some are not (because they do not know anything about encoding at all).

> Are there migration plans to Unicode?

Migration of what? Migration of reiserfs to unicode is not planned.
Same for reiser4. You can write whatever plugin to store filenames in any way
you might imagine in reiser4.

Bye,
    Oleg
