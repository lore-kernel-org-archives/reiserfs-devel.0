From: Perry Kundert <perry.kundert@gmail.com>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 16:20:45 -0600
Message-ID: <2f9ccaae0506241520ffa8aa@mail.gmail.com>
References: <tdwebste2@yahoo.com>
	 <20050624093510.4330.qmail@web51301.mail.yahoo.com>
	 <200506241545.j5OFj3Iw014214@laptop11.inf.utfsm.cl>
	 <2f9ccaae050624101329390969@mail.gmail.com>
	 <200506242138.j5OLcPr0025054@turing-police.cc.vt.edu>
Reply-To: perry@kundert.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24564-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506242138.j5OLcPr0025054@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Valdis.Kletnieks@vt.edu" <Valdis.Kletnieks@vt.edu>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>

On 6/24/05, Valdis.Kletnieks@vt.edu <Valdis.Kletnieks@vt.edu> wrote:
> On Fri, 24 Jun 2005 11:13:45 MDT, Perry Kundert said:
>=20
> >     In general, isn't it better to first include modules providing
> > divergent but possibly interesting functionality (such as Reiser4) as
> > an "optional" or "experimental" component, and then slowly re-factor
> > desirable functionality into higher level facilities like the VFS?
>=20
> The problem arises when the facility is something that is demonstrably
> borked when done in an optional way in one filesystem, and really needs
> to be done at the VFS level if it is to be done at all.

    OK, fair enough.  The file-as-directory stuff, which introduces
VFS-incompatible issues, was turned off.  It requires VFS changes.

    The remaining plugin architecture, as far as I understand, deals
in the on-disk structure of the FS -- just like journals.  Encryption,
Compression, and the like.

    So, what you are saying, is -- so long as the "plugins" do stuff
that deals in how reiser4 slings bits back and forth to the disk,
you're OK, right?

>=20
> >    I ask you -- if everyone in kernel-land is so convinced that you
> > should always select varying on-disk formats via the VFS, then *why*
> > hasn't ext2/ext3 been merged into a single filesystem?
>=20
> Because the formats, although similar enough to be mostly compatible, are
> still different enough that merging them is difficult.

    So, what you are saying is: if reiser4 wants to provide
variability in on-disk format, so long as it implements it using
*multiple different filesystems* (eg reiser4-cryptcompress,
reiser4-whatever) -- just like ext2 vs. ext3 -- then you are OK with
it?  But, if they are implemented as "plugins", so that the ONE
reiser4 filesystem can modulate its behaviour based on what the
on-disk format says, that you are NOT OK with it?

    And this makes sense, why?

>                                                                         T=
here's some very
> subtle second-order effects, where the ext3 driver can do things in diffe=
rent
> orders or with different algorithms because it has a journal, when the ex=
t2
> code has to do things in a specific way because it has to *always* have t=
hings
> in a consistent enough state that fsck.ext2 can clean things up.  So you =
end
> up with code that looks like:
> ...

    Don't get me wrong -- I'm not saying that ext2 and ext3 shouldn't
be separate file systems.  However, if they were designed from the
start so that the ONE (say) ext23 filesystem could look at its on-disk
format, notice that the data specified the "journal" plugin, and
implement the correct behaviour -- that this would be "bad"?

    Because I can envision an ext23 filesystem that is just like
reiser4, that does exactly that -- implements its variable behaviour
via a "journal" plugin.

    So, if it did so, would you be OK with it?  As long as it wasn't
called reiser4?

    I really don't mean to sound sarcastic -- it just sounds like
there are "other" issues at work here -- like "Hans is a Butt-Head, so
I want to reject reiser4's plugin design for modulating its behviour,
no matter what".

> >                                                         Surely the
> > "journalling" plugin of this filesystem is a prime candidate for
> > selection via the VFS?
>=20
> To be doing "journalling" at the VFS level implies that a journal is some=
thing
> that makes sense at the VFS level - that it's basically filesystem indepe=
ndent,
> which is most certainly *not* true - the notations an XFS journal needs t=
o make
> to indicate which blocks were just removed from the free-block structure =
are
> quite different from what ext3 needs to record.

    Sort of like crypt/compress, etc. -- each filesystem may or may
not do this, but it just doesn't matter to the VFS -- by the time data
hits the VFS it isn't encrypted or compressed.  So, why not let the FS
say "hey, I happen to see that the on-disk format says it uses
cryptcompress -- I'll dispatch the right methods from this aptly-named
"plugin"...


>=20
> Note that journalling is neither an attribute of the actual data, or of
> the user-visible metadata (inode contents, etc).   The only things that
> care about the journalling format/etc are the filesystem driver, the moun=
t
> command, and the mkfs/fsck commands.   As such, it's a file system issue,
> not a VFS issue.
>=20
> For a good example of why this is so, go back and read the recent discuss=
ion
> of what happens to flash memory filesystems mounted with 'sync' - this wa=
s
> a case of the VFS doing "journalling by flushing" without consulting the
> low-level drivers....
>=20
>=20
>=20

    OK, so far it seems like we are actually agreeing -- the stuff
that gets done via reiser4 "plugins" actually doesn't have anything to
do with the VFS, and it shouldn't be there.  So long as reiser4
presents a VFS-sensible, VFS-consistent heirarchy of stuff that "looks
like" files and directories to the VFS, then we're OK with it?

    Whether reiser4 uses "plugins", or ESP, or whatever to decide what
behaviour it implements in order to produce this VFS-consistent
interface, then that's OK, right?

--=20
    -pjk
