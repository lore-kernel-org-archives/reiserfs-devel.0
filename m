From: Valdis.Kletnieks@vt.edu
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Tue, 18 Feb 2003 16:17:17 -0500
Message-ID: <200302182117.h1ILHHhC000658@turing-police.cc.vt.edu>
References: <3E4AA902.86F15815@interface-ag.com> <b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com> <20030214111829.A21849@namesys.com> <20030214031316.L22930@schatzie.adilger.int> <20030214131746.H10351@namesys.com> <20030214035034.M22930@schatzie.adilger.int> <3E4CF04A.2030904@namesys.com> <20030214120630.O22930@schatzie.adilger.int> <3E4D4129.8040103@namesys.com>
            <20030215153710.A1723@schatzie.adilger.int>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-344515074P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 15 Feb 2003 15:37:10 MST."
             <20030215153710.A1723@schatzie.adilger.int> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

--==_Exmh_-344515074P
Content-Type: text/plain; charset=us-ascii

On Sat, 15 Feb 2003 15:37:10 MST, Andreas Dilger said:

> I guess the shortcoming in the ext2 case is that it counts mounts and
> not crashes.  If it were counting the number of times the filesystem
> was uncleanly shut down instead of normal shutdowns, would that be more
> acceptable?  The reason I'm still interested in crashes, even if they
> are not filesystem-related crashes, is because there had to be _something_
> which caused a crash (bad code, bad hardware, whatever), and once you have
> any driver corrupting memory the chance that it is also corrupting filesystem
> memory exists.

ext2/3 *intentionally* counts mounts rather than crashes.

It's possible for a filesystem to get non-noticably corrupted without
a crash (remember the Linux 2.4.11 mangle-on-shutdown bug?)  - it's stuff
like that (and slowly failing media) that it tries to catch by counting
mounts.
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-344515074P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+UqLdcC3lWbTT17ARAgb0AJ9DmoBWagKrQXwcNKylClH/wnntyQCglVBy
LPgjBRYiSOuf3DgqKCTPvZ4=
=TbdO
-----END PGP SIGNATURE-----

--==_Exmh_-344515074P--
