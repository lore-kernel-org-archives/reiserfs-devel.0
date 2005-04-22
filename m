From: Damien Wyart <damien.wyart@free.fr>
Subject: Error messages while moving files to reiser4 fs
Date: Fri, 22 Apr 2005 08:48:25 +0200
Message-ID: <20050422064825.GA1528@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23910-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

While moving some iso images from a jfs partition to a reiser4 one (very
recently created with latest reiser4progs), I got a bunch of errors
looking like these :

Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75
Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_inode+0x45/0x51
Apr 22 07:31:48 brouette kernel:  [__sync_single_inode+278/602] __sync_single_inode+0x116/0x25a
Apr 22 07:31:48 brouette kernel:  [__writeback_single_inode+63/362] __writeback_single_inode+0x3f/0x16a
Apr 22 07:31:48 brouette kernel:  [generic_forget_inode+52/300] generic_forget_inode+0x34/0x12c
Apr 22 07:31:48 brouette kernel:  [generic_sync_sb_inodes+414/748] generic_sync_sb_inodes+0x19e/0x2ec
Apr 22 07:31:48 brouette kernel:  [writeback_inodes+204/219] writeback_inodes+0xcc/0xdb
Apr 22 07:31:48 brouette kernel:  [balance_dirty_pages+73/346] balance_dirty_pages+0x49/0x15a
Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balance_dirty_pages+0x94/0xd4 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write_flow+0x4bf/0x6dc [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_extent+0xf/0x1a [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent+0x0/0x4f [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_or_overwrite+0x198/0x39e [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0x8f/0x95 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0x96/0xc0 [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_file+0x23a/0x48c [reiser4]
Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_write+0x8f/0xff [reiser4]
Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_past_esp+0x52/0x75


I do not know at all what they mean... I stupidly reformatted the
partition without doing a fsck :( so I can't provide much more
information, I'm afraid. What I do not get is why some messages appear
to be related to ext3. My root fs is ext3-formatted ; here are my df
output :

/dev/sdb2     ext3    1.4G  456M  874M  35% /
/dev/sdb5 reiserfs    3.5G  3.2G  291M  92% /usr
/dev/sdb6 reiserfs     15G  6.1G  8.6G  42% /home
/dev/sdb7 reiserfs    4.9G   33M  4.9G   1% /tmp
/dev/sdb8      jfs    9.8G  7.7G  2.2G  79% /tmp_jfs
/dev/sdb9      xfs    9.8G  6.6G  3.2G  68% /tmp_xfs
/dev/sdb11 reiser4    3.4G  236K  3.4G   1% /tmp_reiser4

The system is vanilla 2.6.11.7 with reiser4 patch from ftp.namesys.com.

-- 
Damien Wyart
