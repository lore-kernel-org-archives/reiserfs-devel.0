From: Will Smith <will@willsmith.org>
Subject: Re: Repacker for reiser4?
Date: Tue, 14 Sep 2004 01:42:42 +0800
Message-ID: <4145DC12.90103@willsmith.org>
References: <4144674B.5070705@willsmith.org> <20040912151537.GE26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21720-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040912151537.GE26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com


Markus T=F6rnqvist wrote:
>>Is the repacker available for reiser4?  I can see code in
>=20
> it works with echo 1 > /sys/fs/reiser4/hda2/repacker/start afaik, but
> I haven't tried it myself yet, as my backups are a bit out of date.
>=20


Thanks Markus.

As far as I can tell (can anybody confirm/deny), it's up to userspace
to manually toggle the 'direction' flag as required before starting
the repacker - the direction seems to default to 0 ('backward') on each=20
mount.

It works fine for me on 600Mb of test data which I have heavily=20
fragmented with a test script.

A 'diff -r' reports no differences with the original data (stored
in ext3), and I can see the tree-frag and data-frag values
falling in measurefs.ext4.

I hope to do some timings over the next few days of how fragmentation
degrades performance of both ext3 and reiser4, given the same
sequence of operations on each filesystem.  And then, whether the
repacker fixes things for reiser4.  Naturally, ext3 fragmentation
cannot be fixed :)


Will Smith
