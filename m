From: Valdis.Kletnieks@vt.edu
Subject: Re: (reiser4)install on root
Date: Fri, 26 Nov 2004 18:02:24 -0500
Message-ID: <200411262302.iAQN2OEM026024@turing-police.cc.vt.edu>
References: <20041126085828.DE0DB37CF0@sitemail.everyone.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-23921024P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22593-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 26 Nov 2004 00:58:28 PST."
             <20041126085828.DE0DB37CF0@sitemail.everyone.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: bluegod@linuxwaves.com
Cc: reiserfs-list@namesys.com

--==_Exmh_-23921024P
Content-Type: text/plain; charset=us-ascii

On Fri, 26 Nov 2004 00:58:28 PST, BLuEGoD said:

>  Hi, i want to know how to install reiser4 on root with only 1 HD.. I use
> mkfs.reiser4 from the reiser4 utils after compile and install kernel & patches
> on a debian woody 2.2.. with a scsi HD, but it crashes (errors found doing
> mkfs.reiser4 on root device and on next boot I saw a kernel panic).. Note: I
> did it with the root mounted.. because i need to boot with that HD..

As several have noted, you can use a spare partition to build a new root
filesystem.  Another option is to use a "rescue disk" or a Knoppix disk
or other CD-based toolset to boot from, and use that to do your mkfs.reiser4.

It's a good idea to *always* have a rescue disk handy, because they enable you
to recover from many problems that will prevent you from booting all the
way to single-user off your production disk (trashed boot block, missing/misnamed
files in /boot, a need to fsck the boot partition, or whatever...)

--==_Exmh_-23921024P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBp7X/cC3lWbTT17ARAswIAKD2etZLq06PYQ3tEoYko7KvNqjI9QCgzmoN
bb3hjOUSBBFVk4hG34MQsg8=
=/Xko
-----END PGP SIGNATURE-----

--==_Exmh_-23921024P--
