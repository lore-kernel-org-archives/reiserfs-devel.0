From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfsck infinite loop at pass2 (built by Debian).
Date: Fri, 18 Apr 2003 17:10:23 +0200
Message-ID: <200304181710.23731.Dieter.Nuetzel@hamburg.de>
References: <200304181604.28955.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13709-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304181604.28955.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com
Cc: Ed Boraas <ed@debian.org>

Am Freitag, 18. April 2003 14:04 schrieb Vitaly Fertman:
> Hi all,
>
> while investigating the problem with infinite loop at pass2 of reiserfsck,
> what seemed to be reported by people using reiserfsprogs built by Debian,
> we found a debain patch against reiserfsprogs-3.6.4 (introduced in
> 3.6.4-2), what was the problem. Tests with this patch revealed the problem
> - bitops were changed and have not worked properly anymore.
>
> The reason why bitops were changed is that reiserfsprogs did not work
> correctly on big endian platforms that time. It was also fixed now and
> 3.6.5 should work correctly. If you are going to use 3.6.5 do not forget
> about the patch 'reiserfsprogs-3.6.5-flush_buffers-bug.patch' or wait a f=
ew
> days for 3.6.6 release. The latest reiserfsprogs and the patch can be
> obtained from ftp://ftp.namesys.com/pub/reiserfsprogs/

Vitaly,

what about the "double" checking during bootup since 3.6.5+patch (3.6.6-pre=
1)?
I get two check sequences since the latest version.

=46irst round from fsck.reiserfs (-a/-p) but sadly not logged and then the=
=20
below.

<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,3)) for (sd(8,3))
<4>Using r5 hash to sort names
<4>VFS: Mounted root (reiserfs filesystem) readonly.
<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,2)) for (sd(8,2))
<4>Using r5 hash to sort names
<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,5)) for (sd(8,5))
<4>Using r5 hash to sort names
<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,6)) for (sd(8,6))
<4>Using r5 hash to sort names
<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,7)) for (sd(8,7))
<4>Using r5 hash to sort names
<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,8)) for (sd(8,8))
<4>Using r5 hash to sort names
<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,17)) for (sd(8,17))
<4>Using r5 hash to sort names
<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,21)) for (sd(8,21))
<4>Using r5 hash to sort names
<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,22)) for (sd(8,22))
<4>Using r5 hash to sort names
<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,23)) for (sd(8,23))
<4>Using r5 hash to sort names
<4>reiserfs: found format "3.6" with standard journal
<4>reiserfs: using ordered data mode
<4>reiserfs: checking transaction log (sd(8,24)) for (sd(8,24))
<4>Using r5 hash to sort names

Thanks and Happy Easter!

=2DDieter
=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
