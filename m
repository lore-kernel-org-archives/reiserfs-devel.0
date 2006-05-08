From: Valdis.Kletnieks@vt.edu
Subject: Re: bad bread
Date: Mon, 08 May 2006 15:47:39 -0400
Message-ID: <200605081947.k48JldJd029006@turing-police.cc.vt.edu>
References: <20060505062801.402beb50.boricua@despiertapr.com> <20060507005618.GA21557@rvalles.homedns.org>
            <op.s8595uohcigqcu@apollo13>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1147117659_2623P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sun, 07 May 2006 10:35:44 +0200."
             <op.s8595uohcigqcu@apollo13>
List-Id: <reiserfs-devel.vger.kernel.org>
To: PFC <lists@peufeu.com>
Cc: rvalles <rvalles@es.gnu.org>, reiserfs-list@namesys.com, boricua@despiertapr.com

--==_Exmh_1147117659_2623P
Content-Type: text/plain; charset=us-ascii

On Sun, 07 May 2006 10:35:44 +0200, PFC said:
> 
> > In the event of physical HD failure, the procedure goes like this:
> 
> 	Get mail saying a HDD is dead. Replace harddisk, resynchronize RAID.
> 	Use Linux software RAID. Harddrives are cheaper that the time you'll lose  
> trying to recover your data.

Remember to take backups *anyhow*.  That way, if the RAID controller dumps
cow manure on all the sectors, you won't be saying "Oh, SH*T".

Also, note that there exist buggy RAID controllers, where if you are doing
mirroring to 2 disks, and they develop bad blocks at different locations,
you can trash the mirror by resynchronizing (basically, you swap out one of
the bad disks, re-sync, it progresses as far as the bad block on the source
for the mirror, and dies).


--==_Exmh_1147117659_2623P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFEX6BbcC3lWbTT17ARAvhsAKCCHBHyc20BWDhZoutY79jvcOMtkwCfVVcs
waIJ5EQx4hAHbKvj/fgmmFY=
=Y4Tw
-----END PGP SIGNATURE-----

--==_Exmh_1147117659_2623P--
