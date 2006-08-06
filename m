From: Bernd Schubert <bernd-schubert@gmx.de>
Subject: Re: Another article abour Reiser4 on linux.com
Date: Sun, 6 Aug 2006 13:04:42 +0200
Message-ID: <200608061304.42692.bernd-schubert@gmx.de>
References: <87bqqzbaug.fsf@baldur.nicundtas.de> <Pine.LNX.4.62.0608051913200.12088@robo.Stanford.EDU> <44D5A650.3080708@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29506-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44D5A650.3080708@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>, TongKe Xue <xue@ai.stanford.edu>, David Masover <ninja@slaphack.com>, Clay Barnes <clay.barnes@gmail.com>, Maciej =?utf-8?q?So=C5=82tysiak?= <pysiak.satriani@wp.pl>

On Sunday 06 August 2006 10:20, Hans Reiser wrote:
> TongKe Xue wrote:
> > A really stupid question ... why not put Reiser4 in one of the BSDs?
>
> The cost to port to BSD is about $500k, and I am not possessed of a lot
> of money at this time.  There is also a license issue, I don't want
> reiser4 to be BSD licensed, people who want proprietary additions to
> reiser4 should pay me for reiser4.

An alternative might be a reiser4 fuse port. Has some advantages:

=2D Doesn't need to be included into the kernel.

=2D can be GPL

=2D Referring to the fuse site it also works on BSD (http://fuse4bsd.creo.h=
u/).

=2D Kills one of the major arguments on LKML - if reiser4 is included but=20
Namesys abandons  it in the future and reiser4 has to be removed from the=20
kernel that time again, it still could be mounted.

Sorry, I have never looked into any of the reiserfs code, but looking at th=
e=20
simple interface of fuse, it might be possible that you could reuse lots of=
=20
your present code.
There even is ongoing work to get a ZFS fuse port=20
(http://www.wizy.org/wiki/ZFS_on_FUSE).

Cheers,
	Bernd

=2D-=20
Bernd Schubert
PCI / Theoretische Chemie
Universit=C3=A4t Heidelberg
INF 229
69120 Heidelberg

