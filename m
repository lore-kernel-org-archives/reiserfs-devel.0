From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: kernel memory limits
Date: Wed, 26 Nov 2003 16:07:26 +0300
Message-ID: <16324.42382.487334.541590@laputa.namesys.com>
References: <3FB38371.60101@dsvr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16169-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB38371.60101@dsvr.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Burrett <nick@dsvr.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>, Chris Mason <Mason@Suse.COM>

Nick Burrett writes:
 > 
 > 
 > Hi,
 > 
 > I'm running standard 2.4.22 kernel, 2xP4 Xeon with 2Gb RAM.
 > 
 > After reaching 127 filesystems on the server, all formatted as reiserfs, 
 > I now find the following errors are occurring:
 > 
 > 
 > reiserfs: found format "3.6" with standard journal
 > reiserfs: using ordered data mode
 > loop(7,124):clm-2000, unable to allocate bitmaps for journal lists
 > Unable to handle kernel NULL pointer dereference at virtual address 00000000
 >   printing eip:

Sorry, for delay.

Please try following patch:
----------------------------------------------------------------------

diff -puN fs/reiserfs/journal.c~jb_bitmaps-NULL-check fs/reiserfs/journal.c
--- i386/fs/reiserfs/journal.c~jb_bitmaps-NULL-check	Wed Nov 26 16:03:56 2003
+++ i386-god/fs/reiserfs/journal.c	Wed Nov 26 16:03:56 2003
@@ -193,6 +193,9 @@ static int set_bit_in_list_bitmap(struct
 static void cleanup_bitmap_list(struct super_block *p_s_sb,
                                 struct reiserfs_list_bitmap *jb) {
   int i;
+  if (jb->bitmaps == NULL)
+    return;
+
   for (i = 0 ; i < SB_BMAP_NR(p_s_sb) ; i++) {
     if (jb->bitmaps[i]) {
       free_bitmap_node(p_s_sb, jb->bitmaps[i]) ;

_
----------------------------------------------------------------------

(It is against 2.6, but hopefully will apply.)

Chris what do you think?

 > c01d5397

[...]

 > 
 > $ iptables -F
 > iptables: Memory allocation problem
 > 
 > I was hoping to mount 254 filesystems on this server.  Another server 
 > running ext2 successfully runs with over 1000 filesystems and another 
 > with ext3 runs 220 filesystems.
 > 
 > This is 100% reproducable. Is there anything I can do about this ?
 > 

Patch should fix the oops, but not the memory exhaustion problem.

 > 
 > Regards,
 > 
 > 
 > Nick.
 > 

Nikita.

 > 
 > -- 
 > Nick Burrett
 > Network Engineer, Designer Servers Ltd.   http://www.dsvr.co.uk
 > 
