From: Chris Mason <mason@suse.de>
Subject: Re: [PATCH] updated data=ordered patch for 2.6.3
Date: Tue, 02 Mar 2004 21:12:56 -0500
Message-ID: <1078279975.3931.122.camel@watt.suse.com>
References: <1077165373.22253.45.camel@watt.suse.com>
	 <200403022053.56904.Dieter.Nuetzel@hamburg.de>
	 <1078257997.3928.55.camel@watt.suse.com>
	 <200403022206.08495.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17022-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403022206.08495.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, Christophe Saout <christophe@saout.de>

On Tue, 2004-03-02 at 16:06, Dieter N=FCtzel wrote:
> Am Dienstag, 2. M=E4rz 2004 21:06 schrieb Chris Mason:
> > On Tue, 2004-03-02 at 14:53, Dieter N=FCtzel wrote:
> > > Ups, data-logging IS already in SuSE's 2.6.3-16 kernel ;-)
> >
> > Yes ;-)
>=20
> Brave men.
>=20
> Some numbers:
> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=3D1
> 1+0 Records ein
> 1+0 Records aus
> 0.001u 2.592s 0:04.39 58.9%     0+0k 0+0io 0pf+0w
> time rm sparse
> 0.000u 4.516s 0:04.52 99.7%     0+0k 0+0io 0pf+0w
>=20
> Mouse movement and X server (screen update) works but is very slow (chopp=
y)=20
> for the "know" four seconds.
> But much better than before.
>=20
Oh, part of the delete code was missed in the latency fixes.  I'll add a
few more schedules.

Sorry for the delay, I'm chasing a strange bug, not sure if it is mine
yet. =20

-chris


