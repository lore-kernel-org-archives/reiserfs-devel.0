From: Valdis.Kletnieks@vt.edu
Subject: Re: corrupted fs: bitmap does not match to the correct one....
Date: Wed, 15 May 2002 13:04:35 -0400
Message-ID: <200205151704.g4FH4Zh6004751@turing-police.cc.vt.edu>
References: <20020515180609.A2073@namesys.com>
            <10725.1021478209@www24.gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_101163830P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Wed, 15 May 2002 17:56:49 +0200."
             <10725.1021478209@www24.gmx.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: grobe@gmx.net
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

--==_Exmh_101163830P
Content-Type: text/plain; charset=us-ascii

On Wed, 15 May 2002 17:56:49 +0200, grobe@gmx.net said:

> That's funny. As I mentioned, we use a Serveraid 4m Raid Controller. So, if
> a disk fails, the controller switches it off, sends me a warning messages and
> downgrades from RAID5 to RAID0. But the controller tells me that there are
> no errors. It seams to be something in the driver-kernel-lvm-chain.

I once had the joy of getting dragged in after the fact to recover a 100G
database, after the RAID controller had gotten just a *bit* confused over
which disk was which and wrote all of its cache memory into the correct
block numbers on the wrong disks.

It then had the temerity to say that *it* was fine, but that multiple disks
had just gone to the Great Bit Bucket in the Sky.


-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_101163830P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE84pUjcC3lWbTT17ARAoD8AJ4syAJgOP2oeUGCSTkzDz6e3iFpCgCfQxCN
szJoaT10Wt2iChoD0pNbT3E=
=q+7t
-----END PGP SIGNATURE-----

--==_Exmh_101163830P--
