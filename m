From: Paolo Correnti <paolunix@yahoo.com>
Subject: Re: Snapshot against 2.6.1 released.
Date: Tue, 20 Jan 2004 02:11:45 -0800 (PST)
Message-ID: <20040120101145.48843.qmail@web21503.mail.yahoo.com>
References: <20040120080223.2921.qmail@web21505.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16582-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040120080223.2921.qmail@web21505.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>, Domenico Andreoli <cavok@libero.it>
Cc: reiserfs-list@namesys.com

I'm sorry, I've read later Nikita message (Re:
linux-2.6.0 + reiser4 oops) telling
that Reiser4 partition has to be rebuilded.

Now I've back my Reiser4 partition with no more mount
problem.

All the best
PC

P.S. Of course, pay attention to have always a "backup
partition" to be able to copy all your Reiser4 data
before testing new snapshots.


--- Paolo Correnti <paolunix@yahoo.com> wrote:
> I have the same "Domenico's problem":
>  - downloaded Kernel 2.6.1
>  - applied SNAPSHOT 2004.01.19 FIXED
>  
> Trying to mount Reiser4 partition all I obtain is:
> 
> Wrong Master Super Block Magic
> fs/reiser4/init_siper.c line 166
> 
> Going back to Kernel 2.6.0 + SNAPSHOT 2003.12.23
> I've no problems mounting and dismounting my Reiser4
> partition (only kernel panic during shutdown if I
> try to use another Reiser4 partition, I think is a
> dismount problem)
> 
> I've also no problem with Kernel 2.6.1 + SNAPSHOT
> 2003.12.23 using only one Reiser4 partition (with
> more
> partitions see the note above).
> 
> All the best
> 
> PC
> 
> 
> --- Nikita Danilov <Nikita@Namesys.COM> wrote:
> > Domenico Andreoli writes:
> >  > Nikita Danilov wrote:
> >  > > Nikita Danilov writes:
> >  > >  > Hello,
> >  > >  > 
> >  > >  > new snapshot against 2.6.1 kernel is at
> >  > >  > 
> >  > >  > http://namesys.com/snapshots/2004.01.19/
> >  > >  > 
> >  > >  > look into READ.ME file for details.
> >  > > 
> >  > > Please also apply last-minute-fix.diff from
> > there: it fixes some bug
> >  > > that slipped into snapshot.
> >  > > 
> >  > > last-minute-fix.diff should be applied from
> > fs/reiser4:
> >  > > 
> >  > > $ cd /somewhere/fs/reiser4
> >  > > $ patch -p1 <
> > /somewhereelse/last-minute-fix.diff
> >  > > 
> >  > > 
> >  > 
> >  > ehm.. my existing reiser4 partition is not
> > mountable now that i recompiled 
> >  > 2.6.1 using latest snapshot. it did not contain
> > anything so i formatted 
> >  > it, but nothing new happened.
> >  > 
> >  > # mkfs.reiser4 /dev/hdc6
> > 
> > Is this mkfs.reiser4 from the 2004.01.19 snapshot?
> > 
> >  > mkfs.reiser4 0.4.20
> >  > Copyright (C) 2001, 2002, 2003 by Hans Reiser,
> > licensing governed by 
> >  > reiser4progs/COPYING.
> >  > 
> >  > Block size 4096 will be used. 
> >  > 
> >  > Linux 2.6.1-reiser4 is detected. 
> >  > 
> >  > Uuid 81a2b014-f272-4f6e-adad-e323c0cb10eb will
> be
> > used. 
> >  > 
> >  > Reiser4 is going to be created on /dev/hdc6. 
> >  > 
> >  > (Yes/No): yes
> >  > Creating reiser4 on /dev/hdc6...done
> >  > # mount /dev/hdc6 /mnt/extra2
> >  > mount: you must specify the filesystem type
> >  > # mount /dev/hdc6 /mnt/extra2 -t reiser4
> >  > mount: wrong fs type, bad option, bad
> superblock
> > on /dev/hdc6,
> >  >         or too many mounted file systems
> >  > #
> > 
> > What is in the kernel logs (dmesg,
> > /var/log/messages)?
> > 
> >  > 
> >  > 
> > 
> > Nikita.
> 
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! Hotjobs: Enter the "Signing Bonus"
> Sweepstakes
> http://hotjobs.sweepstakes.yahoo.com/signingbonus


__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus
