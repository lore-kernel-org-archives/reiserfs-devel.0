From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Repacker for reiser4?
Date: Sun, 12 Sep 2004 18:15:37 +0300
Message-ID: <20040912151537.GE26192@nysv.org>
References: <4144674B.5070705@willsmith.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21705-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4144674B.5070705@willsmith.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Smith <will@willsmith.org>
Cc: reiserfs-list@namesys.com

On Sun, Sep 12, 2004 at 11:12:11PM +0800, Will Smith wrote:
>Is the repacker available for reiser4?  I can see code in

Yes, but I've heard mixed reports.

>the kernel but no userspace tool.  The FAQ says 'not implemented'

mjt@shrike:/usr/src/linux-2.6.8.1-cko6$ ls /sys/fs/reiser4/hda2/repacker/
chunk_size  count  direction  start  start_key

it works with echo 1 > /sys/fs/reiser4/hda2/repacker/start afaik, but
I haven't tried it myself yet, as my backups are a bit out of date.

>The repacker should benchmark the disk surface and work out
>which areas are fastest (bandwidth and/or track->track seek).
>Then this could be combined with a usage count on each file
>to gradually move the more-accessed data to faster areas
>of the disk.

I also talked (months ago) with the Namesys guys about having a profiler
like that. But I just had the assumption that the beginning of the disk
is fastest, not accounting for the (very cool!) LVM aspect.

I dunno if it's ever coming, they didn't have time back then.
Maybe if we gave Namesys enough money :)

-- 
mjt

