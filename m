From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: Re: reiserfsck 3.6.8 + corrupted filesystem
Date: Fri, 04 Jul 2003 15:07:59 -0400
Message-ID: <pan.2003.07.04.15.07.58.894277.13270@umail.hungrycats.org>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <200307031516.44549.vitaly@namesys.com> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org> <200307032210.03901.vitaly@namesys.com> <pan.2003.07.03.17.18.22.88001.5077@umail.hungrycats.org> <pan.2003.07.03.17.18.22.88001.5077@umail.hungrycats.org> <20030704054005.GB6309@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Fri, 04 Jul 2003 01:40:06 -0400, Oleg Drokin wrote:
>> Also, the successive runs of reiserfsck (two more since I posted my
>> original message) are producing lower and lower pass0 stats, and
>> getting further through pass1, about 3000 blocks at a time.  Each run
>> takes about 20 hours before it dies (normally reiserfscks on this size
>> of filesystem take 3-4 days).
> 
> Wow. Do you have large number of files there?

Millions.  Small ones too.

> Want to try our new
> version that considerably speeds-up this case? ;)

Do I!

I've got lots of these filesystems, and half of them are redundant
because any tiny system failure takes half a week to fix ;-)...

>> That command will take a while...based on the current rate, it will
>> finish sometime in the morning on Tuesday, or maybe Monday night.
> 
> Hm. Is there a possibility to aattache the drive to some faster
> interface?

This filesystem is an array of disks spread over 6 IDE interfaces.  The
I/O rates are >25mb/sec on each.  I don't think the disks physically go
any faster.

You might be confusing this with another one of my filesystems I've posted
about recently (the USB/firewire device), which has only a few thousand
files and can completely reiserfsck in about 70 minutes.
