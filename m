From: Valdis.Kletnieks@vt.edu
Subject: Re: Using filename-hash as part of key
Date: Mon, 23 Dec 2002 10:49:27 -0500
Message-ID: <200212231549.gBNFnRlK008563@turing-police.cc.vt.edu>
References: <20021223141641.B31759@namesys.com>
            <15878.63735.448875.70027@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1179002449P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12218-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 23 Dec 2002 14:52:23 +0300."
             <15878.63735.448875.70027@laputa.namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com

--==_Exmh_-1179002449P
Content-Type: text/plain; charset=us-ascii

On Mon, 23 Dec 2002 14:52:23 +0300, Nikita Danilov said:

>  >    But as Hans argues, usually these sequentional-read operations are ones
 most
>  >    noticed because they are usually performed by humans:
>  >    ls, tar, copy of a directory and this kind of stuff.
> 
> Humans are so slow compared to the slowest hard drive that ls is the
> least important thing to optimize.

Never had a 26-hour daily backup of a large mail spool, have you? ;)

Remember that 'tar' and copy of a directory are things that are likely to
be done as part of a production workload - and if you aren't using tar,
you still need to have *something* that does a stat() on every single file,
even if it's an incremental.

There's also resource contention issues - many systems are up 24x7, and
things like backups and the like have to be done on live filesystems during
off-peak hours.  This means that if "off-peak" is 9PM-6AM, you have *two*
constraints:  (1) the job has to finish in under 9 hours, (2) It has to consume
few enough resources that nothing else bogs down....
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-1179002449P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+BzCHcC3lWbTT17ARAvl8AKCvzW00YnU5f8cPPZpHsTA/Emyr/QCeLdhE
85gLV3zhSBWcohQoFWLDB/8=
=953v
-----END PGP SIGNATURE-----

--==_Exmh_-1179002449P--
