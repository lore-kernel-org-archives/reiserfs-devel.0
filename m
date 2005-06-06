From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 panicked cowardly: assertion failed: hint->blk < reiser4_block_count(super)
Date: Mon, 6 Jun 2005 12:55:22 +0400
Message-ID: <200506061255.22953.vitaly@namesys.com>
References: <20050605165029.386dc82e.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24319-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050605165029.386dc82e.reiser4@blinkenlights.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>

On Sunday 05 June 2005 18:50, Adrian Ulrich wrote:
> Hi,
> 
> Well, i managed to crash reiser4 ;-)
> 
> I created an iso-image on my reiser4 filesystem (it's my rootfs)
> using mkisofs. mkisofs aborted because the filesystem was full.
> After freeing up some space, i ran mkisofs again and: *bam*
> 
> fsck.reiser4 told me to run '--rebuild-sb' but looks like
> it didn't help:
>  The System still crashes while creating the ISO
>  (Should be 4.1 GiB, but crashes at ~ 3.7 GiB..)

what does 'fsck.reiser4 --check' say now running on this fs?
that no corruption found?

> # fsck.reiser4 --version
> fsck.reiser4 1.0.4
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed
> by  reiser4progs/COPYING. 
> 
> # uname -a
> Linux fuzzy 2.6.11.10 #1 SMP Sat May 21 13:17:21 CEST 2005 i686 unknown
> unknown GNU/Linux
> 
> * I attached the Syslog output
> * I rand 'debugfs.reiserf -P $device' and can
>   provide the output to namesys if they need it
>   (9.3 MiB)
> 

-- 
Thanks,
Vitaly Fertman
