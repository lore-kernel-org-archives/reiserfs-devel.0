From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuildtree dangerous?
Date: Sun, 12 Jan 2003 20:14:45 +0300
Message-ID: <200301122014.45839.vitaly@namesys.com>
References: <200301121729.58989.frank.vandamme@student.kuleuven.ac.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12322-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200301121729.58989.frank.vandamme@student.kuleuven.ac.be>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Van Damme <frank.vandamme@student.kuleuven.ac.be>, reiserfs-list@namesys.com


Hi,

First of all I recommend to use the latest reiserfsprogs from 
our ftp site (3.6.4, or even a 5-pre version). It would be not 
bad to run reiserfsck from this progs in check mode again, 
probably this fsck could fix evth with fix-fixable.

On Sunday 12 January 2003 19:29, Frank Van Damme wrote:
> Hello,
>
> I am having an unfortunate problem with my root filesystem (system only has
> a separate /boot), it has some files which are unreadable. That means, I
> can't rm, chmod or even ls them even with root privileges. This is probably
> due to too many forced poweroffs (no faulty hd according to badblocks).
> reiserfsck --check tells me I only can correct these errors with a
> --rebuild-tree.
>
> What I want to know is: I can backups all data (no problem), but
>
> a) how big is the chance that reiserfsck will destroy the partition?

Even if reiserfsck fails to recover your partition, you can email us and
I will debug the case, fix the bug and recover your data. It happens quite
rare now, sometimes due to hardware problems.

> b) what if the procedure gets broken in the middle (power outage,...), will
> it mean Total Destruction?

You may lose some more data in this case as some updated blocks were synced
but some are not. But it does not mean Total Destruction, of course.

> I would use the reiserfs tools included on the mandrake 9.0 cdrom, since
> this is a most convenient tool as a rescue disk. The disk in question is a
> 10 gig ide wd-caviar:
> /dev/hda5 reiserfs    9.1G  7.5G  1.6G  82% /
>
>
> thx in advance!

-- 

Thanks,
Vitaly Fertman
