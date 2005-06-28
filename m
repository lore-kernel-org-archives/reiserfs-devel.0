From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: reiser4 plugins
Date: Tue, 28 Jun 2005 16:48:26 -0500
Message-ID: <1119995306.18003.33.camel@gentoo>
References: <20050627092138.GD11013@nysv.org>
	 <200506281344.j5SDixiH003441@laptop11.inf.utfsm.cl>
	 <20050628204709.GH11013@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24781-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050628204709.GH11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Markus =?ISO-8859-1?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Tue, 2005-06-28 at 23:47 +0300, Markus T=F6rnqvist wrote:
> On Tue, Jun 28, 2005 at 09:44:59AM -0400, Horst von Brand wrote:
> >
> >No. But just relying on perfect hardware and concientious sysadmins is
> >reckless. Hardware /is/ flaky, sysadmins /are/ (sometimes) lazy (and
> >besides, today they are increasingly just plain Joe Sixpack users). Also=
,
> >backing up a few hundred GiB is /not/ fun, and then keeping track of all
> >the backups is messy.
>=20
> Even home users have started to set up raid mirrors at home now that
> disk space is cheap. That's a step in the right direction, I
> suppose, with hardware never being good.

I've lost more data to my own recklessness and stupidity than filesystem
corruption and hardware failure combined. RAID isn't really a good
solution. My policy for cheap storage (currently the only variety I own)
is when I buy a new hard drive, use the old drive for backups. The old
drive is always large enough to hold everything I'd miss and then some.
Home users should be capable of doing the same, assuming Windows has
something similar to rsync.

>=20
> Taking backups in an environment where you need a few hundred GiB
> backed up is not that difficult.
>=20
> Get a separate, redundant box with a big tape changer and drop
> periodical backups off at your bank's vault.
>=20
> Get a separate, very reduntant box, with a truckload of proven=20
> drives in a separate raid box and run your stuff there.
>=20
> Get both of the above.
>=20
> If Joe Sixpack loses his mp3 collection, I don't really care,
> nor should anyone else. Anything important enough to care
> about is easy enough to back up. Always.
>=20
> Arrogance? Maybe.
>=20
> >Also, I'm not claiming that they are /solely/ responsible, but not havin=
g
> >the filesystem fall apart utterly every time some bug breaths on it /is/=
 a
> >requirement.
>=20
> Reiserfs does not fall apart utterly every time some bug breaths on it.
>=20
> >> *still trying to understand how that can be*
> >You haven't been around too much yet, do you?
>=20
> Rather I take backups, buy better hardware and understand there's a
> risk involved.
>=20
> Computers as a complete set can't be trusted, you can only make
> the best accomodations you can.
>=20
--=20
Jake Maciejewski <maciejej@msoe.edu>

