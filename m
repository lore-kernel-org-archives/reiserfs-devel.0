From: Russell Coker <russell@coker.com.au>
Subject: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 20:30:58 +1000
Message-ID: <200305172030.58775.russell@coker.com.au>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

With a ReiserFS file system you can't FSCK a file system that is mounted 
read-only.  This means that when a root file system needs to be FSCK'd you 
need to boot from installation media (or convert the swap space into a 
temporary root file system).

It seems that the kernel drivers in 2.4.20 have some bugs whereby a corrupted 
file system can cause an immediate reboot, a system lock (caps-lock doesn't 
change the keyboard led), or a kernel Oops.  Ext2/3 does not appear to have 
such problems.

When machines crash it seems that there is a risk of a file system corruption, 
a crash on boot seems reasonably likely to damage the root file system.  My 
laptop (my main test machine) has had two serious corruptions of the root 
file system this year which caused kernel crashing on boot.

My conclusion is that until these issues are addressed ReiserFS is not 
suitable for a root file system.  Then when such problems occur it will be 
easy to fsck the file system.  Also ext2 has smaller kernel modules giving a 
smaller initrd.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

