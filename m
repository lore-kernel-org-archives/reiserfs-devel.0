From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Thu, 26 Jun 2003 10:35:09 +0400
Message-ID: <20030626063509.GB11176@namesys.com>
References: <3EF6C83F.6060702@namesys.com> <3EF702CC.9050005@g-house.de> <20030624131904.GA460@namesys.com> <3EF86928.7080504@g-house.de> <20030624151940.GC21845@namesys.com> <3EF888B2.4000900@g-house.de> <3EF8EFF0.6020207@g-house.de> <20030625054031.GA11576@namesys.com> <3EF9A0F6.4030401@g-house.de> <3EF9E939.1050501@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EF9E939.1050501@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Wed, Jun 25, 2003 at 08:26:01PM +0200, Christian Kujau wrote:

> i really don't know why this alpha has these odd problems. remember the 
> strange "bread error" i got with 2.4? today, under 2.5.72 i noticed for 
> the first time an scsi-error in my logfile while "mkreiserfs /dev/sdb2" 
> was about to finish. (scsi0: ERROR on channel 0, id 5, lun 0/sense key 
> Medium Error). can't it be an hw issue too?

Hm.

> so, after saying that i made another test. ok, perhaps is sde really 
> dying, but sdc is not, it's my rootfs :-)
> i created a 100MB image, mkreiserfs -f on it, mounted it and copied 
> files to it. a following "diff" gave no errors! fine, but "reiserfsck 

Sure, 100M perfectly fits into your RAM, so you just verified cached copies.
They are the same.

> test.img" (after unmounting) presented the very known errors again. i 
> did not use --fix-fixable but mounted the test.img again, now "diff -r" 
> showed differences where none should be :-(

Now you unmounted the thing and flushed the cache. Next attempt to
compare stuff lead to data being fetched off disk.
Hm.
Another datapoint to the picture.
Thank you.

Bye,
    Oleg
