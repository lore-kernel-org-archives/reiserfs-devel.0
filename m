From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] data logging patches available for 2.4.21-preX
Date: 27 Jan 2003 13:33:22 -0500
Message-ID: <1043692402.15680.58.camel@tiny.suse.com>
References: <200301271914.26312.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12511-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200301271914.26312.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Linux Kernel List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, "J.A. Magallon" <jamagallon@able.es>

On Mon, 2003-01-27 at 13:14, Dieter N=FCtzel wrote:

> Hello Chris,
>=20
> as always very nice work!
> I have it now running fine on top of 2.4.21-pre3-jam3 (2.4.21-pre3aa1).
> Some fiddling was necessary but went smooth after all.
> My /home partition is mounted with -o data=3Dordered and the performance =
is=20
> great. Sorry, no real benchmarks, yet.
>=20

Thanks for trying them out.

> But some question stay open:
> Where is 01-akpm-sync_fs-fix-2.diff

01-akpm-sync_fs-fix-2.diff is in the 2.4.21 data logging directory you
linked to below.

>  and 01-iput-deadlock-fix.diff?

This is in the namesys pending directory, but doesn't apply cleanly
yet.  I'm rediffing both the quota code and the data logging code on top
of 01-iput-deadlock-fix (or I might just steal Manuel's rediff, which is
still in my linuxworld backlog). =20

> Isn't it needed anylonger 'cause you merged them and SuSE's ftp isn't upd=
ated=20
> yet? All files are the "old" one's from 15. January.
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21
>=20
> What about patch-2.4.20.rfs.06.05-transaction-overflow-fix-0.diff?
> Should I put it on top, too?

That is included in 05-data-logging-33.

-chris

