From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 13:14:15 +0200
Message-ID: <3EC61987.5000402@gmx.net>
References: <200305172030.58775.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14137-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305172030.58775.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

Russell Coker wrote:
> With a ReiserFS file system you can't FSCK a file system that is mounted 
> read-only.  This means that when a root file system needs to be FSCK'd you 
> need to boot from installation media (or convert the swap space into a 
> temporary root file system).

I take this as a feature request. Right? It would certainly be nice to have.

> It seems that the kernel drivers in 2.4.20 have some bugs whereby a corrupted 
> file system can cause an immediate reboot, a system lock (caps-lock doesn't 
> change the keyboard led), or a kernel Oops.  Ext2/3 does not appear to have 
> such problems.

Could you please provide a metadata dump of the affected filesystem? The
behaviour you describe is not supposed to happen. Do you have a decoded
Oops for us to see what happened?

Believe me, ext2 had other problems like silent corruption even without
crashes or unclean shutdowns triggering it. After about 20-30 reboots,
my ext2 root filesystem was corrupted. This bug plagued me from
2.4.0-test until recently. It now seems to be fixed.

> When machines crash it seems that there is a risk of a file system corruption, 
> a crash on boot seems reasonably likely to damage the root file system.  My 
> laptop (my main test machine) has had two serious corruptions of the root 
> file system this year which caused kernel crashing on boot.
> 
> My conclusion is that until these issues are addressed ReiserFS is not 
> suitable for a root file system.  Then when such problems occur it will be 
> easy to fsck the file system.  Also ext2 has smaller kernel modules giving a 
                                      ^^^^
You surely mean ext3? Ext2 would not be a fair comparison because it has
no journaling. And if you're hunting for size, try jffs or jffs2.

> smaller initrd.


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

