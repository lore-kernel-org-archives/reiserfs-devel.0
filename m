From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: [patch] Repacker stats
Date: Sat, 23 Oct 2004 10:33:29 +0200
Message-ID: <200410231033.29164.christian.mayrhuber@gmx.net>
References: <200410202159.46110.sikkh@wp.pl> <1378615689.20041022193803@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1378615689.20041022193803@tnonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Friday 22 October 2004 19:38, Spam wrote:
>=20
>   Hello,
>=20
>   I was interested in testing the repacker statistics tool that Piotr
>   Neuman wrote (and others later added to). But from what I can see
>   the repacker is disabled in 2.6.9-rc4-mm1, because of this patch:
>=20
>     =20
http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.9-rc4/2.6.9-=
rc4-mm1/broken-out/reiser4-disable-repacker.patch
>=20
>   Is there something wrong with the repacker that is has to be
>   disabled?
>=20
>   ~S
>  =20
> > Hi
>=20
> > This is my second attempt at repacker statistics, this time based on=20
comments
> > from Alex Zarochentsev (thanks ;-).
>=20
> > This patch allows reading of repacker stats while it is working. It=20
creates
> > two files in repacker sysfs hierarchy: formatted_nodes and=20
unformatted_nodes,
> > which correspond to the stats that repacker prints after it has finishe=
d.
>=20
> > Download:
>=20
> > http://kem.p.lodz.pl/~peter/reiser4_repacker_stats-2.patch
>=20
> > Regards
>=20
> > Piotr Neuman
> =B4
>=20
> --=20
>=20

Currently the repacker is known to corrupt the filesystem, that's
why it's disabled, I guess.

=2D-=20
lg, Chris

