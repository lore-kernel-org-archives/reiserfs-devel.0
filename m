From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: Problem with the latest auto snapshot
Date: Mon, 14 Jun 2004 11:13:16 +0200
Message-ID: <200406141113.16009.henning-04@die.informatik.uni-siegen.de>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de> <200406131537.54853.henning-04@die.informatik.uni-siegen.de> <20040613134344.GK4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19173-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040613134344.GK4990@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: markus =?iso-8859-1?q?t=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

Am Sonntag, 13. Juni 2004 15:43 schrieb Markus T=F6rnqvist:
> On Sun, Jun 13, 2004 at 03:37:54PM +0200, Henning Westerholt wrote:
> >i'm using the same reiser4 config like you.
>
> Weirdness.
>
> >I just rebuild the partition, and start a small compile job. After them i
> >started a fsck. It reported a new fatal error about a broken node. I
> > attached the output from fsck. I could reproduce this error two times.
>
> The only question that I can think of is this.
> Did you umount the partition?
>
> There is supposedly a bug in current reiser4progs concerning mountpoints,
> so it doesn't refuse to fsck a mounted partition.
>
> That is bad.

I umount or remount-ro the partition.

> >Error: On-disk used blocks and really used blocks differ.
> >Free block count 2354038 found in the format is wrong. Sould be 2441757.
>
> Could this be because the partition is in use?
> If it's trafficking data all the time and fsck can't catch up?

The partition is only temporarily in use, so this should not the case.

> I vaguely remember an ancient discussion with Nik Danilov about having
> online fsck and he said something about the kernel/fs never being
> able to trust userspace data about disk usage or something...
>
> >I could reproduce this error too. If i remember it correctly, i have had
> > this problem with the 03.26 snapshot before.
> >
> >I start now a kde-3.2.3 compile run, lets see if the new code survive
> > this..
>
> Does it still stall?
>
> Are the only real corruptions visible at fsck time?

These were the only visible corruption so far. After the mentioned errors, =
the=20
partition now performs stable. I compile several large oss projects without=
=20
problems. Fsck shows also no problems.

Strange. Perhaps the disk format after the mkfs is "unstable", and it needs=
=20
further use to stabilize it?

Best regards,

Henning
