From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: reiser4 ; regressions in 2.6.14-rc1-mm1
Date: Fri, 30 Sep 2005 12:08:41 +0200
Message-ID: <433D0EA9.5070407@free.fr>
References: <dgpm57$i5s$1@sea.gmane.org> <200509242311.50652.zam@namesys.com> <43369F2E.7060306@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26354-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43369F2E.7060306@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Le 25.09.2005 14:59, Laurent Riffard a =E9crit :
>=20
> Le 24.09.2005 21:11, Alexander Zarochentsev a =E9crit :
>=20
>>>On Tuesday 20 September 2005 22:58, Laurent Riffard wrote:
>>>
>>>
>>>>Hello,
>>>>
>>>>In kernel 2.6.14-rc1-mm1, Reiser4 present 2 regressions with regard to
>>>>2.6.13-mm1 :
>>>>
>>>>A) Suspend-to-disk does not work because the process "[ent:hda8]" can't=
 be
>>>>stopped.
>>>>
[snip]
>>>>
>>>>B) Can't mount a loop file on reiser4 :
>>>>
[snip]

Good news : these 2 regressions are fixed in 2.6.14-rc2-mm2.

thanks, reiserfs team
~~
laurent
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDPQ6pUqUFrirTu6IRAmOVAJ9mloROdy6SfLS1L2CECVhgkdAlWwCeJQmP
1K+SwdCaWpZhIBP2XW8mnqc=3D
=3D/hV+
-----END PGP SIGNATURE-----
