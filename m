From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: Horrible ftruncate performance
Date: Sat, 12 Jul 2003 07:16:31 +0200
Message-ID: <3F0F99AF.1030502@gmx.net>
References: <Pine.LNX.4.30.0307120213080.30730-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14907-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.30.0307120213080.30730-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: =?ISO-8859-2?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, Marc-Christian Petersen <m.c.p@gmx.net>, reiserfs-list@namesys.com, =?ISO-8859-2?Q?Philippe_Gramoull=E9?= <philippe.gramoulle@mmania.com>

Szakacsits Szabolcs wrote:
> On Fri, 11 Jul 2003, Dieter [iso-8859-1] N=FCtzel wrote:
>=20
>>More than 506 times...
>>=3D> 506.34 seconds (8:26.34) / 0.01 seconds =3D 50.634 times ;-)))
>=20
> I guess you mean 50,634 or 50634 times faster? But I'm afraid you didn'=
t
> test what you should have. Interestingly, the above speedup, 50 times, =
is
> just what I got with Oleg's patch. So now it's only about 2000 times sl=
ower
> than XFS, JFS and ext3.

This is an i18n issue. In Germany, the meaning of "." and "," in numbers
is just the reverse of U.S. usage. Of course, we Germans argue the U.S. d=
o
it backwards.
Pi=3D3,14159265....
fifty thousand six hundred thirty four=3D50.634


Carl-Daniel

