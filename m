From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser (3.6) PANIC.
Date: Tue, 26 Sep 2006 18:28:50 +0400
Message-ID: <45193922.7040504@namesys.com>
References: <451860D5.2060305@catbus.co.uk> <4518DB3B.3070808@namesys.com> <45191F61.90406@catbus.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29983-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45191F61.90406@catbus.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: James Beal <james_@catbus.co.uk>
Cc: reiserfs-list@namesys.com

James Beal wrote:

> Edward Shishkin wrote:
>
> >James Beal wrote:
>
> >>This occurrs when trying to delete some files, repeatedly even after a
> >>/sbin/reiserfsck --rebuild-tree ?
> >>Any hints ?
> >>
> >Would you please upgrade your kernel to the latest stable version.
> >I believe this bug is fixed there.
>
>
> Thanks for the quick reply.
>
> Once I have upgraded the Kernel do I need to.
>
> 1) Upgrade the support utilities


yes, have the latest ones (your reiser4progs are a bit obsoleted)

> 2) Re-do a reiserfsck on the partition?


first try to mount
