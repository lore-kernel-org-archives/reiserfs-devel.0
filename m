From: Joachim Reichelt <Reichelt@gbf.de>
Subject: Stacktrace
Date: Thu, 16 Dec 2004 14:17:37 +0100
Message-ID: <41C18AF1.20205@gbf.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22801-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Dear all,
I just got in my dmesg:

reiserfs/1: page allocation failure. order:0, mode:0x21
 [<c0147913>] __alloc_pages+0x3b3/0x3c0
 [<c0147938>] __get_free_pages+0x18/0x30
 [<c014af24>] kmem_getpages+0x24/0xe0
 [<c014bd04>] cache_grow+0xb4/0x170
 [<c014bf28>] cache_alloc_refill+0x168/0x240
 [<c014c224>] kmem_cache_alloc+0x44/0x50
 [<f8855103>] __scsi_get_command+0x23/0x80 [scsi_mod]
 [<f885519d>] scsi_get_command+0x3d/0xd0 [scsi_mod]
 [<f885aee1>] scsi_prep_fn+0x111/0x1f0 [scsi_mod]
 [<c026dd57>] elv_next_request+0x57/0xf0
 [<c026fa2b>] blk_remove_plug+0x3b/0x80
 [<c026fa92>] __generic_unplug_device+0x22/0x40
 [<c02710b8>] __make_request+0x478/0x4d0
 [<c027122e>] generic_make_request+0x11e/0x1d0
 [<c014bfa6>] cache_alloc_refill+0x1e6/0x240
 [<c0121650>] autoremove_wake_function+0x0/0x50
 [<c0145ee6>] mempool_alloc+0x76/0x150
 [<c0121650>] autoremove_wake_function+0x0/0x50
 [<c0271344>] submit_bio+0x64/0x110
 [<c0121650>] autoremove_wake_function+0x0/0x50
 [<c0166fe2>] bio_alloc+0xe2/0x1d0
 [<c016689e>] submit_bh+0x12e/0x190
 [<c0164f84>] __block_write_full_page+0x1f4/0x350
 [<c01f4539>] radix_tree_gang_lookup_tag+0x49/0x70
 [<c0169860>] blkdev_get_block+0x0/0x80
 [<c01666d9>] block_write_full_page+0xe9/0x100
 [<c0169860>] blkdev_get_block+0x0/0x80
 [<c0185036>] mpage_writepages+0x246/0x3e0
 [<c01699f0>] blkdev_writepage+0x0/0x10
 [<c0148ea4>] do_writepages+0x24/0x30
 [<c014279b>] __filemap_fdatawrite_range+0xdb/0x100
 [<c01427e2>] filemap_fdatawrite+0x22/0x30
 [<f95ed810>] flush_async_commits+0x90/0xe0 [reiserfs]
 [<c0133468>] worker_thread+0x1a8/0x240
 [<f95ed780>] flush_async_commits+0x0/0xe0 [reiserfs]
 [<c011fe60>] default_wake_function+0x0/0x10
 [<c011fe60>] default_wake_function+0x0/0x10
 [<c01332c0>] worker_thread+0x0/0x240
 [<c0137515>] kthread+0xa5/0xf0
 [<c0137470>] kthread+0x0/0xf0
 [<c01052b9>] kernel_thread_helper+0x5/0xc

System: SuSE 9.2,
# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 3
model name      : Intel(R) Pentium(R) 4 CPU 3.00GHz
stepping        : 4
1GB RAM

Nothing in messages!
# mount | grep reis| sort
/dev/md1 on /var type reiserfs (rw,acl,user_xattr)
/dev/md2 on /tmp type reiserfs (rw,acl,user_xattr)
/dev/md3 on / type reiserfs (rw,acl,user_xattr)
/dev/sdc1 on /software type reiserfs (rw,acl,user_xattr)
/dev/sdc2 on /nero type reiserfs (rw,acl,user_xattr)

-- 
Mit freundlichen Gruessen                         Best Regards
 
         Joachim Reichelt

WWW: http://bragi.gbf.de/      _/_/_/   _/_/_/   _/_/_/_/
WWW: http://www.gbf.de/sb    _/    _/  _/   _/  _/
WWW: http://www.gbf.de/     _/        _/   _/  _/
                           _/  _/    _/_/_/   _/_/_/
                          _/    _/  _/   _/  _/
Mascheroder Weg 1        _/    _/  _/   _/  _/
D-38124 Braunschweig      _/_/_/  _/_/_/   _/

Tel: +(49) 531 6181 352                  FAX: +(49) 531 2612 388

			SB  - Strukturbiologie
              GBF - Gesellschaft fuer Biotechnologische Forschung
                    German Research Centre for Biotechnology

See me at:
EMAIL: REICHELT@gbf.de    WWW:  http://www.gbf.de/sb/Reichelt.htm

-- Disclaimer --
Standard > Keyword : Opinions, my own, nobody else's, whatsoever ...

Man muss sich notfalls jemand mieten,
hat man an Geist selbst nichts zu bieten!     (Heinz Erhardt)

