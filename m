From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 for windows
Date: Sat, 15 Jan 2005 18:39:27 -0800
Message-ID: <41E9D3DF.1060508@namesys.com>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41B287C6.2060902@namesys.com> <41B29491.20405@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23154-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41B29491.20405@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Job Bob <yzhang2004@yahoo.com>, reiserfs-list@namesys.com

David Masover wrote:

>
> Hans Reiser wrote:
> | I should add that reiser4 for windows would be proprietary.   If they
> | can pay MS, they can pay me, and I see no reason to do free work for MS.
>
> Don't think too highly of the Cygwin project, do you?  Oh, and it's
> almost impossible to get a laptop without paying MS, directly or
> indirectly.  No 

windows

> reiser4 for laptops, then.
>
> Also, is it a given that reiser4 for windows would work without help
> from MS?  I've just never seen a third-party filesystem driver for
> windows.  You'd think that at least one other filesystem, one of the
> Linux/BSD/etc ones, would have done this, if it was feasable.

I don't know, honestly.

>
> To start with, ntfs read access is still case insensitive, last I
> checked.  How deep does that go?

In reiser4, it is just a directory plugin.

> How many programs would be broken if
> it was changed?  How much point would there be if one could not access a
> unix-created reiser4 partition, or if unix reiser4.2 had to be case
> insensitive?  And let's not go into the file-as-directory stuff -- it's
> hard enough on unix.
>
> All this leaves me with the distinct impression that it'd be cheaper to
> buy some gigabit ethernet (or fibre) and a Linux CIFS/Samba fileserver
> using reiser4.  Steam and others refuse to install on network drives,
> Windows probably will not boot off a network drive, but I imagine that
> fixing these would be easier than porting a filesystem.
>
