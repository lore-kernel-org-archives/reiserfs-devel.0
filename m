From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Problem mounting fs after a crash
Date: Tue, 27 Aug 2002 13:37:40 +0400
Message-ID: <200208271337.40235.vitaly@namesys.com>
References: <4.3.1.2.20020826165410.030df008@mail.hlf.net> <4.3.1.2.20020826204023.030e3058@mail.hlf.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4.3.1.2.20020826204023.030e3058@mail.hlf.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserml <reiserml@hlf.net>
Cc: reiserfs-list@namesys.com


Hi,

could you run debugreiserfs -p /dev/vg2/video | bzip -c >=20
video.bz2

and send me this bziped file, it will let me to debug the problem=20
locally.=20

> > > i have a big problem
> > >
> > > after my system crachs i=B4m unabel to mount my disk again
> > > the disk is a VG with 3 * 80 GB HD`s if i try to mount
> > >
> > > mount -t reiserfs /dev/vg2/video /video
> > >
> > > i get
> > > Segmantation Fault

Do you see anything related in syslog?

> > > i use Suse Linux 7.2 Kernel 2.4x
=20
--=20

Thanks,
Vitaly Fertman
