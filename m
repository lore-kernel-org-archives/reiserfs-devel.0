From: =?iso-8859-1?q?berny=AE?= <berny@dwami.com>
Subject: File copy problems kde 4.5 to 4.6.1 with reiser4
Date: Wed, 9 Mar 2011 09:18:47 +0000
Message-ID: <201103090918.47762.berny@dwami.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi Edward, 
first thank you for your work.

I'm using reiser4 for all my partitions on my working machine with kernel 2.6.37 with no problems 
except one annoying one that is going on from months.
When I copy a file (whatever) from one directory to another with konqueror, dolphin or krusader with 
kde 4.6.1 the file get copied, it's size is correct but it is empty.

This happen only in the partitions formatted with reiser4 and not on the xfs, reiser3 ones.

If I restart the pc, when I'm back all the files that were empty are now ok, it is like on un 
mounting the files get finalized and then on the next boot they are normally accessible.
No errors are shown during copy and file system is clean.
I discovered that this is also signaled like a kde bug 251392 with status unconfirmed. 

If I copy from a terminal with cp, rsync, mc the file get copied correctly so it is only in the 
combination kde + reiser4 that I get problems.
Don't know if it is a bug of reiser4 or of kde.

My mount options are no_write_barrier,dont_load_bitmap, the rest is default, the volumes are normal, 
I mean not cryptocompress.
An interesting thing, if I format the reiser4 with cryptocompress support (-o create=ccreg40, 
compress=lzo1) this behavior don't happen, I mean the files are copied correctly so it seems only to 
affect normal uncompressed reiser4 volumes.
Hope this can be of help to you.

Thank you,
warm regards,
Paolo
