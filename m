From: Valdis.Kletnieks@vt.edu
Subject: Re: Sleeping harddrives?
Date: Sun, 02 Jun 2002 16:37:13 -0400
Message-ID: <200206022037.g52KbDxw002602@turing-police.cc.vt.edu>
References: <19839880843.20020602023406@tnonline.net>
            <20020602214927.A17000@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1118636612P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10481-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Sun, 02 Jun 2002 21:49:27 +0400."
             <20020602214927.A17000@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_-1118636612P
Content-Type: text/plain; charset=us-ascii

On Sun, 02 Jun 2002 21:49:27 +0400, Oleg Drokin <green@namesys.com>  said:
> On Sun, Jun 02, 2002 at 02:34:06AM +0200, Anders Widman wrote:
> >    I  remember that I tested this about a year ago, and it didn't work
> >    very well. The filesystem timeout was shorter than the time to spin
> >    up the drive.
> Huh? What filesystem timeout?

I think Anders hit a timing hole.

Quite often, high-end drives have a "delay spin-up based in SCSI ID" feature,
so all the drives numbered 0 spin up immediately, all the drives numbered 1
spin up after 5 seconds delay, all the drives numbered 2 wait 10 seconds, etc.
This is to prevent the spin-up surge from blowing out the power supply if
a very large RAID array all tries to spin up at once (the current needed to
accelerate the drive to 10K RPM is on the order of 3-4 times what is required
to KEEP it spinning at that speed).

Unfortunately, if you're drive number 14, you have a 70 second wait before you
spin up - and if your boot devices was on drive 0 (and quite possibly on a
previously-spun-up drive), it's quite possible that the system will boot and
manage to fsck the lower-numbered drives before you spin up.  So you look like
a "dead" drive... Whoops.

I suspect the same thing could happen with a hot-swap SCSI drive - plug it
in, run to the console, and type "fsck" or "mount" before the drive has spun up
(especially if as before, it's drive 14 and set to delay spin up).

-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech




--==_Exmh_-1118636612P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE8+oH5cC3lWbTT17ARAo3IAJ93CzTMEqTaTDXwxOBSE4ccmKzJkwCaA7wz
zGJICshO+a/PZKWe4RfZG1Q=
=p6GA
-----END PGP SIGNATURE-----

--==_Exmh_-1118636612P--
