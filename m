From: Klaus Thorn <klaus@trillke.net>
Subject: Re: Status of quota support for reiserfs on 2.6.x kernels
Date: Wed, 15 Dec 2004 00:29:06 +0000 (UTC)
Message-ID: <loom.20041215T011250-550@post.gmane.org>
References: <20041123105332.02470503.philippe.gramoulle@mmania.com> <200411231406.43497.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22769-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Christian Mayrhuber <christian.mayrhuber <at> gmx.net> writes:

> Quotas are in kernel 2.6 and supported by ext2,ext3,reiserfs,xfs.
> Reiserfs doesn't need an extra patch for quotas, data journalling
> or extended attributes. Everything is right there for
> kernels > 2.6.5 if I remember right.

I tried to use quota with 2.6.7 and got two serious problems:

1. soft quotas were treated like hard quotas
(grace time 8 days but behaved like 0 days)

2. after a few days no access to the file system was possible,
fs-options usrquota and grpquota were doubled
when listed by the mount command.
(all 14 clients, samba and nfs paralyzed,
a whole radio station silent, yes I had better days)
After reboot the problem was gone but I turned quota off.

so imho quota with reiserfs is experimental and buggy

> I guess it would be wise to wait with the migration till these patches
> make it into some official 2.6 kernel release.

damn. I can't switch to ext3 since my filesystem is too big
to be copied somewhere else.
I'm stuck and need quota with reiserfs and linux 2.6.
What can I do?

