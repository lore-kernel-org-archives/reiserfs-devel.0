From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 17:38:25 -0400
Message-ID: <200506242138.j5OLcPr0025054@turing-police.cc.vt.edu>
References: <tdwebste2@yahoo.com> <20050624093510.4330.qmail@web51301.mail.yahoo.com> <200506241545.j5OFj3Iw014214@laptop11.inf.utfsm.cl>
            <2f9ccaae050624101329390969@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1119649105_4848P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24563-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 24 Jun 2005 11:13:45 MDT."
             <2f9ccaae050624101329390969@mail.gmail.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: perry@kundert.ca
Cc: ReiserFS List <reiserfs-list@namesys.com>

--==_Exmh_1119649105_4848P
Content-Type: text/plain; charset=us-ascii

On Fri, 24 Jun 2005 11:13:45 MDT, Perry Kundert said:

>     In general, isn't it better to first include modules providing
> divergent but possibly interesting functionality (such as Reiser4) as
> an "optional" or "experimental" component, and then slowly re-factor
> desirable functionality into higher level facilities like the VFS?

The problem arises when the facility is something that is demonstrably
borked when done in an optional way in one filesystem, and really needs
to be done at the VFS level if it is to be done at all.

>    I ask you -- if everyone in kernel-land is so convinced that you
> should always select varying on-disk formats via the VFS, then *why*
> hasn't ext2/ext3 been merged into a single filesystem?

Because the formats, although similar enough to be mostly compatible, are
still different enough that merging them is difficult.  There's some very
subtle second-order effects, where the ext3 driver can do things in different
orders or with different algorithms because it has a journal, when the ext2
code has to do things in a specific way because it has to *always* have things
in a consistent enough state that fsck.ext2 can clean things up.  So you end
up with code that looks like:

	if (fs->journalled) {
		/* 500 lines of code for the ext3 case */
	} else {
		/* 300 lines of different code for ext2 */
	}

If you don't like that, then you can do this instead:

1) put ext2_do_whatever in ext2_whatever.c
2) put ext3_do_whatever in ext3_whatever.c

extern ext2_do_whatever();
extern ext3_do_whatever();

	if (fs-> journalled) {
		ext3_do_whatever();
	} else {
		ext2_do_whatever();
	}

In fact, I seem to remember Alan Cox answering this with "only about 10% of
the code *wouldn't* end up like this" or similar...

>                                                         Surely the
> "journalling" plugin of this filesystem is a prime candidate for
> selection via the VFS?

To be doing "journalling" at the VFS level implies that a journal is something
that makes sense at the VFS level - that it's basically filesystem independent,
which is most certainly *not* true - the notations an XFS journal needs to make
to indicate which blocks were just removed from the free-block structure are
quite different from what ext3 needs to record.

Note that journalling is neither an attribute of the actual data, or of
the user-visible metadata (inode contents, etc).   The only things that
care about the journalling format/etc are the filesystem driver, the mount
command, and the mkfs/fsck commands.   As such, it's a file system issue,
not a VFS issue.

For a good example of why this is so, go back and read the recent discussion
of what happens to flash memory filesystems mounted with 'sync' - this was
a case of the VFS doing "journalling by flushing" without consulting the
low-level drivers....

--==_Exmh_1119649105_4848P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCvH1RcC3lWbTT17ARAr80AKCPziTr91lqwMh6bykMyiig+Lk4OQCfaZds
WEp/29+oOPLmAoDAgOiKi9w=
=SnKg
-----END PGP SIGNATURE-----

--==_Exmh_1119649105_4848P--
