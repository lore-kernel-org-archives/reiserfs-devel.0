From: Valdis.Kletnieks@vt.edu
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Mon, 17 Jul 2006 16:09:15 -0400
Message-ID: <200607172009.k6HK9Fgt022888@turing-police.cc.vt.edu>
References: <200607120816.11292.fjcabello@visual-tools.com> <200607141420.36656.fjcabello@visual-tools.com> <1152881975.6407.58.camel@tribesman.namesys.com> <200607171053.42044.fjcabello@visual-tools.com> <1153158952.6311.87.camel@tribesman.namesys.com> <1153160052.3925.5.camel@serpent.office.seatab.com>
            <44BBE116.2070202@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1153166955_13479P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29050-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 17 Jul 2006 12:12:22 PDT."
             <44BBE116.2070202@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Brad Dameron <brad@seatab.com>, reiserfs-list@namesys.com

--==_Exmh_1153166955_13479P
Content-Type: text/plain; charset=us-ascii

On Mon, 17 Jul 2006 12:12:22 PDT, Hans Reiser said:
> It seems like bad memory is growing as a percentage of user filesystem
> problem sources.   Do others have that feeling also?

Assuming that the chances of any given 16 megabit (or whatever size it is)
RAM chip having a flaky bit being identical, then the chance of bad memory
in any given gigabyte of RAM is the same.. and if you have 1/2G of memory,
you have 1/8 the chance of a bad bit compared to having 4G installed.

The bigger question is why ECC isn't catching this stuff.... (and yes,
I know some hardware doesn't do ECC on all data paths, which is the point :)

--==_Exmh_1153166955_13479P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFEu+5rcC3lWbTT17ARAjGgAJ4goGJcqHrpiP2MEZnq05oxcNHYWQCgkILR
GPzqpDbju6w6TXFOwtpKguY=
=e63i
-----END PGP SIGNATURE-----

--==_Exmh_1153166955_13479P--
