From: Greg Ward <gward@python.net>
Subject: Re: Safely spinning down SCSI ReiserFS disk
Date: Mon, 28 Apr 2003 20:33:41 -0400
Message-ID: <20030429003341.GA2203@cthulhu.gerg.ca>
References: <20030426211638.GA690@cthulhu.gerg.ca>
 <20030428053150.GA22902@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-13885-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20030428053150.GA22902@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 28 April 2003, Oleg Drokin said:
> By running /bin/sync you seem to access /bin/sync and force atime
> update on the /bin/sync

That's why I put the necessary binaries (including /bin/sync) on a
ramdisk, and chroot to the ramdisk to run the spindown script.  (I'm not
sure how to do this in the context of APM suspend; for now I'm just
trying to get a spindown/spinup cycle that doesn't crash my computer.)

I realized that I forgot to remount all filesystems readonly, so I'll be
sure to add that next time I give this a try.

> Why don't you just rely on apm --suspend thing that is supposed to spin-down
> everything by itself after OS is sleeping?

That would be nice, but this is a SCSI disk -- as I understand it (from
Googling several times over the past week or so -- this seems to come up
regularly on various lists), Linux does not spinup SCSI disks
automatically on access, and therefore never spins them down
automatically.

At least for my disk, this makes sense: it takes a good 10 sec to spin
the disk down, and roughly as long to spin it up again.  I sure wouldn't
want that to happen outside of my control!

The only way I have found to spin the disk down or up is the scsi-spin
utility, part of the scsitools package.  Obviously this goes on my
chroot ramdisk along with sync!

> Well, what's the BUG message? We cannot tell you what it means before you
> give us this information.

ARghh... I went to great lengths to save this dump to my IDE disk the
last time I experimented, but it seems to have disappeared.  I guess
sync didn't actually sync the IDE disk once the kernel was confused
about the SCSI disk.  (Insert wildy handy-waving speculative gestures
here.)  I'll give it another try now -- see if I can't save the bug dump
to a floppy.

Thanks for your help -- hope I can get some more data soon...

        Greg
-- 
Greg Ward <gward@python.net>                         http://www.gerg.ca/
I'd like some JUNK FOOD ... and then I want to be ALONE --
