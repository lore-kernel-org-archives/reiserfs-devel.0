From: Will Smith <will@willsmith.org>
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 22:50:43 +0800
Message-ID: <4149A843.7010804@willsmith.org>
References: <4148BC0E.5010509@willsmith.org> <20040916085248.GI5137@backtop.namesys.com> <20040916130809.GI26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040916130809.GI26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com


Markus T=F6rnqvist wrote:

>>yes, we had similar results.  it is so cool that reiser4 repacker effect
>>is visible outside namesys :)
>=20
> S'cuse me, but why does it have to be run several times?

I don't pretend to know the maths/logic of why, but from the reiser4=20
description (http://www.namesys.com/v4/v4.html#repacker)

"This repacker goes through the entire tree ordering, from left to right=20
and then from right to left, alternating each time it runs."

"In the absence of FS activity the effect of this over time is to sort=20
by tree order (defragment), and to pack with perfect efficiency."


My testing showed that this is indeed the case -

If I ran the repacker once (say left to right), the fragmentation was=20
not fully reduced.

If I ran the repacker several times (left->right, right->left, and
repeat) then fragmentation fell down to almost 0.


Userspace Tool for Repacker
----------------------------

I take it from an earlier comment by Hans that the repacker is not
intended to be used yet?  If it is indeed ready for primetime,
is anybody working on userspace tools
(/etc/cron.daily/repacker.reiser4 or similar?)  I'd be happy to
write these if nobody else is - but it will be in /bin/bash shell.

My proposed design specs would include:

1) runs in /etc/cron.daily near the end (since cron causes lots of
    disk activity)
2) the last-run-direction should be persistently stored per filesystem
3) parallel operation on multiple filesystems where possible,
    but filesystems on a single physical device should
    run in serial (same as /sbin/fsck -A)
4) some kind of config file in /etc/, parameters could include
     o) maximum run time, global and per filesystem
     o) run/dont run flag, global and per filesystem


Any thoughts?  Shall I go ahead and write a first cut?



Will Smith





