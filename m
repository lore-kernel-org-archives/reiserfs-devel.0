From: Chris Mason <mason@suse.com>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: 28 Jun 2002 09:51:20 -0400
Message-ID: <1025272280.1685.6.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1024340679.18666.36.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi everyone,

I've updated data logging patch, to fix a problem where
reiserfs_writepage didn't properly unlock pages in data logging mode.

The new code will be on
ftp.suse.com/pub/people/mason/patches/data-logging once the mirror
updates.

If you've already got 03-beta-data-logging-10, you only need the
incremental fix below.

-chris

--- 1.33/fs/reiserfs/inode.c	Fri Jun 28 09:34:33 2002
+++ edited/fs/reiserfs/inode.c	Fri Jun 28 09:37:42 2002
@@ -2034,6 +2034,7 @@
     }
     if (reiserfs_active_handle(&th)) {
         journal_end(&th, sb, nr) ;
+        UnlockPage(page);
     }
 }
 


