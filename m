From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Trying to mount ReiserFS file system read only results in change
Date: Mon, 19 Dec 2005 18:57:47 +0300
Message-ID: <43A6D87B.3090003@namesys.com>
References: <20051219142410.65007.qmail@web34613.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27442-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051219142410.65007.qmail@web34613.mail.mud.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Tard <linuxtard@yahoo.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Hello

Linux Tard wrote:
> Hi Vladimir,
> 
> Thank you for reply.  Unfortunately in our testing the
> journal count always is incremented (or we think that
> is the change on the file system).  When we mount any
> ReiserFS file system read only (ro) without
> journalling (nolog) options and then unmount it, the
> md5 value after unmount does not match the md5 value
> before mount.  According to man page for mount the
> 'nolog' option is a work in progress, so we don't know
> if this is why the count is still incremented or not?
> 
> We do know if we change that code in journal.c and
> compile our kernel, the count is not incremented and
> pre and post mounting authentication values are
> equivalent.  We're trying to found out A) what is
> being changed when mounted read only

reiserfs has to replay journal before it can access any data. Even if it is
mounting readonly. Journal replay code does not distinguish whether filesystem
is being mounted read-only or not. So, it just replays journal and updates few
counters. If filesystem was umounted clean - no transactions are replayed, but
counters still get updated.

> and B) why it's
> being changed 

There were no reasons to distinguish cases of clean shutdown and unclean one.
Journal replay code does the same regardless to what happened with filesystem
before and to how it is being mounted.

> and ultimately C) is there something
> else besides changing source code to stop this?
> 
Please send your patch so that we could see first what you have done already.
