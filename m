From: Valdis.Kletnieks@vt.edu
Subject: Re: Raid5, LVM and Reiserfs
Date: Mon, 21 Oct 2002 00:49:02 -0400
Message-ID: <200210210449.g9L4n50g022158@turing-police.cc.vt.edu>
References: <000701c277c9$ef8d6c70$0101a8c0@bummer>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1024624540P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sun, 20 Oct 2002 07:47:50 +0800."
             <000701c277c9$ef8d6c70$0101a8c0@bummer> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: darren <teodarren@myrealbox.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_1024624540P
Content-Type: text/plain; charset=us-ascii

On Sun, 20 Oct 2002 07:47:50 +0800, darren <teodarren@myrealbox.com>  said:

> Due to the bad performance (or so I heard on google) of the hardware
> raid controller, I would like to use software raid5. 

You may wish to verify further.  Has the hardware raid controller been
identified as being slower than *software* RAID-5?  (Remember - if you do
it in software, you have to do a disk write per disk).  Or is the RAID
controller merely "not as fast as other hardware RAID controllers)?
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_1024624540P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9s4c+cC3lWbTT17ARAuW5AKCGDTmasnMUBKU3ZmVEfVMPaw+o9QCeOTEX
qsYiW+B39UrcdxzwtaeXj/M=
=urAO
-----END PGP SIGNATURE-----

--==_Exmh_1024624540P--
