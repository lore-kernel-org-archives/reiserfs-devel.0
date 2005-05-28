From: Valdis.Kletnieks@vt.edu
Subject: Re: File as a directory - Ordered Relations
Date: Sat, 28 May 2005 15:42:35 -0400
Message-ID: <200505281942.j4SJgbpi009886@turing-police.cc.vt.edu>
References: <6708893568-BeMail@cr593174-a>
            <4297FA03.6050603@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1117309355_6734P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24191-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 27 May 2005 23:56:35 CDT."
             <4297FA03.6050603@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: "Alexander G. M. Smith" <agmsmith@rogers.com>, Leo Comerford <leocomerford@gmail.com>, reiserfs-list@namesys.com

--==_Exmh_1117309355_6734P
Content-Type: text/plain; charset=us-ascii

On Fri, 27 May 2005 23:56:35 CDT, David Masover said:

> Hans, comment please?  Is this approaching v5 / v6 / Future Vision?  It
> does seem more than a little "clunky" when applied to v4...

I'm not Hans, but I *will* ask "How much of this is *rationally* doable
without some help from the VFS?".  At the very least, some of this stuff
will require the FS to tell the VFS to suspend its disbelief (for starters,
doing this without confusing the VFS's concepts of dentries/inodes/reference
counts is going to be.... interesting... :)

--==_Exmh_1117309355_6734P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCmMmrcC3lWbTT17ARAlHGAJ4mUCjmWfcgMRfqp7+0SHLsS0HcHwCdGm13
zsNLcU/2OpInh/5440DfrPY=
=UU36
-----END PGP SIGNATURE-----

--==_Exmh_1117309355_6734P--
