From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Where Reiser4 may break?
Date: Thu, 27 May 2004 14:44:10 +0400
Message-ID: <1085654650.1915.287.camel@tribesman.namesys.com>
References: <20040526204457.GJ4990@nysv.org>
	 <1085648404.1915.219.camel@tribesman.namesys.com>
	 <20040527092541.GN4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040527092541.GN4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

On Thu, 2004-05-27 at 13:25, Markus T=C6rnqvist wrote:
> On Thu, May 27, 2004 at 01:00:05PM +0400, Vladimir Saveliev wrote:
>=20
> >yes, now moving a hard drive with reiser4 between systems with different
> >page size is impossible.=20
> >> Is this common with other file systems?
> >no
>=20
> Well, we'll see what the future brings in this.
> I couldn't care less about architecture-compatibility, but then again,
> I may start caring if the situation demands it :)
>=20
> >Both large and small keys should be supported such that user does not
> >have to care of compile option
> >It was made compile option because there was a desire to try it as fast
> >as possible.
>=20
> This is good news.
> Would the file system/kernel then decide which key size to use and
> where? What is the logic?
>=20

IMHO: size of key should be selectable on mkfs.reiser4 time. Kernel on
mount should be able to detect key format

> Hope you get it working!
>=20
> Thanks

