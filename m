From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: performance improvements
Date: Mon, 23 Dec 2002 18:05:19 +0200
Message-ID: <20021223160519.GI13460@hvs.envisage.co.za>
References: <200212231632.26686.russell@coker.com.au> <20021223165909.R1813@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12223-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021223165909.R1813@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ragnar =?iso-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: Russell Coker <russell@coker.com.au>, ReiserFS <reiserfs-list@namesys.com>

On Mon, Dec 23, 2002 at 04:59:09PM +0100, Ragnar Kj=F8rstad wrote:
> On Mon, Dec 23, 2002 at 04:32:26PM +0100, Russell Coker wrote:
> > One thing that could really improve system performance would be somethi=
ng like=20
> > "nice" but for disk IO.
>=20
> Yes, that would be very nice :)
>=20
> Preferably it should use scheduling priority directly, so one doesn't
> have to set a seperate value / use a seperate utility.=20

BTW: In the later (2.4.19 are so) kernels (I'm not if it was with the
pre-empt patches or not), I've noticed that the nice (especially negative
values) make a significant difference in the I/O bandwidth of the
applications (especially mostly sequencial access)

Perhaps test a "nice find /" and/or a "nice -20 pop3d"

GReetz
Hendrik
