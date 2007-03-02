From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH] Reiser4 for 2.6.21-rc1
Date: Fri, 02 Mar 2007 21:28:32 +0100
Message-ID: <45E888F0.7070604@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30583-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

Please find my reiser4 patch for 2.6.21-rc1 at

http://laurent.riffard.free.fr/reiser4/reiser4-for-2.6.21-rc1/

There is 45 patches in this series. It should include all the reiser4 
for linux-mm stuff. Cryptocompress plugin is untested.


First patch is the Reiser4 patch for kernel 2.6.18 
(http://ftp.namesys.com/pub/reiser4-for-2.6/2.6.18/reiser4-for-2.6.18-3.patch.gz),
updated to apply cleanly on top of 2.6.21-rc1 kernel.

The 13 following patches are either bug-fix from reiserfs mailing-list 
or updates to compile cleanly against vanille kernel.

The last 30 patches come from linux-mm.


Adrian Bunk (3):
       reiser4-possible-cleanups-2
       fs-reiser4-possible-cleanups-2
       fs-reiser4-more-possible-cleanups

Alexander Zarochentsev (9):
       reiser4-reiser4_drop_page-dont-call-remove_from_page_cache
       reiser4-get-rid-of-semaphores-wherever-it-is-possible
 
reiser4-decribe-new-atom-locking-and-nested-atom-locks-to-lock-validator
       reiser4-use-generic-file-read
       reiser4-simplify-reading-of-partially-converted-files
       reiser4-use-page_offset
       reiser4-use-reiser4_gfp_mask_get-in-reiser4-inode-allocation
       reiser4-re-add-page_count-check-to-reiser4_releasepage
       reiser4-restore-fibmap-ioctl-support-for-packed-files

Andrew Morton (2):
       reiser4-test_clear_page_dirty
       reiser4-temp-fix

Andrew Wade (3):
       Reiser4: fix use after free in jrelse_tail
       Reiser4: release d_ref
       Reiser4: release d_ref (fix)

Edward Shishkin (17):
       Reiser4 for 2.6.18
       reiser4-generic_file_read-fix
       reiser4-rename-generic_sounding_globalspatch
       reiser4-use-generic-file-read-fix-readpages-unix-file
       reiser4-format-subversion-numbers-heir-set-and-file-conversion
 
reiser4-format-subversion-numbers-heir-set-and-file-conversion-fix-readpages-cryptcompress
       reiser4-cleanups-in-lzo-compression-library
       reiser4-get-rid-of-deprecated-crypto-api
       reiser4-get-rid-of-deprecated-crypto-api-build-fix
       reiser4-fix-missed-unlock-and-exit_context
       reiser4-use-list_head-instead-of-struct-blocknr
       reiser4-use-list_empty-instead-of-list_empty_careful-for
       reiser4-update-comments-fix-write-and-truncate-cryptcompress
       reiser4-fix-write_extent-1
       reiser4-fix-readpage_cryptcompress
       reiser4-improve-estimation-for-number-of-nodes-occupied
       reiser4-drop-check_cryptcompress

Laurent Riffard (8):
       Reiser4: cometics changes in mm/filemap.c.
       Reiser4: fix calls to kmem_cache_destroy
       Reiser4: Replace inode.u.generic_ip with inode.i_private
       Reiser4: inode.i_blksize suppression
       Reiser4: remove unnecessary config.h includes.
       slab: remove SLAB_KERNEL
       reiser4: remove kmem_cache_t
       Reiser4: Add includes linux/freezer.h

Randy Dunlap (1):
       reiser4-use-null-for-pointers

Vladimir Saveliev (2):
       reiser4-fix-gcc-ws-compains
       linux-2.6.20-rc4-mm1 Reiser4 filesystem freeze and corruption


Disclaimer: I'm not a filesystem guru, nor I'm affiliated with Namesys. 
These patches just suit my needs. It works for me and I hope it will 
help somebody else.
-- 
laurent

