From: Junfeng Yang <yjf@stanford.edu>
Subject: [CHECKER] Do ext2, jfs and reiserfs respect mount -o sync/dirsync
 option? (fwd)
Date: Fri, 4 Mar 2005 15:23:01 -0800 (PST)
Message-ID: <Pine.GSO.4.44.0503041521590.17877-100000@elaine24.Stanford.EDU>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: mc@cs.Stanford.EDU


Looks like I sent the following message to an obsolete mailing list...

---------- Forwarded message ----------
Date: Thu, 3 Mar 2005 22:33:40 -0800 (PST)
From: Junfeng Yang <yjf@stanford.edu>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
     ext2-devel@lists.sourceforge.net,
     jfs-discussion@www-124.southbury.usf.ibm.com, reiser@namesys.com
Cc: mc@cs.stanford.edu
Subject: [MC] [CHECKER] Do ext2,
     jfs and reiserfs respect mount -o sync/dirsync option?


Hi,

FiSC (our file system checker) emits several warnings on ext2, jfs and
reiserfs, complaining that diretories or files are lost while FiSC
believes they should already be persistent on disk. (ext3 behaves
correctly.)

All warnings boil down to a single cause:  when these file systems are
mounted -o sync or dirsync, dirty blocks are still written out
asynchronously.  It appears to me that these mount options don't have any
effect on these file systems.  Is this the intended behavior?

man mount shows:

              sync   All  I/O to the file system should be done
synchronously.

              dirsync
                     All directory updates within the file  system  should
be
                     done  synchronously.   This  affects the following
system
                     calls: creat, link, unlink, symlink, mkdir, rmdir,
mknod
                     and rename.

Any clafirication on this would be very helpful,

-Junfeng


_______________________________________________
MC mailing list
MC@keeda.stanford.edu
http://keeda.stanford.edu/cgi-bin/mailman/listinfo/mc

