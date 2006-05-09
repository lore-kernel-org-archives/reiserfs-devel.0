From: Valdis.Kletnieks@vt.edu
Subject: Re: bad bread
Date: Tue, 09 May 2006 14:46:44 -0400
Message-ID: <200605091846.k49IkiUt004760@turing-police.cc.vt.edu>
References: <20060505062801.402beb50.boricua@despiertapr.com> <20060507005618.GA21557@rvalles.homedns.org> <op.s8595uohcigqcu@apollo13> <200605081947.k48JldJd029006@turing-police.cc.vt.edu>
            <op.s886w6tlcigqcu@apollo13>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1147200403_2812P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28599-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 09 May 2006 00:18:32 +0200."
             <op.s886w6tlcigqcu@apollo13>
List-Id: <reiserfs-devel.vger.kernel.org>
To: PFC <lists@peufeu.com>
Cc: rvalles <rvalles@es.gnu.org>, reiserfs-list@namesys.com, boricua@despiertapr.com

--==_Exmh_1147200403_2812P
Content-Type: text/plain; charset=us-ascii

On Tue, 09 May 2006 00:18:32 +0200, PFC said:

> 	Linux RAID has a special option for that : you can trigger a check, which  
> will re-read the entire disks and, if a read error occurs, re-write the  
> failing sector with good data from the other drives in the RAID. The drive  
> with the bad sector will then remap it to another sector.

If you have 2 mirrored disks, and are replacing one, you don't have a good
block to read it from.  The failure mode was a RAID controller that didn't
properly handle re-writing the bad block on the first disk, so when the
second disk got a bad block, you were screwed....


--==_Exmh_1147200403_2812P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFEYOOTcC3lWbTT17ARAnx8AKC62ftcYqSHwW2r5Sr/qhH221gAxQCgsLN5
tdB0oP+y6I+ac3ksY021gc4=
=3oeS
-----END PGP SIGNATURE-----

--==_Exmh_1147200403_2812P--
