From: Valdis.Kletnieks@vt.edu
Subject: Re: 13000Gig partition badblock check is the same -- do a reiserfsck again ?
Date: Thu, 02 Jun 2005 17:03:10 -0400
Message-ID: <200506022103.j52L3A9A012873@turing-police.cc.vt.edu>
References: <1117392967.29669.ezmlm@namesys.com> <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu> <429AAFDC.4050208@mh.be> <429C6BE8.4090906@teleformix.com> <429C7153.8000008@mh.be> <429C7E46.9090507@teleformix.com> <429F199A.5020900@mh.be>
            <429F17A2.2070102@teleformix.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1117746190_7632P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24293-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 02 Jun 2005 09:28:50 CDT."
             <429F17A2.2070102@teleformix.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Dan Oglesby <doglesby@teleformix.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_1117746190_7632P
Content-Type: text/plain; charset=us-ascii

On Thu, 02 Jun 2005 09:28:50 CDT, Dan Oglesby said:

> latest versions.  Took two days to run, but it completed, and I ended up 
> only losing 2 files out of over 1.1 million files on a 1TB RAID-5 
> array.  That's not too bad, considering how many times the machine went 
> up and down due to bad power in the building.

Buy a UPS. Now.  Even if it's just a big battery that will only keep you
running for 10 mins - at least that will give you enough time to do a clean
shutdown -h rather than get stuff trashed.

If you can't get money for it, just point at the lost-productivity costs
the *next* time the terabyte takes 2 days to recover.. and remind the boss that
you could be down for 2 days every time the lights flicker.. ;)

--==_Exmh_1117746190_7632P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCn3QOcC3lWbTT17ARAjGDAJ9PZ4C6owgk4EbCwP17OEQ2KaxYPQCeIedH
jx+Tu9USOfMRhY7Zrao8Q6o=
=OZE4
-----END PGP SIGNATURE-----

--==_Exmh_1117746190_7632P--
