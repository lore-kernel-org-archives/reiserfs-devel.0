From: Pierre =?UTF-8?B?RXRjaGVtYcOvdMOp?= <petchema@concept-micro.com>
Subject: Re: Howto make reiser-3.6 a bit more standby friendly?
Date: Wed, 24 Aug 2005 00:16:41 +0200
Message-ID: <20050824001641.3a11e870.petchema@concept-micro.com>
References: <194f62550508230539a1c81d9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25630-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f62550508230539a1c81d9@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Tue, 23 Aug 2005 14:39:15 +0200, Clemens Eisserer <linuxhippy@gmail.com>=
 a =C3=A9crit :

> Hi there,
>=20
> I am currently tinkering a idn-router which a harddrive which should
> mostly be in stand-by.
> However it seems the drive is rather unimpressed by a 5s timeout
> setting specified with hdparm and goes in standby very seldom although
> the computer is runnig 100% idle (even no isdn-services started or
> anything else).

Have you tried noflushd ?
On recent kernels, it mainly tweaks /proc/sys/vm/dirty_writeback_centisecs.=
..
