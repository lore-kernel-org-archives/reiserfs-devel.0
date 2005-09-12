From: Valdis.Kletnieks@vt.edu
Subject: Re: we have got hash function screwed up
Date: Sun, 11 Sep 2005 21:02:39 -0400
Message-ID: <200509120102.j8C12fJM025350@turing-police.cc.vt.edu>
References: <431C738F.4010803@freemail.hu> <4322FD91.4060404@gmx.net> <200509110300.j8B30P7q013142@turing-police.cc.vt.edu>
            <4324B492.8090207@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1126486959_4179P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25930-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 12 Sep 2005 00:49:54 +0200."
             <4324B492.8090207@gmx.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: evilninja <evilninja@gmx.net>
Cc: reiserfs-list@namesys.com

--==_Exmh_1126486959_4179P
Content-Type: text/plain; charset=us-ascii

On Mon, 12 Sep 2005 00:49:54 +0200, evilninja said:
> Valdis.Kletnieks@vt.edu schrieb:
> > Yes, I know there's needs to support borked legacy filesystems that were mkfs'ed
> > before the problem was recognized.  That means fsck.reiserfs needs to know about
> > it - but mkfs.reiserfs??  Seen in the Fedora Core devel tree as of tonight:
> 
> yeah, this "feature" of mkfs.reiserfs could be removed, but since reiserfs
> is in bugfixes-only-mode i don't see it happen.

I'd consider a #if 0/#endif to remove known busticated code a bugfix. ;)

--==_Exmh_1126486959_4179P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFDJNOvcC3lWbTT17ARAjycAKCASvEAhlr/i3hKY8ToR2jbibt22gCeNbDm
S6Esq2SDpGPrHlPERIk26Fo=
=iwtL
-----END PGP SIGNATURE-----

--==_Exmh_1126486959_4179P--
