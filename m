From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 12:06:30 -0700
Message-ID: <20030214120630.O22930@schatzie.adilger.int>
References: <3E4AA902.86F15815@interface-ag.com> <b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com> <20030214111829.A21849@namesys.com> <20030214031316.L22930@schatzie.adilger.int> <20030214131746.H10351@namesys.com> <20030214035034.M22930@schatzie.adilger.int> <3E4CF04A.2030904@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12769-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E4CF04A.2030904@namesys.com>; from reiser@namesys.com on Fri, Feb 14, 2003 at 04:34:02PM +0300
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

On Feb 14, 2003  16:34 +0300, Hans Reiser wrote:
> Andreas Dilger wrote:
> >Yeah, I keep giving him good reasons to change his mind, even a little,
> >like "have 'reiserfsck -a' just check the superblock and return with a
> >code > 1 if there is an error" so that an admin can at least do something
> >about it if the filesystem is broken, before it gets mounted/written to
> >again and the brokenness multiplies unknown to the user...
>
> I don't understand you.

Ok, so the reiserfs kernel code detects an error on disk, what does it
do?  Print out an error message, maybe BUG?  There is an "error" field
in the reiserfs superblock, I hope it is set when the kernel detects
something bad.

So, now what happens?  Maybe the user doesn't read their syslog and
doesn't see the error, or the error is just a prelude to memory corruption
which causes the system to crash.  When the system boots again, it goes
on its merry way, mounting the reiserfs filesystem with _known_ errors
on it, using bad allocation bitmaps, directories btrees, etc and maybe
double allocating blocks or overwriting blocks from other files causing
them to become corrupt, etc, etc, etc.  Until finally the filesystem is
totally corrupt, the system crashes miserably, the user emails this list
and reiserfsck has an impossible job trying to fix the filesystem.

Instead, what I propose is to have "reiserfsck -a" AS A STARTING POINT
simply check for a valid reiserfs superblock and the absence of the
"error" flag before declaring the filesystem clean and allowing the
system to boot.

What's even worse, the reiserfs_read_super (at least 2.4.18 RH kernel)
code OVERWRITES the superblock error status at mount time, making it
worse than useless, since each mount hides any errors that were detected
before the crash:

	s->u.reiserfs_sb.s_mount_state = SB_REISERFS_STATE(s);
	s->u.reiserfs_sb.s_mount_state = REISERFS_VALID_FS ;

> >Next, add journal replay to reiserfsck if it isn't already there,
> >
> Why, when it is in the kernel?

Because that is the next stage to allowing reiserfsck do checks on the
filesystem after a crash.  Do you tell me you would rather (and you
must, because it obviously currently does) have reiserfsck just throw
away everything in the journal, leaving possibly inconsistent data in
the filesystem for it to check?  Or maybe make the user mount the
filesystem (which obviously has problems or they wouldn't be running
reiserfsck to do a full check) just to clear out the journal and maybe
risk crashing or corruption if the filesystem is strangely corrupted?

> > and
> >_then_ do the same check as above, keeping a field in the journal header
> >to synchronously write an error to in fatal cases, instead of into the
> >superblock and where it is overwritten by journal replay.
> >
> >That is all e2fsck does for ext3 filesystems, and it only takes a fraction
> >of a second to complete (no longer than it takes in-kernel journal replay
> >to complete at mount time, really) but the user wins by being able to fix
> >the filesystem before the whole system has booted and possibly corrupted
> >more data.
>
> >Regardless of whether reiserfsck is trusted or not to check/fix the
> >whole filesystem automatically, the above is not a risky change.  If you
> >wanted to go for more reliability, you could start adding quick "read
> >only" checks at periodic intervals like ext2 even if you never fix the
> >filesystem without user intervention.  The most common error we see on
> >the ext3 these days is due to memory/disk corruption that is caught by
> >the kernel or with a periodic check, which no amount of journaling can
> >fix or prevent.
>
> I hate it when booting causes me to get stuck waiting for an fsck.

You don't hate it more when you lose data?  You are a strange man then.

> Probably fsck is stable enough now that we should encourage people to 
> run it readonly regularly, but it should not be forced on them.

I'm nowhere suggesting that reiserfsck _has_ to implement the additional
periodic read-only checks at boot time, mostly just that it do _very_simple_
checks that take .01 seconds at boot time before the filesystem is mounted,
so that the admin/user at least _notices_ that there is an error instead of
not finding out until their filesystem is totally corrupted.

> Maybe having some code to check whether fsck was run in the last 3 
> months, and if not then if the user types y in the next 30 seconds 
> during boot it will be run, would make sense.

Sure, that would be great, given the prevelance of memory errors and
IDE DMA errors that show up these days, which the filesystem and the
journal can do nothing about.

> The ext2 tradition of checking the number of mounts since the last fsck 
> is simply counting the wrong thing.

It's only a matter of defaults safe vs. fast...  e2fsck defaults to safe,
checking occasionally for possible corruption, vs. reiserfs waiting for
fatal corruption before forcing the user to run reiserfsck (which is so
heavily discouraged (on the list, documentation, when run), that nobody
runs it for fear of damaging their filesystem further.  You are well aware
that the e2fsck check intervals can be tuned per-filesystem and even
disabled if desired (it prints options for how to do this at mke2fs time
and is clearly documented for the experienced user).  For a boot-once-a-day
machine, the default is to check about once a month (at most 6 months for
the time check), and if machines are crashing more often, then they should
probably be checked more often because _something_ has to be causing crashes.

Having reiserfsck just do read-only checks shouldn't force you to type
"yes" (and we mean "yes" because this is so scary, mere mortals shouldn't
be doing this).  Hans, you've always talked about making things easy for
the average user (error messages and such), don't you think that making
a data consistency check for the user a little less intimidating too?

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

