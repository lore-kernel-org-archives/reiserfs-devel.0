From: David Lang <david.lang@digitalinsight.com>
Subject: Re: Reiser vs EXT3
Date: Thu, 31 Oct 2002 17:16:25 -0800 (PST)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0210311714040.25405-100000@dlang.diginsite.com>
References: <200210312352.07122.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <200210312352.07122.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?iso-8859-1?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Jeff Garzik <jgarzik@pobox.com>, Hans Reiser <reiser@namesys.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Reiserfs-List@namesys.com

One thing that concerns me is the warning to only use a filesystem crea=
ted
in a certin way for the benchmark, don't use a tar of an ext2/3 filesys=
tem
as that will kill performance.

they say taht there will be a tool to fix this in 4.1, but this makes m=
e
treat the benchmark as a 'best possible' test case and expect the
real-world performance to be considerably worse (how much worse who kno=
ws,
I haven't seen anyone try to do worst-case performance tests on it)

David Lang


 On Thu, 31 Oct 2002, Dieter [iso-8859-15] N=FCtzel wrote:

> Date: Thu, 31 Oct 2002 23:52:07 +0100
> From: "Dieter [iso-8859-15] N=FCtzel" <Dieter.Nuetzel@hamburg.de>
> To: Jeff Garzik <jgarzik@pobox.com>
> Cc: Hans Reiser <reiser@namesys.com>,
>      Linux Kernel <linux-kernel@vger.kernel.org>, Reiserfs-List@names=
ys.com
> Subject: Re: Reiser vs EXT3
>
> Am Donnerstag, 31. Oktober 2002 22:05 schrieb Jeff Garzik:
> > Hans Reiser wrote:
> >
> > > If you want to talk about 2.6 then you should talk about reiser4 =
not
> > > reiserfs v3, and reiser4 is 7.6 times the write performance of ex=
t3
> > > for 30 copies of the linux kernel source code using modern IDE dr=
ives
> > > and modern processors on a dual-CPU box, so I don't think any amo=
unt
> > > of improved scalability will make ext3 competitive with reiser4 f=
or
> > > performance usages.
> >
> > What is the read performance like?
>
> From his mentioned paper http://www.namesys.com/v4/fast_reiser4.html,=
 it is
> more then doubled compared to ext3 and ReiserFS v3.
>
> To be fair he should explain if it was compared to the latest ext3 (h=
tree)
> stuff or not, yet.
>
> It looks truly impressive.
>
> Regards,
>         Dieter
>
> --
> Dieter N=FCtzel
> Graduate Student, Computer Science
>
> University of Hamburg
> Department of Computer Science
> @home: Dieter.Nuetzel at hamburg.de (replace at with @)
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
