From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 18:03:48 +0300
Message-ID: <20040916150348.GL26192@nysv.org>
References: <4148BC0E.5010509@willsmith.org> <20040916085248.GI5137@backtop.namesys.com> <20040916130809.GI26192@nysv.org> <4149A843.7010804@willsmith.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4149A843.7010804@willsmith.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Smith <will@willsmith.org>
Cc: reiserfs-list@namesys.com

On Thu, Sep 16, 2004 at 10:50:43PM +0800, Will Smith wrote:
>
>"This repacker goes through the entire tree ordering, from left to right 
>and then from right to left, alternating each time it runs."

This is the default behavior, or?
I thought it scans through once per run and remembers which direction
was the last one.

But maybe I should look into the repacker some more before "opening my
mouth" ;)

>If I ran the repacker several times (left->right, right->left, and
>repeat) then fragmentation fell down to almost 0.

So I take it the direction oopses were fixed, good good :)

>(/etc/cron.daily/repacker.reiser4 or similar?)  I'd be happy to
>write these if nobody else is - but it will be in /bin/bash shell.

There are some drawbacks. Sure essentially every Linux distro has
/bin/sh -> /bin/bash, but still it's a bit fishy to force bash.
Still I agree that bash is superior to sh.

I'd write it in Python, to have niftier getopts handling...

>2) the last-run-direction should be persistently stored per filesystem

This is not stored in /sys?
Is it truly important to store it more persistently?

>3) parallel operation on multiple filesystems where possible,
>   but filesystems on a single physical device should
>   run in serial (same as /sbin/fsck -A)

Should be quite trivial.

>4) some kind of config file in /etc/, parameters could include
>    o) maximum run time, global and per filesystem
>    o) run/dont run flag, global and per filesystem

Direction per run as well?

>Any thoughts?  Shall I go ahead and write a first cut?

Please do, although I think it should be reimplemented in C sooner
or later, just to make sure it's an integral part of the reiser4progs
package :)

-- 
mjt

