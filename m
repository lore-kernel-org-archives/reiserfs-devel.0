From: Valdis.Kletnieks@vt.edu
Subject: Re: Reiser4 O_DIRECT
Date: Tue, 24 May 2005 17:55:09 -0400
Message-ID: <200505242155.j4OLt9mD023120@turing-police.cc.vt.edu>
References: <1116525192.29446.5.camel@zion> <1116578526.3532.463.camel@tribesman.namesys.com> <1695540869.20050521234900@wp.pl> <200505222247.j4MMlr85008867@turing-police.cc.vt.edu> <4291225B.5090503@slaphack.com> <20050523095212.GD11013@nysv.org> <200505231653.j4NGrksq017538@turing-police.cc.vt.edu> <42921886.40404@namesys.com>
            <42939E37.8060107@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1116971709_3605P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 24 May 2005 16:35:51 CDT."
             <42939E37.8060107@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, =?UTF-8?B?TWFya3VzIO+/vQ==?= <mjt@nysv.org>, Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

--==_Exmh_1116971709_3605P
Content-Type: text/plain; charset=us-ascii

On Tue, 24 May 2005 16:35:51 CDT, David Masover said:

> My feeling is that you create the standard as you create the test, not
> the other way around.  If the test works, then there are by definition
> few bugs if any in the system itself -- any other bugs are actually in
> the application, not the system.

That's even worse.  Then if somebody bodgers it all up with some corner case
that your test system didn't cover, you're by definition screwed, as the
standard won't say what it *SHOULD* do....

Consider the vast philosophical difference between "This is what the FS *should*
do" and "This is what we tested the FS for".  You want the standard to be the
first, not the second.....

--==_Exmh_1116971709_3605P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCk6K8cC3lWbTT17ARAj3iAJ9HSGNoTAqulKrba3crtV1iiQeeqwCgk/v4
ryzrG227vdRqp6UeQavaX20=
=enKf
-----END PGP SIGNATURE-----

--==_Exmh_1116971709_3605P--
