From: Jeff Mahoney <jeffm@suse.com>
Subject: ReiserFS Maximum file size (in practice)
Date: Tue, 18 May 2004 16:40:42 -0400
Message-ID: <40AA74CA.5040306@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070703090207090507010801"
Return-path: <reiserfs-list-return-18754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--------------070703090207090507010801
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Hey all -

The ReiserFS FAQ that we quote and point people to when they ask 
questions about limits in ReiserFS states that the maxmimum file size 
for a reiserfs v3 filesystem is 2^60-1. However, the actual limits, in 
practice, are far less.

I tried to create a 3 TB sparse file, and ended up getting told it was 
too large. 2 TB was too large also, just under 2 TB was ok.

This is a result of super->s_maxbytes = (512LL << 32) - s->s_blocksize;, 
in fs/reiserfs/super.c, which is set so that i_blocks isn't overflowed.

Other filesystems that have the ability to cross the 2 TB limit on file 
sizes simply ignore the limit and allow i_blocks to wrap. There's really 
no reason we can't do the same.

The patch is attached.

-Jeff

-- 
Jeff Mahoney
SuSE Labs

--------------070703090207090507010801
Content-Type: text/plain;
 name="reiserfs-large-file.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-large-file.diff"

--- linux-2.6.5/fs/reiserfs/super.c	2004-05-14 15:32:49.000000000 -0400
+++ linux-2.6.5.fix/fs/reiserfs/super.c	2004-05-18 12:07:25.000000000 -0400
@@ -1204,7 +1204,7 @@
     /* new format is limited by the 32 bit wide i_blocks field, want to
     ** be one full block below that.
     */
-    s->s_maxbytes = (512LL << 32) - s->s_blocksize ;
+    s->s_maxbytes = MAX_LFS_FILESIZE;
     return 0;
 }
 

--------------070703090207090507010801--
