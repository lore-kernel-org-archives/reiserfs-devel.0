From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Data-logging and md as / fs bug
Date: Tue, 6 May 2003 21:56:27 +0200
Message-ID: <200305062156.27595.Dieter.Nuetzel@hamburg.de>
References: <3EB30852.6090402@netscape.net> <200305062134.42520.christian.mayrhuber@gmx.net> <1052250298.14612.235.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13971-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1052250298.14612.235.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Am Dienstag, 6. Mai 2003 21:44 schrieb Chris Mason:
> On Tue, 2003-05-06 at 15:34, Christian Mayrhuber wrote:
> > Hi,
> >
> > I've patched 2.4.21-rc1 with the following:

I have nearly the same running on-top of 2.4.21-pre6-jam1

> > 02-akpm-b_journal_head-1.diff

Needed?

> > 03-2.4.21-rc1-relocation-6.diff
> > 04-reiserfs-sync_fs-1.diff
> > 05-2.4.21-pre6-data-logging-36.diff
> > 06-logging-export.diff

Needed?

> > 06-write_times.diff

I have -aa;-)

> > 07-quota-v2-2.4.21.diff
> > 08-2.4.21-pre6-reiserfs-quota-26.diff

Both not, yet.

> > 09-kinoded-8.diff
> > 10-reiserfs-quota-link-fix.diff

Needed?

11.dirty-inodes-for-kinoded.diff
iget5_locked_for_2.4.21-pre5-datalogging.diff
search_reada-4.diff

Usefull?

> > After rebooting this kernel it fails to cleanly shutdown /dev/md0, which
> > is mounted as / and runs as raid1. This causes a nasty resync of the
> > disks at every boot.
> > 2.4.21-rc1 without those patches has no problems with md shutdown.
> > I just wanted let you know.
>
> Interesting, this isn't a known bug.  Could you please try two things:
>
> 1) try to reproduce without any patches past 06-write_times.diff applied
> (in other words, without the quota)
>
> 2) try to reproduce with only 02-akpm-b_journal_head-1.diff and
> 03-2.4.21-rc1-relocation-6.diff applied.

Clean new versions?

What about merging them into 2.4.22-pre, finally?

Thanks,
	Dieter
