From: Matt Stegman <matts@ksu.edu>
Subject: Re: More on Hard Links
Date: Wed, 10 Dec 2003 14:49:35 -0600 (CST)
Message-ID: <Pine.GSO.4.44L.0312101334000.3319-100000@unix2.cc.ksu.edu>
References: <20031209234740.27534.qmail@web25010.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16322-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031209234740.27534.qmail@web25010.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Cc: reiserfs-list@namesys.com

On Tue, 9 Dec 2003, Narcoleptic Electron wrote:

> > But my concern with that was that if one partition needs to be
> > reformatted, then the other instances of the link become unwritable.
> > So if you want to recover, you would have to copy the file and
> > manually re-link everything.  There's no way to automatically recover.
>
> It would be pretty easy to write a script to do this.
> This script would be pretty useful, in fact... good
> thinking.

So would this be a daemon, or would the admin have to remember to run i.e.
"weaklinkfsck" after an mkfs (or lvremove, or moving the disk (sdb changes
to sdc), or whatever) on any volume which may have had these weak links?

> > It's hard to differentiate that from the volume
> > just being unmounted.
>
> There is no need to differentiate from a volume going
> down and just being unmounted.

If it's just unmounted, it may come back.  If it's been mkfs'ed (or
removed from the computer) it's not coming back.  Maybe this is where
weaklinkfsck comes in?

> > Narcoleptic> Shouldn't all files on a read-only partition
> > Narcoleptic> automatically have their permission bits set to
> > Narcoleptic> read-only (or at least appear that way)?
> >
> > Hmm.  I don't think so.  I'm not sure.  I don't have any r-o
> > partitions right now, so I can't check.
>
> If it doesn't work this way, I think it should.

No, when you mount a filesystem read-only the permission bits show up as
normal.  Permission bits are stored in the inode, and stat() just reports
what the inode says.  However, the error returned from trying to write to
a file notes "read-only file system."

Some filesystems have a umask option, but that's for FAT and NTFS and the
like, not filesystems with real UNIX permissions.

As for actually modifying permissions when you mount, first of all it's
way way too slow, and second, how would you know which write bits to set
on an rw mount?

--
Matt


