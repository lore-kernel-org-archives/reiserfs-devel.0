From: Sam Vilain <sam@vilain.net>
Subject: Re: reiserfsck --blame-it-on-the-hardware-yeah-yeah
Date: Tue, 11 Feb 2003 05:24:58 +1300
Sender: Sam Vilain <sv@horo.vilain.net>
Message-ID: <200302110525.06890.sam@vilain.net>
References: <20030208005057.GA1059@horo.vilain.net> <20030208224928.A30012@ns.soreal.co.uk> <20030209130116.A32206@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12680-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030209130116.A32206@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, vitaly@namesys.com

On Sun, 09 Feb 2003 23:01, Oleg Drokin wrote:
> > Therefore, your reiserfsck has a bug.  The whole point of a fsck is
> Well, currently the logic is "If we cannot read some block, that
> usually means this is a badblock".
> And so it prints the message. Of course more testing about
> if the block is beyond partition boundary should be probably added.

The block is not bad, it's EINVAL :-).  The block *number* is bad; you=20
*could* add to your is_block_shagged() function a test for whether the=20
block is out of bounds, but the point is that if it gets as far as that=20
function, chances are that it is too late.

(In reiserfsck), you need to do the bounds check when the referring=20
block/data structure is checked.

> > that any data, anywhere, can be corrupted - and reiserfsck should not
> > fall over because of it.  So, what you should do is carefully go
> Sure, unfortunatelly interactive part of reiserfsck is not very mature.
> And what do you think it should have done? Shrink the size of FS
> to fit changed (may be because of corruption) partition size?
> Enlarge the partition? What else?

Hmm.  It wasn't a changed partition size.  It was just a junk record in t=
he=20
journal.  It almost certainly got there by virtue of a hard hang that I=20
experienced just before this all happening.

> > through your filesystem data structure, insert garbage in at each
> > unique structural location, and run `reiserfsck' on it to see if it
> > handles the problem correctly.  Then I'd suggest sollowing that up
> > with some randomly corrupted filesystems.
> Yup, we are running such tests. But thanks for suggestion.

Good to hear.

> > Looking at the source code, I now see why the --no-journal-available
> > switch does not do anything if a `standard' journal is used rather
> > than an off-device journal.  However, I would suggest that this test
> > is superfluous, and the tool has more benefit to the system
> > administrator if the test for a `standard' journal with
> > fsck_skip_journal is removed, or perhaps replaced with a warning or
> > another prompt.
> We will think about it. Thanks for the idea.

=46rom my experiment, removing the test is not quite all that's required =
:-).

Here's a brief log of what I did, hopefully you can get an idea of the so=
rt=20
of changes that will be required to reiserfsck when ignoring the journal=20
on a `standard' journal filesystem:

  - first, I removed the test in main.c from 3.x.1b and latest pre-releas=
e
    reiserfsck and re-compiled

  - Latest pre-release still refused to ignore journal contents,
    complaining about invalid block offset.

  - 3.x.1b reiserfsck, however, completes successfully.  Ran
    --rebuild-tree.

  - mounted filesystem, however mount complains that a superblock is in t=
he
    log area (uh-oh).  Force mount with nolog, see filesystem in
    semi-consistent state.  Great!  It looks good.  I look around the FS =
a
    little bit.  Oops.  Panic.  Reboot.

  - Now that the journal is gone, all of the other reiserfsck modes of
    operation seem to work.  I ran (the latest) reiserfsck --rebuild-sb,
    and then reiserfsck --rebuild-tree

  - filesystem now mounts, however about the first 2 levels of directorie=
s,
    and many recently written files, have had their directory entries
    lost - lost+found contains roughly 11,000 entries (of 150,000 or
    so).

  - thankfully, I can locate the several hundred megabytes of .debs to sa=
ve
    myself spending days re-downloading it all over 56k :-).  Mission
    successful.

If reiserfsck was built with --no-journal-available in mind (that is,=20
ignoring the data present in an in-partition journal with that switch),=20
then I'm fairly sure that I wouldn't have suffered the last problem. =20
After the first scan, the journal would have been written back to an empt=
y=20
state.

> > I'm going to try removing that test in the 3.x.1b version and see if
> > the fsck completes.
> Well, 3.x.1b should not be actually used, lots of bugs were fixed since
> then.
> Vitaly: We need a check that journal target block is in range of
> filesystem. Please add this test.

That is not all you must do!

You need to do one, preferably both of the following:

  a) allow reiserfsck to ignore the in-partition journal, without produci=
ng
     an insane result (where the filesystem header says there is a journa=
l,
     but the space where the journal is has filesystem data in it).

  b) make reiserfsck validate the journal as well as the filesystem,
     probably playing them back itself rather than relying on a mount
     option that just does the playback for it.  In theory you could deci=
de
     whether to use the on-disk or the in-journal data structure, dependi=
ng
     on which was more consistent!


--=20
Sam Vilain, sam@vilain.net

All work and no play make Jack a dull boy and Jill a wealthy widow.
 - anon.
