From: Mathieu Segaud <matt@minas-morgul.org>
Subject: Bug report: slab error at module removal
Date: Sat, 14 Aug 2004 06:26:36 +0200
Message-ID: <87pt5uibur.fsf@barad-dur.crans.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20282-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


I don't know if this is the right place, but I just saw a kernel message
in my dmesg.  

The box is a test box with 7 Reiser4 FSes.
5 of them are LVM2 logical volumes. And the device-mapper
is used to crypt root partition (cipher AES).
All Reiser4 partitions have been converted to 1.0.0 layout/format,
and were consistent at boot time.
After several hours of running some moderatly high load stuff 
on each of them (big transfert of data, long repacker runs...).
I decided to umount them and unload reiser4.ko module.
dmesg gave this message:

slab error in kmem_cache_destroy(): cache `plugin_set': Can't free all objects
 [<c0135c41>] kmem_cache_destroy+0xd1/0x130
 [<f99bf57a>] plugin_set_done+0xa/0x30 [reiser4]
 [<f99b9194>] shutdown_reiser4+0xf4/0x210 [reiser4]
 [<c012a004>] sys_delete_module+0x144/0x180
 [<c013ea9e>] unmap_vma_list+0xe/0x20
 [<c013edcf>] do_munmap+0xef/0x150
 [<c0103afd>] sysenter_past_esp+0x52/0x71
SLAB: cache with size 64 has lost its name
SLAB: cache with size 64 has lost its name
SLAB: cache with size 64 has lost its name
SLAB: cache with size 64 has lost its name
SLAB: cache with size 64 has lost its name
SLAB: cache with size 64 has lost its name
SLAB: cache with size 64 has lost its name
SLAB: cache with size 64 has lost its name
SLAB: cache with size 64 has lost its name
SLAB: cache with size 64 has lost its name
SLAB: cache with size 64 has lost its name

The FSes are still consistent (fsck'ed with no --fix needed).
Unfortunatly, I turned off debugging options to test latest snapshot
performance. I can rebuild the module with debugging options on,
and try to give you a more accurate report to help find the memory leak.

Regards,

-- 
Mathieu Segaud

