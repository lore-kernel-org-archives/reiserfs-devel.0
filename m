From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Bug report: slab error at module removal
Date: Sun, 15 Aug 2004 20:16:04 +0400
Message-ID: <20040815161604.GB4703@backtop.namesys.com>
References: <87pt5uibur.fsf@barad-dur.crans.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20299-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87pt5uibur.fsf@barad-dur.crans.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Segaud <matt@minas-morgul.org>
Cc: reiserfs-list@namesys.com

On Sat, Aug 14, 2004 at 06:26:36AM +0200, Mathieu Segaud wrote:
> 
> I don't know if this is the right place, but I just saw a kernel message
> in my dmesg.  
> 
> The box is a test box with 7 Reiser4 FSes.
> 5 of them are LVM2 logical volumes. And the device-mapper
> is used to crypt root partition (cipher AES).
> All Reiser4 partitions have been converted to 1.0.0 layout/format,
> and were consistent at boot time.
> After several hours of running some moderatly high load stuff 
> on each of them (big transfert of data, long repacker runs...).
> I decided to umount them and unload reiser4.ko module.
> dmesg gave this message:
> 
> slab error in kmem_cache_destroy(): cache `plugin_set': Can't free all objects
>  [<c0135c41>] kmem_cache_destroy+0xd1/0x130
>  [<f99bf57a>] plugin_set_done+0xa/0x30 [reiser4]
>  [<f99b9194>] shutdown_reiser4+0xf4/0x210 [reiser4]
>  [<c012a004>] sys_delete_module+0x144/0x180
>  [<c013ea9e>] unmap_vma_list+0xe/0x20
>  [<c013edcf>] do_munmap+0xef/0x150
>  [<c0103afd>] sysenter_past_esp+0x52/0x71
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> 
> The FSes are still consistent (fsck'ed with no --fix needed).
> Unfortunatly, I turned off debugging options to test latest snapshot
> performance. I can rebuild the module with debugging options on,
> and try to give you a more accurate report to help find the memory leak.

can you try the following patch:

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2004/08/15 20:07:10+04:00 zam@crimson.namesys.com 
#   plugin_set_done: first clean the hash table and free all elements, then remove the slab cache.
# 
# plugin/plugin_set.c
#   2004/08/15 20:07:07+04:00 zam@crimson.namesys.com +1 -1
#   plugin_set_done: first clean the hash table and free all elements, then remove the slab cache.
# 
diff -Nru a/plugin/plugin_set.c b/plugin/plugin_set.c
--- a/plugin/plugin_set.c	Sun Aug 15 20:12:29 2004
+++ b/plugin/plugin_set.c	Sun Aug 15 20:12:29 2004
@@ -329,8 +329,8 @@
 reiser4_internal void plugin_set_done(void)
 {
 	/* NOTE: scan hash table and recycle all objects. */
-	kmem_cache_destroy(plugin_set_slab);
 	ps_hash_done(&ps_table);
+	kmem_cache_destroy(plugin_set_slab);
 }
 
 
> 
> Regards,
> 
> -- 
> Mathieu Segaud
> 

-- 
Alex.
