From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Where Reiser4 may break?
Date: Thu, 27 May 2004 13:00:05 +0400
Message-ID: <1085648404.1915.219.camel@tribesman.namesys.com>
References: <20040526204457.GJ4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18868-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040526204457.GJ4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-05-27 at 00:44, Markus T=C6rnqvist wrote:
> Hi
>=20
> I was thinking about some potential problems.
>=20
> Actually, Nikita and I had a discussion about the issues with
> cross-architecture compatibility. It would apparently not be easy to
> do, because block size equals page size in Reiser4.
>=20
yes, now moving a hard drive with reiser4 between systems with different
page size is impossible.=20

> Is this common with other file systems?

no

>  I didn't get to ask that
> question so to get an answer :)
>=20
> Just when stuff like FireWire and USB hard drives are getting popular
> and no-one should buy a PC laptop, this may become an issue for
> PPC Linux users...
>=20
> Then, the issues with small and large keys. Is there any need for two
> sizes? Isn't it hazardous that some peoples' systems may cease to
> function because of that? It seems larger keys are far superior...
>=20

Both large and small keys should be supported such that user does not
have to care of compile option
It was made compile option because there was a desire to try it as fast
as possible.

> Any performance issues, anything?
>=20
> Thanks!

