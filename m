From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4 and apache (was: Re: Reiser4 and ZFS)
Date: Mon, 27 Dec 2004 10:33:51 -0500
Message-ID: <200412271533.iBRFXpmT011625@turing-police.cc.vt.edu>
References: <20041215064608.66493.qmail@web50901.mail.yahoo.com> <200412152000.iBFK0CHH016500@turing-police.cc.vt.edu>
            <20041227122814.GA7388@favonius>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1656223295P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22912-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 27 Dec 2004 13:28:15 +0100."
             <20041227122814.GA7388@favonius> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: sander@humilis.net
Cc: reiserfs-list@namesys.com

--==_Exmh_1656223295P
Content-Type: text/plain; charset=us-ascii

On Mon, 27 Dec 2004 13:28:15 +0100, Sander said:
> Valdis.Kletnieks@vt.edu wrote (ao):
> > For many shops, it's quite likely that a ZFS with "more scalability
> > and administration" is The Right Choice, especially if it does *NOT*
> > include lots of odd new features and quirks that might break
> > production code (remember the joys in getting Apache running on
> > reiser4, until it was discovered that the 'file-as-directory' stuff
> > broke programs that weren't expecting it?).
> 
> I just got bitten by this. Is it possible to get apache to run on
> reiser4, and if so, how?

I think the archives have pointers to both a reiser4 patch that disables
the "file as directory", and a patch to apache to deal with the situation...

--==_Exmh_1656223295P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFB0CtecC3lWbTT17ARAi4+AKCmfJfnfxKBEVeDsVUdoaqre1HAwgCfTfdd
LRsPyYewKHnTxBWUEMeoE5A=
=TaqB
-----END PGP SIGNATURE-----

--==_Exmh_1656223295P--
