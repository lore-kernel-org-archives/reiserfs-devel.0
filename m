From: Brian Uhrain <buhrain@rosettastone.com>
Subject: New Reiser4 patch
Date: Fri, 17 Mar 2006 10:25:35 +0000
Message-ID: <441A8E9F.4030602@rosettastone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28294-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I just noticed that a Reiser4 patch for kernel 2.6.14.6 was posted on 
ftp.namesys.com yesterday, and I was wondering what changes (if any) 
there are to Reiser4 itself between that patch and the 2.6.15 patch that 
was released two months ago?  Does it fix the issue with the periodic 
(temporary) system freezes during I think background flushes that was 
discussed previously on the list?  And out of curiosity, is there a 
specific technical reason why the patch is for 2.6.14.6 instead of one 
of the 2.6.15 source trees?

Sorry for the barrage of questions as my first post to this list.. :D  I 
use Reiser4 as the root filesystem on all four of my systems (two 
Athlon64 laptops and a dual-core Athlon64 desktop, both using x86-64 
kernels, and a dual processor Alpha).  And I must say, keep up the good 
work!  Except for the pausing issue with the (older) 2.6.14 and 2.6.15 
patches--which I've not even noticed on my dual-core system--and the 
mmap issue (only a problem with VMware, which will hard lock a system), 
the filesystem has worked superbly for me.  I've been using it for 
probably a year or more now as my root FS and have not had any data loss 
or corruptions.  I've even been using it on my Alpha system since I got 
it about a month ago (a CS20 with dual 833MHz EV67 processors) without 
any problems--all of the system software from glibc through Xorg have 
been built at least twice on it without troubles.

Thanks,
Brian


P.S.  If you want any more information on the VMware issue, I can see if 
it still does it on one of my home systems, and try to grab kernel 
messages via serial console.  I only encountered it when I first set up 
my dual-core system at work because I made everything Reiser4, while on 
my laptops my home directory is in a separate Reiser3 partition.  My 
workaround was to put the VMware virtual disks on their own Reiserfs 
partition.
