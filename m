From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Thu, 19 Jun 2003 09:45:35 +0400
Message-ID: <20030619054535.GA23852@namesys.com>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EF0A8E8.2000209@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Wed, Jun 18, 2003 at 08:01:12PM +0200, Christian Kujau wrote:

> >Hm, interesting. Do you had crashes/unexpected shutdowns before 
> >corruptions appears
> >or are they appear without any reason at all?
> i had this issue once before -- did a check and noticed vpf-10680/some 
> corruptions. but these must have been from an crash.
> but now, i think as i rebooted the machine yesterday (because i upgraded 
> to kernel 2.5.72) the journal was checked (replayed?) anyway at boot:
> found reiserfs format "3.6" with standard journal
> Reiserfs journal params: device sde2, size 8192, journal first block 18, 
> max trans len 1024, max batch 900, max commit age 30, max trans age 30
> reiserfs: checking transaction log (sde2) for (sde2)
> Using r5 hash to sort names
> (from dmesg, booting process)

No, there is no sign of replaying journal.
If there was replay, you'd normally see "x transactions replayed in y seconds" message.

> and i thought the fs is "O.K." at least after boot, because ReiserFS 
> cares about consistency for itsself. if not, the corruptions are likely 
> from the unclean shutdowns. but that would mean, that i still have to 
> manually reiserfsck from time to time.

Well, normally reiserfs is caring about consistency.
There are two noticeable omissions, though:
1. if the unexpected shutdown was because of power loss and you have write cache enabled
   and your write reorders write requests, then it is possible invalid data gets
   written to disk, before "transaction is finished" mark is written to the drive.
   (there is a way to avoid this with some drives, by explicitly flushing
    drive cache in some cases, but this method seems to create some problems
    on itself. So this is not yet merged in any mainstream kernel).
2. there is no protection against kernel bugs.

1st usually leads to bitmap problems, but I also seen names pointing to nowhere.
Your corruption is somewhat strange by the fact the number of blocks
in statdata is ~ 2x bigger than it should be (on several files). Sounds like a pattern
to me.

> btw, is there a switch like "Maximum mount counft before doing the next 
> fsck while booting"?

No.

> >Well, I guess it's time to clear the dust off our alpha and do some 
> >testing.
> hehe, should it be architecture related?

This is also possible.

So can you say check/fix the fs, mount it write some files to it,
unmount it and run fsck again to see if everything is ok?

Thank you.

Bye,
    Oleg
