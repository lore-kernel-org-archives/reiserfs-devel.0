From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck 3.6.8 + corrupted filesystem
Date: Sat, 5 Jul 2003 16:04:34 +0400
Message-ID: <20030705120434.GA11009@namesys.com>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <200307031516.44549.vitaly@namesys.com> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org> <200307032210.03901.vitaly@namesys.com> <pan.2003.07.03.17.18.22.88001.5077@umail.hungrycats.org> <pan.2003.07.03.17.18.22.88001.5077@umail.hungrycats.org> <20030704054005.GB6309@namesys.com> <E19YVuZ-0003nh-00@satsuki.furryterror.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <E19YVuZ-0003nh-00@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <zblaxell@umail.hungrycats.org>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Jul 04, 2003 at 03:07:59PM -0400, Zygo Blaxell wrote:
> >> Also, the successive runs of reiserfsck (two more since I posted my
> >> original message) are producing lower and lower pass0 stats, and
> >> getting further through pass1, about 3000 blocks at a time.  Each run
> >> takes about 20 hours before it dies (normally reiserfscks on this size
> >> of filesystem take 3-4 days).
> > Wow. Do you have large number of files there?
> Millions.  Small ones too.

Ah.

> > Want to try our new
> > version that considerably speeds-up this case? ;)
> Do I!
> I've got lots of these filesystems, and half of them are redundant
> because any tiny system failure takes half a week to fix ;-)...

Ok.
I've put the current code at
ftp://ftp.namesys.com/pub/tmp/reiserfsprogs-new.tar.gz

It is supposed to become 3.6.9 after one minor feature addition (non fs related)

If you try it, let us know of the result.

> >> That command will take a while...based on the current rate, it will
> >> finish sometime in the morning on Tuesday, or maybe Monday night.
> > 
> > Hm. Is there a possibility to aattache the drive to some faster
> > interface?
> This filesystem is an array of disks spread over 6 IDE interfaces.  The
> I/O rates are >25mb/sec on each.  I don't think the disks physically go
> any faster.
> You might be confusing this with another one of my filesystems I've posted
> about recently (the USB/firewire device), which has only a few thousand
> files and can completely reiserfsck in about 70 minutes.

Yes, I am confusing this system with USB/firewire one you mentioned recently.

Thank you.

Bye,
    Oleg
