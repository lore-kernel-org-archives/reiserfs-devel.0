From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 21:51:05 +0200
Message-ID: <200307112151.05829.Dieter.Nuetzel@hamburg.de>
References: <20030710052931.GA17957@namesys.com> <200307111927.06650.Dieter.Nuetzel@hamburg.de> <1057948369.13318.69.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14902-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1057948369.13318.69.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, Marc-Christian Petersen <m.c.p@gmx.net>, Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com, Philippe =?iso-8859-1?q?Gramoull=E9?= <philippe.gramoulle@mmania.com>

Am Freitag, 11. Juli 2003 20:32 schrieb Chris Mason:
> On Fri, 2003-07-11 at 13:27, Dieter N=FCtzel wrote:
> > > 2.5 porting work has restarted at last, Oleg's really been helpful wi=
th
> > > keeping the 2.4 stuff up to date.
> >
> > Nice but.
> >
> > Patches against latest -aa could be helpful, then.
>
> Hmmm, the latest -aa isn't all that latest right now.

True.

2.4.21-jam1 has 2.4.21pre8aa1 plus several other stuff.

> Do you want something against 2.4.21-rc8aa1 or should I wait until andrea
> updates to 2.4.22-pre something?

I think the later is better.

Up and running with "hand crafted" stuff ;-)

As reminder the old numbers (single U160, IBM 10k rpm):

2.4.21-jam1 (aa1) plus all data-logging

SOURCE/dri-trunk> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G cou=
nt=3D1
0.000u 362.760s 8:26.34 71.6%   0+0k 0+0io 124pf+0w

It was runinng with a paralell C++ (-j20) compilation.


Now the new ones (I've test with and without above C++ compilation ;-)

INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse2 bs=3D1 seek=3D200G coun=
t=3D1
1+0 Records ein
1+0 Records aus
0.000u 0.010s 0:00.00 0.0%      0+0k 0+0io 153pf+0w
INSTALL/SOURCE> l
insgesamt 19294
drwxrwxr-x    2 root     root          192 Jul 11 21:46 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
=2Drw-r--r--    1 nuetzel  users     1696205 Jul  3 01:32 atlas3.5.6.tar.bz2
=2Drw-r--r--    1 nuetzel  users     2945814 Jul  2 02:53 k3b-0.9pre2.tar.gz
=2Drw-r--r--    1 nuetzel  users    15078557 Jul  2 03:04 movix-0.8.0rc2.ta=
r.gz
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 11 21:46 sparse2

More than 506 times...

=3D> 506.34 seconds (8:26.34) / 0.01 seconds =3D 50.634 times ;-)))

GREAT stuff!

Thanks,
	Dieter

