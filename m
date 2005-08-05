From: David Masover <ninja@slaphack.com>
Subject: Re: recovering from "rm -rf"
Date: Fri, 05 Aug 2005 16:17:20 -0500
Message-ID: <42F3D760.7090008@slaphack.com>
References: <42F3A08A.30102@planet.nl> <42F3A16D.6090306@namesys.com>	 <42F3C73B.9040808@slaphack.com> <b14e81f0050805135739c94933@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25311-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050805135739c94933@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: reiserfs-list@namesys.com

michael chang wrote:
> On 8/5/05, David Masover <ninja@slaphack.com> wrote:
> 
>>I've got a Reiser4 partition which I just moved (mv) a bunch of stuff
>>off of, onto another drive.  The other drive died immediately after.
>>
>>I'm trying to repair the other drive, and to find any backups, but is
>>there a reasonable chance to recover from the good drive?  Maybe force
>>fsck.reiser4 to rebuild stuff... somehow?  It's sort of the equivalent
>>of an "rm -rf".
> 
> 
> I have no idea what you're trying to say; can you identify your drives
> by e.g. Drive A and Drive B?  However, I've heard that Spinrite
> (grc.com) is known to be pretty good at drive recovery, and supposedly
> compatable with Linux partitions.  Requires an i386 compatable
> machine, and I believe you need Windows to write the diskette/iso
> which you can boot the recovery system from.  Haven't tried it though.

I could do that, but this is Reiser4.  Does anyone but Namesys support
recovery from Reiser4 yet?

> What are you trying to do?  Format a broken hard drive so you can
> write to it again, or recover data you deleted unintentionally?  A

Sort of both.

Drive A is a 500 gig striped RAID.  Drive B is a 200 gig IDE drive.  I
mv'ed all my data (about 100 gigs) from drive A to drive B.  Drive B
then had its power plug fall out (don't ask me how I managed that), I
plugged it back in (stupid!) -- there was a spark -- drive B now won't
spin up, and drive A is essentially "rm -rf"ed.

Drive C is an 80 gig drive with a good, working install of Linux on it.
 I can throw a fully working Gentoo Linux system, and any recovery tools
I can get for it, at Drive A.

If I can't recover the data from Drive A, I will send Drive B to some
recovery experts.  If I can recover the data from Drive A, I will throw
out Drive B and buy a replacement.

> anyways, so you shouldn't use it).  For all you know, the drive could
> have died because the internals wore out/broke, or because your cable
> died/broke/etc.

I'm guessing that the internals did break, so I think that a recovery
service would probably be able to recover 100% of my data (as an image),
but only after replacing some parts, or even pulling the whole thing
apart in a cleanroom.  This would cost at least $300-500, and if it goes
to the cleanroom, probably $700 and up.

By the way, do you know any good data recovery services?
