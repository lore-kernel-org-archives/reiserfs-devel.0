From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Data-logging and md as / fs bug
Date: Wed, 7 May 2003 16:52:00 +0200
Message-ID: <200305071652.00627.christian.mayrhuber@gmx.net>
References: <3EB30852.6090402@netscape.net> <200305071641.37361.christian.mayrhuber@gmx.net> <1052318606.14616.394.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1052318606.14616.394.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

Am Mittwoch, 7. Mai 2003 16:43 schrieb Chris Mason:
> On Wed, 2003-05-07 at 10:41, Christian Mayrhuber wrote:
> > /dev/md0 is reiserfs mounted / and /dev/md1 is swap space, messages are
> > from a Debian woody system. /dev/md0 needs to resync after reboot.
> > /dev/md0 consists of hda1 and hdc1
> > /dev/md1 consists of hda2 and hdc2
> > The
> > Here's the output from the failed shutdown:
> >
> > Stopping RAID devices: md: md0 still in use
> > /dev/md0: Device or resource busy
>
> Interesting, I think I understand it.  You don't any warnings about
> failures while unmounting /, right?
>
> -chris

No warning at all.
I've reiserfsck'ed /dev/hda1 and /dev/hdc1 from a cd boot without md support
to see if there is something corrupt on one drive, but both raid1 disks were
perfectly ok.
-- 
lg, Chris

