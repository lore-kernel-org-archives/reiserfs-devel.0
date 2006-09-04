From: Valdis.Kletnieks@vt.edu
Subject: Re: Reiser FS will not boot after crash
Date: Mon, 04 Sep 2006 16:30:48 -0400
Message-ID: <200609042030.k84KUmNI017792@turing-police.cc.vt.edu>
References: <Pine.LNX.4.04.10609041516380.4384-100000@nei15.nei1.nei.mv.com>
            <200609042333.27778.vs@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1157401847_3784P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29803-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 04 Sep 2006 23:33:27 +0400."
             <200609042333.27778.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, jmh5@nei.mv.com

--==_Exmh_1157401847_3784P
Content-Type: text/plain; charset=us-ascii

On Mon, 04 Sep 2006 23:33:27 +0400, "Vladimir V. Saveliev" said:

> after unclean shutdown journal reply is necessary to return reiserfs to 
> consistent state. Maybe GRUB did not do that?

A case can be made that GRUB should be keeping its grubby little paws off
the filesystem journal.  It's a *bootloader*.  It's only purpose in life is
to load other code that can make intelligent decisions about things like
how (or even whether) to replay a filesystem journal.

--==_Exmh_1157401847_3784P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFE/Iz3cC3lWbTT17ARAmnYAKCdjU/DHPWN6kkTQesVxM6e6TK14gCgqTj/
3JDcRYxIx/D9PWGKsCjnFlU=
=kUuN
-----END PGP SIGNATURE-----

--==_Exmh_1157401847_3784P--
