From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 19:06:16 +0200
Message-ID: <20030605170616.GD22550@vestdata.no>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <20030605090435.GE7950@namesys.com> <1054804624.1997.39.camel@wusel.schnulli.de> <200306052029.41437.russell@coker.com.au> <1054809903.1995.83.camel@wusel.schnulli.de> <3EDF7424.7010003@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EDF7424.7010003@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Heinz-Josef Claes <hjclaes@web.de>, Russell Coker <russell@coker.com.au>, reiserfs-list@namesys.com

On Thu, Jun 05, 2003 at 06:47:32PM +0200, Carl-Daniel Hailfinger wrote:
> Heinz-Josef Claes wrote:
> >From the debian web page:
> >
> > http://packages.debian.org/testing/utils/storebackup.html
> >
> > File comparisons are done with MD5 checksums, so no changes go
> > unnoticed.
>=20
> If you believe the last sentence, I have a bridge to sell.
>=20
> To be more exact: MD5 is a 128=3D2^7 bit hash. Assuming a file length of =
4kB
> =3D 2^8*4096=3D2^20 bits, approximately 2^(2^(20-7))=3D 2^8192=3D 10^2457
> different files have the same hash.

Or explained differently, every time you change a file there is a=20
1/(2^128) chance that the backup-system will not notice.

I would be willing to take the risk.


However, calculating a checksum of all your data is relatively slow -
I'm surprised it doesn't use timestamps. Or maybe it's optional?

(Of course in some situations timestamps can not be relied on, but if
your application is not one of those it should be much much faster)


--=20
Ragnar Kj=F8rstad
Zet.no
