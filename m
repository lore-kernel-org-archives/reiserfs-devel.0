From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: mount throws a nikita-3228 on me
Date: Tue, 25 May 2004 12:55:35 +0400
Message-ID: <20040525085535.GE1583@backtop.namesys.com>
References: <20040525080001.GF4990@nysv.org> <1085473856.1915.99.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1085473856.1915.99.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>, reiserfs-list@namesys.com

On Tue, May 25, 2004 at 12:30:57PM +0400, Vladimir Saveliev aka Monstr wrot=
e:
> Hello
>=20
> On Tue, 2004-05-25 at 12:00, Markus T=F6rnqvist wrote:
> > Hi
> >=20
> > I took a snapshot from the Namesys BK some days ago, compiled the
> > 2.6.6-mm2 with high hopes of the future, but it doesn't mount.
> >=20
> > It says only small keys are supported. I think it was a Nikita-3228.[1]
> >=20
>=20
> You seem to get reiser4 with an error which makes reiser4 to not compile
> properly.

it was missing=20
#include <linux/config.h> in reiser4.h

I just added it to our BK.

=20
--=20
Alex.
