From: Valdis.Kletnieks@vt.edu
Subject: Re: kernel BUG at prints.c:334
Date: Mon, 06 Jan 2003 12:02:57 -0500
Message-ID: <200301061702.h06H2vH2004121@turing-police.cc.vt.edu>
References: <hhr8bv7cm6.fsf@blah.pl> <20030106101149.B1881@namesys.com>
            <3E194161.1070306@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-745526021P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 06 Jan 2003 11:42:09 +0300."
             <3E194161.1070306@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_-745526021P
Content-Type: text/plain; charset=us-ascii

On Mon, 06 Jan 2003 11:42:09 +0300, Hans Reiser said:

> Oleg, please consider finding all of our messages which say I/O error, 
> and adding something that says "i/o errors are almost always due to 
> hardware failure"

I had a sign outside my office, about 4 feet off the ground, that looked like:

         ========================
Your               /|\
clue              / | \
must                |
be at least         |
THIS tall           |
to ride the         |
Internet.           |

>>Jan  1 11:00:29 brzydal kernel:  I/O error: dev 08:21, sector 65704
>>Jan  1 11:00:29 brzydal kernel: zam-7001: io error in reiserfs_find_entry
>>Jan  1 11:00:29 brzydal kernel:  I/O error: dev 08:21, sector 65704
>>Jan  1 11:00:29 brzydal kernel: zam-7001: io error in reiserfs_find_entry

If that combined with an error message from the SCSI/IDE/whatever driver
doesn't make it clear, adding "probably hardware failure" won't impart
any additional clue.  If there isn't a SCSI/IDE/etc message, then that is
a *separate* issue that should be fixed in the driver.
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-745526021P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+GbbBcC3lWbTT17ARAtQXAKCcijYpqbYdC+L1zdk+T02sbKD3CQCdEiGT
6stihtFjxNQcYI57gG+CQjQ=
=FYwo
-----END PGP SIGNATURE-----

--==_Exmh_-745526021P--
