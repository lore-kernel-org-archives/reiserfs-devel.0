From: Oleg Drokin <green@namesys.com>
Subject: Re: Permission Denied errors in ReiserFS
Date: Tue, 23 Apr 2002 10:51:32 +0400
Message-ID: <20020423105132.C2930@namesys.com>
References: <20020422084257.GC25655@flex.com.au> <20020422124902.A8689@namesys.com> <20020422160215.GB27862@flex.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10141-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020422160215.GB27862@flex.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Khoury <dave@hal.flex.com.au>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Apr 23, 2002 at 02:02:15AM +1000, David Khoury wrote:
>  Run reiserfsck --fix-fixable on your ReiserFS partition.  Make sure you're
>  using at least verion 3.x.1c-pre2 of the reiserfsprogs.  You'll have to boot

No! In fact there is a reason we have pre versions separate from releases.
Latest pre version should only be used if latest release does not work.
Some prior consulting in this list might help, too.

>  from a floppy or cdrom, if your ReiserFS partiton is the root partition.
>  Remounting the root filesystem as 'ro' isn't enough.
>  (this is obvious to me now, when I consider metadata cacheing.  It's a
>  bummer, because it would have been wonderful to do an fsck on a 'ro' mounted
>  filesystem).

New pivot_root stuff in should cure that. Because you can actually unmount
root. (or should be able to do it, anyway).

Bye,
    Oleg
