From: Valdis.Kletnieks@vt.edu
Subject: Re: Reiser4 and ZFS
Date: Wed, 15 Dec 2004 15:00:12 -0500
Message-ID: <200412152000.iBFK0CHH016500@turing-police.cc.vt.edu>
References: <20041215064608.66493.qmail@web50901.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1363257700P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22793-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 14 Dec 2004 22:46:08 PST."
             <20041215064608.66493.qmail@web50901.mail.yahoo.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Job Bob <yzhang2004@yahoo.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_-1363257700P
Content-Type: text/plain; charset=us-ascii

On Tue, 14 Dec 2004 22:46:08 PST, Job Bob said:

>   So if ZFS is not the vaporware that WinFS is, what
> new features of ZFS are worth incorporating into
> Reiser fs? Will Reiser fs continue to stay ahead of
> ZFS?

This of course depends in a *large* part on how exactly you define "ahead".

For many shops, it's quite likely that a ZFS with "more scalability and
administration" is The Right Choice, especially if it does *NOT* include lots
of odd new features and quirks that might break production code (remember the
joys in getting Apache running on reiser4, until it was discovered that the
'file-as-directory' stuff broke programs that weren't expecting it?).

The criteria I use for rating a filesystem as being "ahead" for use on my
laptop (where new cool features often count for more than stability or
performance) are very different than what I want for a mail server.  And the
guy 3 cubicles over doesn't *care* about the details of filesystems - he just
worries about "will this make Oracle run faster or more robustly?".....

--==_Exmh_-1363257700P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBwJfLcC3lWbTT17ARAkcGAKCZFnkcDteBpa1u2yiKFOnHUJlsDwCeLTIv
DN47u3pyQ9gwq9u3DloKpGk=
=KaBS
-----END PGP SIGNATURE-----

--==_Exmh_-1363257700P--
