From: Chris Mason <mason@suse.com>
Subject: Re: LVM1 snapshots and reiserfs
Date: Tue, 13 Apr 2004 13:55:53 -0400
Message-ID: <1081878952.27614.42.camel@watt.suse.com>
References: <20040409193749.GA15077@earth.solarsys.private>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17895-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040409193749.GA15077@earth.solarsys.private>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Fri, 2004-04-09 at 15:37, Mark M. Hoffman wrote:
> Hello:
> 
> (I've already sent this to the LVM list; it was suggested that
> I ask here as well.)
> 
> Sometimes, but not always, I am unable to mount a snapshot.
> When it fails, I see the following lines in my logs...
> 
> kernel: reiserfs: checking transaction log (device 3a:06) ...
> kernel: clm-2076: device is readonly, unable to replay log
> kernel: Replay Failure, unable to mount
> kernel: reiserfs_read_super: unable to initialize journal space
> 
> I am using RedHat 9 with the following stock packages:
> 
> kernel-smp-2.4.20-30.9
> lvm-1.0.3-12
> reiserfs-utils-3.6.4-5
> 
> I have not tried the combination of snapshots & reiserfs with
> earlier RedHat packages so I don't know if this is a regression.
> 
> After some STFW, I thought I might need a "VFS lock" patch.
> However, it looks like this was already included by RedHat...
> in kernel-smp-2.4.20-30.9.src.rpm there is already this patch:
> linux-2.4.18-lvm-VFSlock.patch.
> 
> Is there anything else I can try or look at?
> 
Hard to say, but you might want to check their VFSlock patch for this
hunk (or something like it)
diff -ur linux.beta3.1/fs/reiserfs/super.c linux.beta3/fs/reiserfs/super.c
--- linux.beta3.1/fs/reiserfs/super.c	2003-03-12 08:51:25.000000000 -0500
+++ linux.beta3/fs/reiserfs/super.c	2003-03-12 08:43:08.000000000 -0500
@@ -83,7 +83,7 @@
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
     reiserfs_block_writes(&th) ;
-    journal_end(&th, s, 1) ;
+    journal_end_sync(&th, s, 1) ;
   }
   s->s_dirt = 0;
   unlock_kernel() ;

-chris


