From: "Lex  Jonkers" <jonkersl@Fourtop.nl>
Subject: RE: 2.6.9-3 patch won't compile
Date: Mon, 13 Dec 2004 13:44:35 +0100
Message-ID: <18A36962E684664DB223E403DB64FB220C6806@W23FT01.Fourtop.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hihone@bigpond.net.au
Cc: reiserfs-list@namesys.com

>  >I'm having problems compiling 2.6.9-3 patch:
>  >...
>  >fs/reiser4/plugin/cryptcompress.c: In function `set_cluster_params':
>  >fs/reiser4/plugin/cryptcompress.c:2203: parse error before=20
> `hole_size'
>  >fs/reiser4/plugin/cryptcompress.c:2204: `hole_size'=20
> undeclared (first use in this function)=20
> >fs/reiser4/plugin/cryptcompress.c:2204: (Each undeclared=20
> identifier is reported only once
> >fs/reiser4/plugin/cryptcompress.c:2204: for each function it appears=20
> >in.)
>  >make[2]: *** [fs/reiser4/plugin/cryptcompress.o] Error 1
>  >make[1]: *** [fs/reiser4] Error 2
>  >make: *** [fs] Error 2
>  >
>  >
>  >Are these patches stand-alone or incremental?
>=20
> If you mean the namesys 2.6.9-[1-3] patches, they're=20
> standalone. 2 and 3 are good, 3 is probably  the better.
>=20
> Cal
>=20

yes i ment the namesys 2.6.9-[1-3] patches.

Any idea why -3 won't compile on a vanilla 2.6.9 ?
-1 and -2 compile without problems.

With Regards,
Lex Jonkers
