From: Oleg Drokin <green@namesys.com>
Subject: Re: Permission Denied errors in ReiserFS
Date: Mon, 22 Apr 2002 12:49:02 +0400
Message-ID: <20020422124902.A8689@namesys.com>
References: <20020422084257.GC25655@flex.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020422084257.GC25655@flex.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Khoury <dave@hal.flex.com.au>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Apr 22, 2002 at 06:42:57PM +1000, David Khoury wrote:
>  reiserfsprogs 3.x.1b
>  Filesystem seems mounted read-only. Skipping journal replay..
>  Checking S+tree../ 15 (of 134)/130 (of 162)bit 807415840, bitsize 1026151
>  reiserfsck: bitmap.c:160: reiserfs_bitmap_test_bit: Assertion `bit_number <
>  bm->bm_bit_size' failed.
>  Aborted
>  ----------------

This bug is known already, and is fixed in 3.x.1c-pre2.
You can get it from ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.x.1c-pre2.tar.gz

Thanks for your report.

By the way, you won;t be able to do any recovery on mounted filesystem,
even on readonly mounted one.
You need to have some rescue media to boot from, and start reiserfsck from
there.


Bye,
    Oleg
