From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiserfs+acl makes processes hang?
Date: Mon, 18 Jul 2005 12:55:02 -0400
Message-ID: <42DBDEE6.4060901@suse.com>
References: <1121628031.28770.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1121628031.28770.3.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Tarmo_T=E4nav?= <tarmo@itech.ee>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tarmo T=E4nav wrote:
> Hi,
>=20
> (I've already sent this to lkml and the bug has been confirmed
> a couple of times, but I though I should also send it to
> reiserfs-list so here goes:)
>=20
>=20
> I think I've found a bug in reiserfs acls. If triggered
> it means that any program trying to access the partition,
> where the bug occured, will just hang in D state, with
> no way to kill the program.
>=20
> Here's how to reproduce:
> 1. mount a reiserfs volume (loopmount will do) with "-o acl".
> 2. create a directory "dir"
> 3. set some default acl: setfacl -d -m u:username:rwX dir
> 4. cd dir
> 5. dd if=3D/dev/zero of=3Dsomefile1 bs=3D4k count=3D100000
> (the idea is to run out of space)
> 6. now df should show 0 free space, if not then repeat 5.
> 7. echo "1" > somefile2 # this should hang infinitely
>=20
> Now no program will be able to access the partition.
>=20
> I haven't tried to reproduce it, but the same problem also happened
> when a user hit his hard quota limit on my server. Then no program
> could access his homedir.
>=20
>=20

Ok, this is due to the iput in the reiserfs_new_inode failure path
calling reiserfs_delete_xattrs with the lock already held.

I'll post a patch soon.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFC297mLPWxlyuTD7IRAjO6AJ4wgkdvMnHVablWE7vBL1f+nwJhSACgmG7F
icjFXLkoAIPOVUa02yR7Ys4=3D
=3D1Nkh
-----END PGP SIGNATURE-----
