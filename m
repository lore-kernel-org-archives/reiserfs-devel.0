From: Valdis.Kletnieks@vt.edu
Subject: Re: Processes dying?
Date: Fri, 04 Jun 2004 16:50:13 -0400
Message-ID: <200406042050.i54KoDYD029229@turing-police.cc.vt.edu>
References: <20040604203925.GF4990@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1326084448P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 04 Jun 2004 23:39:25 +0300."
             <20040604203925.GF4990@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?UNKNOWN?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

--==_Exmh_1326084448P
Content-Type: text/plain; charset=us-ascii

On Fri, 04 Jun 2004 23:39:25 +0300, mjt@nysv.org (Markus =?UNKNOWN?Q?T=F6rnqvist?=)  said:
> Hello
> 
> I just started using the latest auto-snapshot.
> 
> I noticed weird behavior, that is, processes crash, so bad even C-c doesn't
> kill them. For some reason running strace behind them gives me C-c support.

My guess is that some *other* process got wedged in the kernel while holding
a kernel lock, causing other processes to block when they needed that lock.

Probably will need a SysRq-T output to figure out who's hung where...

--==_Exmh_1326084448P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAwOCEcC3lWbTT17ARAkiyAKCdI4VxsY0HwR6Gm05ux1RIxujwXgCgwB1T
AL8cgr0Q4NcLJZjeSJMtk9E=
=rp4A
-----END PGP SIGNATURE-----

--==_Exmh_1326084448P--
