From: Valdis.Kletnieks@vt.edu
Subject: Re: Problems with accessing directory
Date: Sun, 29 May 2005 12:31:32 -0400
Message-ID: <200505291631.j4TGVfCQ007511@turing-police.cc.vt.edu>
References: <002101c0e85a$6faad060$8a455351@shanasola26yqz>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1117384292_6734P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 29 May 2001 18:14:28 +0200."
             <002101c0e85a$6faad060$8a455351@shanasola26yqz> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Webservice <info@webservice.be>
Cc: reiserfs-list@namesys.com, Kurt Ghekiere <Kurt@ris.be>

--==_Exmh_1117384292_6734P
Content-Type: text/plain; charset=us-ascii

On Tue, 29 May 2001 18:14:28 +0200, Webservice said:

> When accessing a particulary directory, the systems hangs with a kernel
> panic (mapping memory).

This will be a lot easier to diagnose with:

The exact version of your kernel (uname -a), the version of reiserfsck,
and the actual panic traceback (set up a serial console to catch it, or
even take a picture with a digital camera if all else fails).

Have you run 'badblocks' on the 4 md devices, to rule out an actual bad
spot on the disk?

--==_Exmh_1117384292_6734P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCme5jcC3lWbTT17ARArYqAJ9P1EaXbHQ4ig7AOn8FlnKe4SzmeQCg9LB/
6IFVRTSCfzP6rRkoFxvSI4M=
=dq3L
-----END PGP SIGNATURE-----

--==_Exmh_1117384292_6734P--
