From: "Lex  Jonkers" <jonkersl@Fourtop.nl>
Subject: RE: 2.6.9-3 patch won't compile
Date: Mon, 13 Dec 2004 14:52:57 +0100
Message-ID: <18A36962E684664DB223E403DB64FB220C6807@W23FT01.Fourtop.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hihone@bigpond.net.au
Cc: reiserfs-list@namesys.com

That machine in question was a Debian stable machine with gcc 2.95.4

It compiles flawless on a Debian testing machine with gcc 3.3.4

Thnx for the help Cal and Francesco.

With Regards,
Lex Jonkers

> -----Original Message-----
> From: Cal [mailto:hihone@bigpond.net.au]=20
> Sent: Monday, December 13, 2004 2:04 PM
> To: Lex Jonkers
> Cc: reiserfs-list@namesys.com
> Subject: Re: 2.6.9-3 patch won't compile
>=20
> ----------
> and then at Mon, 13 Dec 2004 13:44:35 +0100, it was written ...
>  >>  >fs/reiser4/plugin/cryptcompress.c: In function=20
> `set_cluster_params':
>  >>  >fs/reiser4/plugin/cryptcompress.c:2203: parse error=20
> before  >> `hole_size'
>  >...
>  >
>  >Any idea why -3 won't compile on a vanilla 2.6.9 ?
>  >-1 and -2 compile without problems.
>  >
>  >With Regards,
>  >Lex Jonkers
>=20
> Looks like maybe a compilation problem.  Where yours dies=20
> with a parse error (cryptcompress.c:2203), mine coughs a=20
> polite warning -
> fs/reiser4/plugin/cryptcompress.c: In function `set_cluster_params':
> fs/reiser4/plugin/cryptcompress.c:2203: warning: ISO C90=20
> forbids mixed declarations and code
>=20
> I'm using gcc (GCC) 3.4.4 20041128 (prerelease) (Debian=20
> 3.4.3-3). I can't help but wonder if my compiler is bigger=20
> than your compiler?
>=20
> cheers, Cal
>=20
