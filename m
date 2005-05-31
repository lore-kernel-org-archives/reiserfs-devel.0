From: Valdis.Kletnieks@vt.edu
Subject: Re: File as a directory - VFS Changes
Date: Tue, 31 May 2005 12:30:40 -0400
Message-ID: <200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>
References: <17050.62052.318426.711322@gargle.gargle.HOWL> <75229416615-BeMail@cr593174-a> <17052.12223.708707.757538@gargle.gargle.HOWL>
            <429C7D0A.6040200@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1117557039_3502P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 31 May 2005 08:04:42 PDT."
             <429C7D0A.6040200@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <nikita@clusterfs.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

--==_Exmh_1117557039_3502P
Content-Type: text/plain; charset=us-ascii

On Tue, 31 May 2005 08:04:42 PDT, Hans Reiser said:

> >Cycle may consists of more graph nodes than fits into memory. 
> >
> There are pathname length restrictions already in the kernel that should
> prevent that, yes?

The problem is that although a *single* pathname can't be longer than some
length, you can still create a cycle.  Consider for instance a pathname restriction
of 1024 chars.  Filenames A, B, and C are all 400 characters long.  A points at B,
B points at C - and C points back to A.

Also, although the set of inodes *in the cycle* fits in memory, the set of
inodes *in the entire graph* that has to be searched to verify the presence of
a cycle may not (in general, you have to be ready to examine *all* the inodes
unless you can do some pruning (unallocated, provably un-cycleable, and so
on)).  THis is the sort of thing that you can afford to do in userspace during
an fsck, but certainly can't do in the kernel on every syscall that might
create a cycle...


--==_Exmh_1117557039_3502P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCnJEvcC3lWbTT17ARAh/DAKCua5UxAjLfp7fKlWLiCfCA625PwQCfWHUj
FOSC4vKdMyjvRgv9mK1X77g=
=89cD
-----END PGP SIGNATURE-----

--==_Exmh_1117557039_3502P--
