From: "Adam Goryachev" <mailinglists@websitemanagers.com.au>
Subject: RE: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 10:11:16 +1100
Message-ID: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au>
References: <20030211144144.A5A9.MIKE@mystica.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12691-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030211144144.A5A9.MIKE@mystica.cx>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> I've used ReiserFS in the past, but have also used ext3 on my
> user's important
> data (/home) after a good chunk of one drive was converted to
> sparse/null files due to a screwup stemming from no 'badblocks' support
> in reiserfs.  Since then, i've used ext3 as well as Reiser but recently

I can't comment on your experience, but personally if I have a drive with
any number of badblocks (which are showing up to the fs layer, not invisibly
re-mapped by the drive) then I take the drive back and get a replacement, or
bin the drive.

> dropped reiser completely. The main reason I hadn't converted to ext3
> was a lack of a free harddrive 20+gb in size to copy all my files to.

I guess that is also a hardware issue, I had the same issue in trying to
convert from ext2 to reiser on a 80GB RAID5 partition...

> Unfortunately the filesystem was turning up errors all over the place,
> including random sparse files growing out of nowhere, (even my mail
> queue) and files that the filesystem could not access (even ls returned
> 'Permission Denied').  In the time since my first filesystem was nulled

I suppose that if you continue to have a growing number of FS errors, then
you either have faulty hardware, or are using a buggy version of
software.... If you already admit to badblocks, then I would blame
hardware..

> due to a reiserfsck, I hadn't fsck'd the main drive as I feared bad
> blocks may be to blame for the filesystem inconsistency. After 4 failed
> attempts (kernel panicks) to copy files between old and new drives, I
> finally decided to run an fsck.  After fscking with --rebuild-tree, it
> found many errors, and corrupt directory entries, and chucked about 150
> files into /lost+found/.  Most were from the mail server, owned by
> vpopmail.vchkpw, though others were from different websites I run and
> some were even from /dev/. But, none of the existing files were made
> sparse and I was able to completely copy the remaining files.

Hmmm, so apart from finding a number of errors and doing it's best to fix
them (putting them into lost+found) and recovering all of your other files
even with hardware issues present, you recovered all of your data? The
problem here is?

> After this I completely re-checked the drive with Maxtor's disk tools
> disk, and it showed that the drive was 'certified error-free'. After
> seeing this, I have come to respect reiserfs even less than after my
> /home/ drive got converted to nothing but nulls.

If a harddrive is showing badblocks and then the disk vendors tool shows no
errors, I think a simple dd over the whole disk or similar would really show
the true story....

> In my years of running ext2 and ext3, I can't see any reason why you
> would think they require fscks at every reboot. In the time that I've
> ran both ext2/ext3 and reiser, the only times ive had to fsck ext2 was
> after unclean unmounting. I've never had to run it on ext3. As for

Well, I had my share of ext2 doing an fsck after reboot, and it wasn't nice
on a 80GB partition... Sure, usually this is after a crash, which generally
is the *worst* time to have to run a fsck (ie, this just drags out the
unscheduled downtime).

> reiser, I've had to run it a few times, but each time it either
> destroyed data or fixed a very large number of errors that a journalled
> filesystem should not have.

I suppose your real issue is that you used faulty hardware. I wouldn't
expect any FS (journalling or otherwise) to be able to work faultlessly with
faulty hardware. Of course, depending on the faulty hardware, it would
probably affect different FS'es differently (depdning on where the faults
are on the disk and what data that FS tries to store on it).

> I guess my point is, If reiserfs can't keep consistency without
> requiring periodic fscks, you have no argument making a statement  that
> says ext2 is worse as it requires them every boot. Even if your
> statement was not false (I know for a fact that ext2 does -not- perform
> fscks on every boot, it only will do it after an unclean unmount), you
> still would have no basis to say that  ext2 is worse due to the
> requirement of periodic fscks.

ext2 requires periodic fsck's which are also rather dis-concerting when you
are never quite sure whether you need to allow a few hours downtime for a
kernel upgrade this time, or perhaps it is only a few minutes.

> In conclusion, I don't think i'll be using your filesystem even as a
> testbed for new features, due to poor reliability under everyday
> circumstances. In addition, check your facts before making a statement
> that insults someone and claims something that is completely untrue.

I wish you the best of luck with your chosen software and hardware, of
course, my experience is different, and the only place I use ext3 is when I
can't convert it, or I don't really care (ie, it's just the / fs or
something, not data/server that I care about). I haven't had any issues with
reiserfs for a long time...

Finally, I find it interesting to see people who swear they will never use
reiserfs again to be on the reiserfs mailing list :)

Regards,
Adam

