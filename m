From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: ent:sdXnn going to D state with latest reiser4 patch
Date: Sun, 18 Sep 2005 23:31:19 +0200
Message-ID: <432DDCA7.5060009@free.fr>
References: <20050918202904.GA3025@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig0BC646586770CBB0DC50E372"
Return-path: <reiserfs-list-return-26045-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050918202904.GA3025@localhost.localdomain>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------enig0BC646586770CBB0DC50E372
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le 18.09.2005 22:29, Damien Wyart a =E9crit :
> Hello,
>=20
> Doing some tests with latest reiser4 patches from 2.6.14-mm1, I noticed=

> that the load of the machine never goes under 2. It comes from two
> processes related to reiser4 and going to D state immediately after the=

> filesystems are mounted. As there are two reiser4 partitions, I get two=

> such processes, and the load is always higher than 2. These processes
> appear as ent:sdb7 and ent:sdb11 (correspnding fs are on sdb7 and sdb11=
)
> and same with square brackets sometimes.
>=20
> I can reproduce this with 2.6.14-rc1-git4 and 2.6.13.2, with the latest=

> patch. I do not have this problem with previous reiser4 patch
> (2.6.13-mm3 + latest reiser4-only.1.patch from ftp.namesys.com.
>=20
> I guess people doing simple tests of this patch will see this behaviour=
,
> and I am surprised nobody seems to have posted about this on the list.
>=20

Hello Damien,=20

I didn't notice an extra load here (Linux version 2.6.14-rc1-mm2 (laurent=
@antares.localdomain) (gcc version 4.0.1 (4.0.1-5mdk for Mandriva Linux r=
elease 2006.0)) #130 Sat Sep 17 10:26:06 CEST 2005). But, I can confirm t=
hat "ent:hda8" is always in D state.

[notice the *mm2* ? I'm using http://www.zip.com.au/~akpm/linux/patches/s=
tuff/2.6.14-rc1-mm1.5.gz which is kinda rc1-mm1 without big input/sysfs c=
hanges]

Furthermore reiser4 prevents the box from suspending to disk. Found in lo=
g while suspending :
Restarting tasks...<6> Strange, ent:hda8. not stopped

~~
laurent


--------------enig0BC646586770CBB0DC50E372
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDLdyyUqUFrirTu6IRAkEFAKCXV3hvh9H7qQZKSGUMwBVwGmEtQACgwS5m
d/YqEQKn9jBv/aFY0ebeIus=
=hLR4
-----END PGP SIGNATURE-----

--------------enig0BC646586770CBB0DC50E372--

