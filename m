From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [BK][PATCH] Reiser4, will double Linux FS performance, please apply
Date: Thu, 31 Oct 2002 23:34:18 +0100
Message-ID: <200210312334.18146.Dieter.Nuetzel@hamburg.de>
References: <3DC19F61.5040007@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11878-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DC19F61.5040007@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Hans Reiser <reiser@namesys.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Reiserfs-List@namesys.com

Am Donnerstag, 31. Oktober 2002 22:05 schrieb Jeff Garzik:
> Hans Reiser wrote:
>
> > If you want to talk about 2.6 then you should talk about reiser4 not=20
> > reiserfs v3, and reiser4 is 7.6 times the write performance of ext3=20
> > for 30 copies of the linux kernel source code using modern IDE drives=20
> > and modern processors on a dual-CPU box, so I don't think any amount=20
> > of improved scalability will make ext3 competitive with reiser4 for=20
> > performance usages.=20
>
> What is the read performance like?

=46rom his mentioned paper http://www.namesys.com/v4/fast_reiser4.html, it =
is=20
more then doubled compared to ext3 and ReiserFS v3.

To be fair he should explain if it was compared to the latest ext3 (htree)=
=20
stuff or not, yet.

It looks truly impressive.

Regards,
	Dieter
=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
