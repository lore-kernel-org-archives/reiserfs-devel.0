From: Andrew Morton <akpm@digeo.com>
Subject: Re: 2.5.46: SCSI and/or ReiserFS v3.6 broken? Kernel panic
Date: Tue, 05 Nov 2002 15:19:59 -0800
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <3DC8521F.47270896@digeo.com>
References: <200211060006.10425.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?iso-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Linux Kernel List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Dieter N=FCtzel wrote:
>=20
> VFS: Cannot open root device "803" or 08:03
> Please append a correct "root=3D" boot option
> Kernel panic: VFS: unable to mount root fs on 08:03
>=20

That was happening to me yesterday as well.  After a bit
of poking around and recompiling, it mysteriously went away.

The same has happened about ten times over the past few months,
and rebuilding the world makes it go away.  On ext3.

Something is definitely fishy.  It's unhelpful that it cures
itself just as you get geared up to fix it.

Does a full rebuild fix it for you?
