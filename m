From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.19-pre7.pending 01-05 didn't make it's way
	into -pre8?
Date: 03 May 2002 09:18:07 -0400
Message-ID: <1020431887.1510.190.camel@tiny>
References: <200205031448.56202.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10223-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200205031448.56202.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Oleg Drokin <green@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, 2002-05-03 at 08:48, Dieter N=FCtzel wrote:
> Only for notification and up-to date info.
> Seems that 06 is in, Chris?

I started getting daily reports of some people hitting that on
sledgehammer and s390, so it got sent in before the others.

> Do all of the above patches apply clean against
> linux-2.4.19p7-compound-speedup-2.patch and
> linux-2.4.19p7-iicache-new-15.patch
>=20
> Please resend to Marcello, again.
>=20
> What about all the "pending" quota stuff?
> Without it Linux (*nix) is mostly "useless" for "comporate computing".
>=20
> Shouldn't you try harder to get this in, too?
>=20
> Even all (?) current SuSE (one of the main ReiserFS promoter) release ker=
nels=20
> do not include the quota stuff. Why?

The new quota patches require a quota utilities upgrade, so they won't
go into a stable kernel series.  Jan Kara recently started on a version
of the new quota stuff that worked with the old utils.

The suse kernels do include the quota patches (which is the main reason
I keep the reiserfs bits up to date ;-)

-chris


