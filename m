From: Chris Mason <mason@suse.com>
Subject: Re: Very very slow rm/unlink of large sparse files
Date: Mon, 16 Feb 2004 10:59:29 -0500
Message-ID: <1076947168.2931.10.camel@watt.suse.com>
References: <4030391F.5080204@lig.net>
	 <200402161506.51895.Dieter.Nuetzel@hamburg.de>
	 <1076941748.2482.1249.camel@watt.suse.com>
	 <200402161649.33592.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16809-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402161649.33592.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, "Stephen D. Williams" <sdw@lig.net>

On Mon, 2004-02-16 at 10:49, Dieter N=FCtzel wrote:
> Am Montag, 16. Februar 2004 15:29 schrieb Chris Mason:
> > On Mon, 2004-02-16 at 09:06, Dieter N=C3=BCtzel wrote:
> > > INSTALL/SOURCE> time rm sparse
> > > 0.000u 10.684s 2:15.11 7.9%     0+0k 0+0io 0pf+0w
> > >
> > > 'rm' time is lost in 'io_schedule' and 'down'.
> >
> > Dieter, could you please try with this (shamefully untested and
> > uncompiled) patch:
> >
>=20
[ no compile in the backround ]

> INSTALL/SOURCE> time rm sparse
> 0.000u 4.483s 0:04.48 100.0%    0+0k 0+0io 0pf+0w
>=20
> Mouse behavior is the same.
>=20
Very choppy?  Ok, I didn't expect that to change, but it is fixable.

> With compilation in the "background":

> INSTALL/SOURCE> time rm sparse
> 0.000u 4.546s 0:04.86 93.4%     0+0k 0+0io 0pf+0w

So, just to make sure I'm comparing things correctly, the time to rm the
large file with a compile in the background went from over two minutes
to 4 seconds?

If so, the improvement is from a stupid bug fixed in 2.4.x, basically we
were trying to start a huge transaction, which was always forcing the
current transaction to end, which made for tiny transactions, which are
really slow.

-chris


