From: Valdis.Kletnieks@vt.edu
Subject: Re: [2.4.18]: Reiserfs: vs-2120: add_save_link: insert_item returned -28
Date: Fri, 16 Jan 2004 11:19:36 -0500
Message-ID: <200401161620.i0GGK2MT022923@turing-police.cc.vt.edu>
References: <200401091622.41352.lkml@kcore.org>
            <1074241063.2251.41.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1102226752P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16551-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 16 Jan 2004 11:17:43 +0300."
             <1074241063.2251.41.camel@tribesman.namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vladimir Saveliev <vs@namesys.com>
Cc: Jan De Luyck <lkml@kcore.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--==_Exmh_-1102226752P
Content-Type: text/plain; charset=us-ascii

On Fri, 16 Jan 2004 11:17:43 +0300, Vladimir Saveliev said:

> This is just a warning. You should be able to free some disk space by
> removing some files.

Is this just the *obvious* "removing files frees space", or is there some sort
of garbage collection that will be triggered, so removing a 1K file will make it
redo tables/linked lists/whatever and return lots of blocks that used to contain
metadata?

--==_Exmh_-1102226752P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFACA8XcC3lWbTT17ARAhaVAJ4onS9kKbySzuveEDM3l98KeI0kawCg5DpO
S+A+4NQPzC+wcq2XXuTvrZk=
=duJP
-----END PGP SIGNATURE-----

--==_Exmh_-1102226752P--
