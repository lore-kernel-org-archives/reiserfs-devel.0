From: Oleg Drokin <green@namesys.com>
Subject: Re: !?!
Date: Thu, 9 Jan 2003 09:40:48 +0300
Message-ID: <20030109094048.A20121@namesys.com>
References: <3E1BCAE6.9000408@ap-plastic.ru>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12294-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E1BCAE6.9000408@ap-plastic.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Erofeevskij <ae@ap-plastic.ru>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jan 08, 2003 at 11:53:26AM +0500, Anton Erofeevskij wrote:

> in reiserfs filesystem
> time cat sd1 | ./a.out > sd2
> 0.00user 0.05system 0:01.79elapsed 2%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (131major+43minor)pagefaults 0swaps
> in ext2 filesystem
> time cat sd1 | ./a.out > sd2
> 0.00user 0.05system 0:00.95elapsed 2%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (131major+43minor)pagefaults 0swaps
> In what the reason?!?


Generally reiserfs might have more CPU overhead over ext2 due to it's
journaling and balanced-tree nature per one operation. For large operations
this is outweight by speed of performing the operation itself, but when you
just write four bytes at a time, and each time that involves statdata (size,
possibly nlinks, times) update, possible rebalancings, journal updates.
And you have not said what ketnel are you using and what is config of the
kernel.

Bye,
    Oleg
