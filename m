From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 13:50:50 +0400
Message-ID: <411C8EFA.9020507@namesys.com>
References: <cd32a06204080910256de4cc0e@mail.gmail.com> <200408122138.46787.frbiscani@jumpy.it> <200408130031.13061.vitaly@namesys.com> <200408122308.06962.frbiscani@jumpy.it> <20040813091612.GF13834@backtop.namesys.com> <20040813093119.GI1284@nysv.org> <411C8D45.1000709@namesys.com> <20040813094431.GJ1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20257-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040813094431.GJ1284@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

Hello

Markus T=F6rnqvist wrote:
> On Fri, Aug 13, 2004 at 01:43:33PM +0400, Vladimir V. Saveliev wrote:
>=20
>>I think only empty directory can be refibrated.
>>
>>>Are you thinking about implementing it/is it a matter of time and mone=
y?
>>
>>Reiser4 provides plugin mechanism. Everyone is encouraged to write plug=
ins.
>=20
>=20
> Aren't those two sentences a bit contradictory?-)
>=20
> I mean, if it's possible only to (re)fibrate empty directories, is it
> impossbile to write a means of refibration to a new plugin or the exist=
ing
> plugin? :)
>=20
well, second sentence is not about this certain plugin

as for refibrating a directory - it probably can be done by simple shell =
script

> Thanks!
>=20


