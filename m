From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: bad sb - mounting problem
Date: Wed, 16 Apr 2003 21:17:30 +0400
Message-ID: <200304162117.30155.vitaly@namesys.com>
References: <200304161841.46413.noster@venture.org.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304161841.46413.noster@venture.org.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bartlomiej Pater <noster@venture.org.pl>
Cc: reiserfs-list@namesys.com


Hi,=20

> -----------------------
> Apr 16 18:24:03 monada kernel: Using r5 hash to sort names
> Apr 16 18:24:03 monada kernel: ReiserFS version 3.6.25
> Apr 16 18:24:03 monada kernel: reiserfs: checking transaction log
> (device 03:07) ...
> Apr 16 18:24:03 monada kernel: journal-1204: REPLAY FAILURE fsck
> required! Trying to replay onto a log block
> Apr 16 18:24:03 monada kernel: Replay Failure, unable to mount
> Apr 16 18:24:03 monada kernel: reiserfs_read_super: unable to
> initialize journal space
> ------------------------
>
> now one of my partitions is unavailable. I've tried fsck with
> --rebuild-sb and --rebuild-tree options but with no results [and no
> errors either]. I've googled through internet and searched this
> mailing list archives.

What do you mean by saying "no results [and no errors either]"?
Do you mean that reiserfsck --rebuild-tree finishes with no problem,
but on fs mount the kernel sais "REPLAY FAILURE" again?

> I've downloaded v3.6.5 [+patch] of reiserfsprogs=20

right.

> and compiled kernel with debug on but with no changes. Is there somethi=
ng=20
> I can do to salvage the data?

What does reiserfsck --check say?

So, you still have the same "REPLAY FAILURE" on mount, right?

--=20
Thanks,
Vitaly Fertman
