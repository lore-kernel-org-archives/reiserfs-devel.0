From: Mike Benoit <mikeb@netnation.com>
Subject: Reiser4 segfault perhaps?
Date: Mon, 20 Oct 2003 10:43:32 -0700
Message-ID: <1066671812.1407.14.camel@mikeb.staff.netnation.com>
Reply-To: mikeb@netnation.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15869-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

In an attempt to be brave, I tried migrating my /home partition to
Reiser4 (I backup 3 times/day). At the time I had a Windows share
mounted with Samba, /backup and / partition mounted as ext3, and a
"fresh" /home partition mounted as Reiser4. 

I then tried copying everything (1GB) from the /backup partition to the
/home partition, then in another terminal proceeded to type "df" over
and over again as fast as I could... Apparently that was a bad idea. 

PS. Hans, I'm interested in how the laptop migration to Reiser4 is
going?

Oct 20 09:59:06 mikeb kernel: kjournald starting.  Commit interval 5
seconds
Oct 20 09:59:06 mikeb kernel: EXT3 FS on hda7, internal journal
Oct 20 09:59:06 mikeb kernel: EXT3-fs: mounted filesystem with ordered
data mode.
Oct 20 10:00:00 mikeb CROND[19585]: (root) CMD (  
/usr/share/sshd-monitor/sshd-restarter)
Oct 20 10:00:01 mikeb sshd[19590]: Did not receive identification string
from 127.0.0.1
Oct 20 10:01:00 mikeb CROND[19598]: (root) CMD (nice -n 19 run-parts
/etc/cron.hourly)
Oct 20 10:01:02 mikeb msec: changed mode of /var/log/XFree86.0.log from
644 to 640
Oct 20 10:01:02 mikeb msec: changed group of /var/log/XFree86.0.log from
root to adm
Oct 20 10:01:02 mikeb msec: changed mode of /var/log/XFree86.0.log.old
from 644 to 640
Oct 20 10:01:02 mikeb msec: changed group of /var/log/XFree86.0.log.old
from root to adm
Oct 20 10:01:02 mikeb msec: changed mode of /var/log/samba/log.smbmount
from 644 to 640
Oct 20 10:03:18 mikeb kernel: loading reiser4 bitmap......done (1355
jiffies)
Oct 20 10:03:25 mikeb kernel: kjournald starting.  Commit interval 5
seconds
Oct 20 10:03:25 mikeb kernel: EXT3 FS on hda7, internal journal
Oct 20 10:03:25 mikeb kernel: EXT3-fs: mounted filesystem with ordered
data mode.
Oct 20 10:03:48 mikeb kernel: Call Trace:
Oct 20 10:03:48 mikeb kernel:  [write_inode+67/80] write_inode+0x43/0x50
Oct 20 10:03:48 mikeb kernel:  [__sync_single_inode+320/560]
__sync_single_inode+0x140/0x230
Oct 20 10:03:48 mikeb kernel:  [generic_sync_sb_inodes+382/704]
generic_sync_sb_inodes+0x17e/0x2c0
Oct 20 10:03:48 mikeb kernel:  [writeback_inodes+77/176]
writeback_inodes+0x4d/0xb0
Oct 20 10:03:48 mikeb kernel:  [balance_dirty_pages+72/320]
balance_dirty_pages+0x48/0x140
Oct 20 10:03:48 mikeb kernel:  [item_balance_dirty_pages+197/416]
item_balance_dirty_pages+0xc5/0x1a0
Oct 20 10:03:48 mikeb kernel:  [tail_balance_dirty_pages+47/64]
tail_balance_dirty_pages+0x2f/0x40
Oct 20 10:03:48 mikeb kernel:  [write_tail+158/384]
write_tail+0x9e/0x180
Oct 20 10:03:48 mikeb kernel:  [append_and_or_overwrite+473/992]
append_and_or_overwrite+0x1d9/0x3e0
Oct 20 10:03:48 mikeb kernel:  [write_tail+0/384] write_tail+0x0/0x180
Oct 20 10:03:48 mikeb kernel:  [write_flow+132/144] write_flow+0x84/0x90
Oct 20 10:03:48 mikeb kernel:  [get_exclusive_access+16/32]
get_exclusive_access+0x10/0x20
Oct 20 10:03:48 mikeb kernel:  [write_unix_file+346/576]
write_unix_file+0x15a/0x240
Oct 20 10:03:48 mikeb kernel:  [do_sync_read+139/224]
do_sync_read+0x8b/0xe0
Oct 20 10:03:52 mikeb kernel:  [reiser4_write+141/272]
reiser4_write+0x8d/0x110
Oct 20 10:03:52 mikeb kernel:  [<c02196ad>] reiser4_write+0x8d/0x110
Oct 20 10:03:52 mikeb kernel:  [reiser4_write+0/272]
reiser4_write+0x0/0x110
Oct 20 10:03:52 mikeb kernel:  [<c0219620>] reiser4_write+0x0/0x110
Oct 20 10:03:52 mikeb kernel:  [vfs_write+246/320] vfs_write+0xf6/0x140
Oct 20 10:03:52 mikeb kernel:  [<c014c456>] vfs_write+0xf6/0x140
Oct 20 10:03:52 mikeb kernel:  [sys_write+66/112] sys_write+0x42/0x70
Oct 20 10:03:52 mikeb kernel:  [<c014c552>] sys_write+0x42/0x70
Oct 20 10:03:52 mikeb kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Oct 20 10:03:52 mikeb kernel:  [<c01092cb>] syscall_call+0x7/0xb
Oct 20 10:03:52 mikeb kernel:
Oct 20 10:03:52 mikeb kernel: Unable to handle kernel NULL pointer
dereference at virtual address 00000164
Oct 20 10:03:52 mikeb kernel:  printing eip:
Oct 20 10:03:52 mikeb kernel: e08a33aa
Oct 20 10:03:52 mikeb kernel: *pde = 00000000
Oct 20 10:03:52 mikeb kernel: Oops: 0000 [#6]
Oct 20 10:03:52 mikeb kernel: CPU:    0
Oct 20 10:03:52 mikeb kernel: EIP:   
0060:[_end+541344002/1069149528]    Not tainted
Oct 20 10:03:52 mikeb kernel: EIP:    0060:[<e08a33aa>]    Not tainted
Oct 20 10:03:52 mikeb kernel: EFLAGS: 00010282
Oct 20 10:03:52 mikeb kernel: EIP is at smb_show_options+0x1a/0x1b0
[smbfs]
Oct 20 10:03:52 mikeb kernel: eax: 00000000   ebx: cf7cdc00   ecx:
dbbdfc40   edx: e08a689d
Oct 20 10:03:52 mikeb kernel: esi: dbbde000   edi: dbbdfc40   ebp:
cf7cdc00   esp: dbbdfbe4
Oct 20 10:03:52 mikeb kernel: ds: 007b   es: 007b   ss: 0068
Oct 20 10:03:53 mikeb kernel: Process cp (pid: 19628,
threadinfo=dbbde000 task=cd07d900)
Oct 20 10:03:53 mikeb kernel: Stack: 00000000 00000000 00000000 cf7cdc00
dbbde000 dbbdfc40 00000000 c016d99e
Oct 20 10:03:53 mikeb kernel:        cf7cdc00 dbbdfc40 c016d9fd cf7cdc00
dbbdfc40 00000600 dbbdfc40 0000c82f
Oct 20 10:03:53 mikeb kernel:        c0134dd8 dbbdfc40 dbbdfc38 dbbdfc3c
c151e924 0000314b 0000c52c c151e924
Oct 20 10:03:53 mikeb kernel: Call Trace:
Oct 20 10:03:53 mikeb kernel:  [sync_sb_inodes+46/64]
sync_sb_inodes+0x2e/0x40
Oct 20 10:03:53 mikeb kernel:  [<c016d99e>] sync_sb_inodes+0x2e/0x40
Oct 20 10:03:53 mikeb kernel:  [writeback_inodes+77/176]
writeback_inodes+0x4d/0xb0
Oct 20 10:03:53 mikeb kernel:  [<c016d9fd>] writeback_inodes+0x4d/0xb0
Oct 20 10:03:53 mikeb kernel:  [balance_dirty_pages+72/320]
balance_dirty_pages+0x48/0x140
Oct 20 10:03:53 mikeb kernel:  [<c0134dd8>]
balance_dirty_pages+0x48/0x140
Oct 20 10:03:53 mikeb kernel:  [item_balance_dirty_pages+197/416]
item_balance_dirty_pages+0xc5/0x1a0
Oct 20 10:03:53 mikeb kernel:  [<c022d445>]
item_balance_dirty_pages+0xc5/0x1a0
Oct 20 10:03:53 mikeb kernel:  [tail_balance_dirty_pages+47/64]
tail_balance_dirty_pages+0x2f/0x40
Oct 20 10:03:53 mikeb kernel:  [<c022d54f>]
tail_balance_dirty_pages+0x2f/0x40
Oct 20 10:03:53 mikeb kernel:  [write_tail+158/384]
write_tail+0x9e/0x180
Oct 20 10:03:53 mikeb kernel:  [<c022d6ae>] write_tail+0x9e/0x180
Oct 20 10:03:53 mikeb kernel:  [append_and_or_overwrite+473/992]
append_and_or_overwrite+0x1d9/0x3e0
Oct 20 10:03:53 mikeb kernel:  [<c02415d9>]
append_and_or_overwrite+0x1d9/0x3e0
Oct 20 10:03:53 mikeb kernel:  [write_tail+0/384] write_tail+0x0/0x180
Oct 20 10:03:53 mikeb kernel:  [<c022d610>] write_tail+0x0/0x180
Oct 20 10:03:53 mikeb kernel:  [write_flow+132/144] write_flow+0x84/0x90
Oct 20 10:03:53 mikeb kernel:  [<c0241864>] write_flow+0x84/0x90
Oct 20 10:03:53 mikeb kernel:  [get_exclusive_access+16/32]
get_exclusive_access+0x10/0x20
Oct 20 10:03:53 mikeb kernel:  [<c0242650>]
get_exclusive_access+0x10/0x20
Oct 20 10:03:53 mikeb kernel:  [write_unix_file+346/576]
write_unix_file+0x15a/0x240
Oct 20 10:03:53 mikeb kernel:  [<c0241c2a>] write_unix_file+0x15a/0x240
Oct 20 10:03:53 mikeb kernel:  [do_sync_read+139/224]
do_sync_read+0x8b/0xe0
Oct 20 10:03:53 mikeb kernel:  [<c014c0eb>] do_sync_read+0x8b/0xe0
Oct 20 10:03:53 mikeb kernel:  [reiser4_write+141/272]
reiser4_write+0x8d/0x110
Oct 20 10:03:53 mikeb kernel:  [<c02196ad>] reiser4_write+0x8d/0x110
Oct 20 10:03:53 mikeb kernel:  [reiser4_write+0/272]
reiser4_write+0x0/0x110
Oct 20 10:03:53 mikeb kernel:  [<c0219620>] reiser4_write+0x0/0x110
Oct 20 10:03:53 mikeb kernel:  [vfs_write+246/320] vfs_write+0xf6/0x140
Oct 20 10:03:53 mikeb kernel:  [<c014c456>] vfs_write+0xf6/0x140
Oct 20 10:03:53 mikeb kernel:  [sys_write+66/112] sys_write+0x42/0x70
Oct 20 10:03:53 mikeb kernel:  [<c014c552>] sys_write+0x42/0x70
Oct 20 10:03:53 mikeb kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Oct 20 10:03:53 mikeb kernel:  [<c01092cb>] syscall_call+0x7/0xb
Oct 20 10:03:53 mikeb kernel:
Oct 20 10:03:53 mikeb kernel: Code: 8b 80 64 01 00 00 8b 58 30 74 4b 31
f6 eb 14 8d b4 26 00 00
Oct 20 10:03:53 mikeb kernel:  <6>note: cp[19628] exited with
preempt_count 1
Oct 20 10:03:53 mikeb kernel: bad: scheduling while atomic!
Oct 20 10:03:53 mikeb kernel: Call Trace:
Oct 20 10:03:53 mikeb kernel:  [schedule+1470/1536] schedule+0x5be/0x600
Oct 20 10:03:53 mikeb kernel:  [<c011406e>] schedule+0x5be/0x600
Oct 20 10:03:53 mikeb kernel:  [unmap_page_range+67/128]
unmap_page_range+0x43/0x80
Oct 20 10:03:53 mikeb kernel:  [<c013c673>] unmap_page_range+0x43/0x80
Oct 20 10:03:53 mikeb kernel:  [unmap_vmas+537/560]
unmap_vmas+0x219/0x230
Oct 20 10:03:53 mikeb kernel:  [<c013c8c9>] unmap_vmas+0x219/0x230
Oct 20 10:03:53 mikeb kernel:  [exit_mmap+123/448] exit_mmap+0x7b/0x1c0
Oct 20 10:03:53 mikeb kernel:  [<c014093b>] exit_mmap+0x7b/0x1c0
Oct 20 10:03:53 mikeb kernel:  [mmput+97/176] mmput+0x61/0xb0
Oct 20 10:03:53 mikeb kernel:  [<c0115a91>] mmput+0x61/0xb0
Oct 20 10:03:53 mikeb kernel:  [do_exit+289/1040] do_exit+0x121/0x410
Oct 20 10:03:53 mikeb kernel:  [<c0119c21>] do_exit+0x121/0x410
Oct 20 10:03:53 mikeb kernel:  [do_page_fault+0/1174]
do_page_fault+0x0/0x496
Oct 20 10:03:53 mikeb kernel:  [<c0112050>] do_page_fault+0x0/0x496
Oct 20 10:03:53 mikeb kernel:  [die+225/240] die+0xe1/0xf0
Oct 20 10:03:53 mikeb kernel:  [<c0109b31>] die+0xe1/0xf0
Oct 20 10:03:53 mikeb kernel:  [do_page_fault+1072/1174]
do_page_fault+0x430/0x496
Oct 20 10:03:53 mikeb kernel:  [<c0112480>] do_page_fault+0x430/0x496
Oct 20 10:03:53 mikeb kernel:  [writeout+99/176] writeout+0x63/0xb0
Oct 20 10:03:53 mikeb kernel:  [<c0217203>] writeout+0x63/0xb0
Oct 20 10:03:53 mikeb kernel:  [reiser4_exit_context+30/112]
reiser4_exit_context+0x1e/0x70
Oct 20 10:03:53 mikeb kernel:  [<c0201dbe>]
reiser4_exit_context+0x1e/0x70
Oct 20 10:03:53 mikeb kernel:  [reiser4_sync_inodes+125/176]
reiser4_sync_inodes+0x7d/0xb0
Oct 20 10:03:53 mikeb kernel:  [<c02172cd>]
reiser4_sync_inodes+0x7d/0xb0
Oct 20 10:03:53 mikeb kernel:  [do_page_fault+0/1174]
do_page_fault+0x0/0x496
Oct 20 10:03:53 mikeb kernel:  [<c0112050>] do_page_fault+0x0/0x496
Oct 20 10:03:53 mikeb kernel:  [error_code+45/56] error_code+0x2d/0x38
Oct 20 10:03:53 mikeb kernel:  [<c0109475>] error_code+0x2d/0x38
Oct 20 10:03:53 mikeb kernel:  [_end+541344002/1069149528]
smb_show_options+0x1a/0x1b0 [smbfs]
Oct 20 10:03:53 mikeb kernel:  [<e08a33aa>] smb_show_options+0x1a/0x1b0
[smbfs]
Oct 20 10:03:53 mikeb kernel:  [sync_sb_inodes+46/64]
sync_sb_inodes+0x2e/0x40
Oct 20 10:03:53 mikeb kernel:  [<c016d99e>] sync_sb_inodes+0x2e/0x40
Oct 20 10:03:53 mikeb kernel:  [writeback_inodes+77/176]
writeback_inodes+0x4d/0xb0
Oct 20 10:03:53 mikeb kernel:  [<c016d9fd>] writeback_inodes+0x4d/0xb0
Oct 20 10:03:53 mikeb kernel:  [balance_dirty_pages+72/320]
balance_dirty_pages+0x48/0x140
Oct 20 10:03:53 mikeb kernel:  [<c0134dd8>]
balance_dirty_pages+0x48/0x140
Oct 20 10:03:53 mikeb kernel:  [item_balance_dirty_pages+197/416]
item_balance_dirty_pages+0xc5/0x1a0
Oct 20 10:03:53 mikeb kernel:  [<c022d445>]
item_balance_dirty_pages+0xc5/0x1a0
Oct 20 10:03:53 mikeb kernel:  [tail_balance_dirty_pages+47/64]
tail_balance_dirty_pages+0x2f/0x40
Oct 20 10:03:53 mikeb kernel:  [<c022d54f>]
tail_balance_dirty_pages+0x2f/0x40
Oct 20 10:03:53 mikeb kernel:  [write_tail+158/384]
write_tail+0x9e/0x180
Oct 20 10:03:53 mikeb kernel:  [<c022d6ae>] write_tail+0x9e/0x180
Oct 20 10:03:53 mikeb kernel:  [append_and_or_overwrite+473/992]
append_and_or_overwrite+0x1d9/0x3e0
Oct 20 10:03:53 mikeb kernel:  [<c02415d9>]
append_and_or_overwrite+0x1d9/0x3e0
Oct 20 10:03:53 mikeb kernel:  [write_tail+0/384] write_tail+0x0/0x180
Oct 20 10:03:53 mikeb kernel:  [<c022d610>] write_tail+0x0/0x180
Oct 20 10:03:53 mikeb kernel:  [write_flow+132/144] write_flow+0x84/0x90
Oct 20 10:03:53 mikeb kernel:  [<c0241864>] write_flow+0x84/0x90
Oct 20 10:03:53 mikeb kernel:  [get_exclusive_access+16/32]
get_exclusive_access+0x10/0x20
Oct 20 10:03:53 mikeb kernel:  [<c0242650>]
get_exclusive_access+0x10/0x20
Oct 20 10:03:53 mikeb kernel:  [write_unix_file+346/576]
write_unix_file+0x15a/0x240
Oct 20 10:03:53 mikeb kernel:  [<c0241c2a>] write_unix_file+0x15a/0x240
Oct 20 10:03:53 mikeb kernel:  [do_sync_read+139/224]
do_sync_read+0x8b/0xe0
Oct 20 10:03:53 mikeb kernel:  [<c014c0eb>] do_sync_read+0x8b/0xe0
Oct 20 10:03:53 mikeb kernel:  [reiser4_write+141/272]
reiser4_write+0x8d/0x110
Oct 20 10:03:53 mikeb kernel:  [<c02196ad>] reiser4_write+0x8d/0x110
Oct 20 10:03:53 mikeb kernel:  [reiser4_write+0/272]
reiser4_write+0x0/0x110
Oct 20 10:03:53 mikeb kernel:  [<c0219620>] reiser4_write+0x0/0x110
Oct 20 10:03:53 mikeb kernel:  [vfs_write+246/320] vfs_write+0xf6/0x140
Oct 20 10:03:53 mikeb kernel:  [<c014c456>] vfs_write+0xf6/0x140
Oct 20 10:03:53 mikeb kernel:  [sys_write+66/112] sys_write+0x42/0x70
Oct 20 10:03:53 mikeb kernel:  [<c014c552>] sys_write+0x42/0x70
Oct 20 10:03:53 mikeb kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Oct 20 10:03:53 mikeb kernel:  [<c01092cb>] syscall_call+0x7/0xb
Oct 20 10:03:53 mikeb kernel:
Oct 20 10:03:53 mikeb kernel: bad: scheduling while atomic!
Oct 20 10:03:53 mikeb kernel: Call Trace:
Oct 20 10:03:53 mikeb kernel:  [schedule+1470/1536] schedule+0x5be/0x600
Oct 20 10:03:53 mikeb kernel:  [<c011406e>] schedule+0x5be/0x600
Oct 20 10:03:53 mikeb kernel:  [update_process_times+70/96]
update_process_times+0x46/0x60
Oct 20 10:03:53 mikeb kernel:  [<c011fb56>]
update_process_times+0x46/0x60
Oct 20 10:03:53 mikeb kernel:  [__down+123/272] __down+0x7b/0x110
Oct 20 10:03:53 mikeb kernel:  [<c0107f8b>] __down+0x7b/0x110
Oct 20 10:03:53 mikeb kernel:  [default_wake_function+0/48]
default_wake_function+0x0/0x30
Oct 20 10:03:53 mikeb kernel:  [<c0114100>]
default_wake_function+0x0/0x30
Oct 20 10:03:53 mikeb kernel:  [__down_failed+8/12]
__down_failed+0x8/0xc
Oct 20 10:03:53 mikeb kernel:  [<c01081e0>] __down_failed+0x8/0xc
Oct 20 10:03:53 mikeb kernel:  [.text.lock.kcond+15/72]
.text.lock.kcond+0xf/0x48
Oct 20 10:03:53 mikeb kernel:  [<c0211ad7>] .text.lock.kcond+0xf/0x48
Oct 20 10:03:53 mikeb kernel:  [common_interrupt+24/32]
common_interrupt+0x18/0x20
Oct 20 10:03:53 mikeb kernel:  [<c0109438>] common_interrupt+0x18/0x20
Oct 20 10:03:53 mikeb kernel:  [rw_latch_down_write+52/112]
rw_latch_down_write+0x34/0x70
Oct 20 10:03:53 mikeb kernel:  [<c0211bd4>]
rw_latch_down_write+0x34/0x70
Oct 20 10:03:53 mikeb kernel:  [get_exclusive_access+16/32]
get_exclusive_access+0x10/0x20
Oct 20 10:03:53 mikeb kernel:  [<c0242650>]
get_exclusive_access+0x10/0x20
Oct 20 10:03:53 mikeb kernel:  [release_unix_file+39/240]
release_unix_file+0x27/0xf0
Oct 20 10:03:53 mikeb kernel:  [<c0241d37>] release_unix_file+0x27/0xf0
Oct 20 10:03:53 mikeb kernel:  [reiser4_release+154/192]
reiser4_release+0x9a/0xc0
Oct 20 10:03:53 mikeb kernel:  [<c02197ca>] reiser4_release+0x9a/0xc0
Oct 20 10:03:53 mikeb kernel:  [__fput+282/352] __fput+0x11a/0x160
Oct 20 10:03:53 mikeb kernel:  [<c014d3ea>] __fput+0x11a/0x160
Oct 20 10:03:53 mikeb kernel:  [filp_close+89/160] filp_close+0x59/0xa0
Oct 20 10:03:53 mikeb kernel:  [<c014b869>] filp_close+0x59/0xa0
Oct 20 10:03:53 mikeb kernel:  [put_files_struct+90/192]
put_files_struct+0x5a/0xc0
Oct 20 10:03:53 mikeb kernel:  [<c0118f3a>] put_files_struct+0x5a/0xc0
Oct 20 10:03:53 mikeb kernel:  [do_exit+348/1040] do_exit+0x15c/0x410
Oct 20 10:03:53 mikeb kernel:  [<c0119c5c>] do_exit+0x15c/0x410
Oct 20 10:03:53 mikeb kernel:  [do_page_fault+0/1174]
do_page_fault+0x0/0x496
Oct 20 10:03:53 mikeb kernel:  [<c0112050>] do_page_fault+0x0/0x496
Oct 20 10:03:53 mikeb kernel:  [die+225/240] die+0xe1/0xf0
Oct 20 10:03:53 mikeb kernel:  [<c0109b31>] die+0xe1/0xf0
Oct 20 10:03:53 mikeb kernel:  [do_page_fault+1072/1174]
do_page_fault+0x430/0x496
Oct 20 10:03:53 mikeb kernel:  [<c0112480>] do_page_fault+0x430/0x496
Oct 20 10:03:53 mikeb kernel:  [writeout+99/176] writeout+0x63/0xb0
Oct 20 10:03:53 mikeb kernel:  [<c0217203>] writeout+0x63/0xb0
Oct 20 10:03:53 mikeb kernel:  [reiser4_exit_context+30/112]
reiser4_exit_context+0x1e/0x70
Oct 20 10:03:53 mikeb kernel:  [reiser4_sync_inodes+125/176]
reiser4_sync_inodes+0x7d/0xb0
Oct 20 10:03:53 mikeb kernel:  [<c02172cd>]
reiser4_sync_inodes+0x7d/0xb0
Oct 20 10:03:53 mikeb kernel:  [do_page_fault+0/1174]
do_page_fault+0x0/0x496
Oct 20 10:03:53 mikeb kernel:  [<c0112050>] do_page_fault+0x0/0x496
Oct 20 10:03:53 mikeb kernel:  [error_code+45/56] error_code+0x2d/0x38
Oct 20 10:03:53 mikeb kernel:  [<c0109475>] error_code+0x2d/0x38
Oct 20 10:03:53 mikeb kernel:  [_end+541344002/1069149528]
smb_show_options+0x1a/0x1b0 [smbfs]
Oct 20 10:03:53 mikeb kernel:  [<e08a33aa>] smb_show_options+0x1a/0x1b0
[smbfs]
Oct 20 10:03:53 mikeb kernel:  [sync_sb_inodes+46/64]
sync_sb_inodes+0x2e/0x40
Oct 20 10:03:53 mikeb kernel:  [<c016d99e>] sync_sb_inodes+0x2e/0x40
Oct 20 10:03:53 mikeb kernel:  [writeback_inodes+77/176]
writeback_inodes+0x4d/0xb0
Oct 20 10:03:53 mikeb kernel:  [<c016d9fd>] writeback_inodes+0x4d/0xb0
Oct 20 10:03:53 mikeb kernel:  [balance_dirty_pages+72/320]
balance_dirty_pages+0x48/0x140
Oct 20 10:03:53 mikeb kernel:  [<c0134dd8>]
balance_dirty_pages+0x48/0x140
Oct 20 10:03:53 mikeb kernel:  [item_balance_dirty_pages+197/416]
item_balance_dirty_pages+0xc5/0x1a0
Oct 20 10:03:53 mikeb kernel:  [<c022d445>]
item_balance_dirty_pages+0xc5/0x1a0
Oct 20 10:03:53 mikeb kernel:  [tail_balance_dirty_pages+47/64]
tail_balance_dirty_pages+0x2f/0x40
Oct 20 10:03:53 mikeb kernel:  [<c022d54f>]
tail_balance_dirty_pages+0x2f/0x40
Oct 20 10:03:53 mikeb kernel:  [write_tail+158/384]
write_tail+0x9e/0x180
Oct 20 10:03:53 mikeb kernel:  [<c022d6ae>] write_tail+0x9e/0x180
Oct 20 10:03:53 mikeb kernel:  [append_and_or_overwrite+473/992]
append_and_or_overwrite+0x1d9/0x3e0
Oct 20 10:03:53 mikeb kernel:  [<c02415d9>]
append_and_or_overwrite+0x1d9/0x3e0
Oct 20 10:03:53 mikeb kernel:  [write_tail+0/384] write_tail+0x0/0x180
Oct 20 10:03:53 mikeb kernel:  [<c022d610>] write_tail+0x0/0x180
Oct 20 10:03:53 mikeb kernel:  [write_flow+132/144] write_flow+0x84/0x90
Oct 20 10:03:53 mikeb kernel:  [<c0241864>] write_flow+0x84/0x90
Oct 20 10:03:53 mikeb kernel:  [get_exclusive_access+16/32]
get_exclusive_access+0x10/0x20
Oct 20 10:03:53 mikeb kernel:  [<c0242650>]
get_exclusive_access+0x10/0x20
Oct 20 10:03:53 mikeb kernel:  [write_unix_file+346/576]
write_unix_file+0x15a/0x240
Oct 20 10:03:53 mikeb kernel:  [<c0241c2a>] write_unix_file+0x15a/0x240
Oct 20 10:03:53 mikeb kernel:  [do_sync_read+139/224]
do_sync_read+0x8b/0xe0
Oct 20 10:03:53 mikeb kernel:  [<c014c0eb>] do_sync_read+0x8b/0xe0
Oct 20 10:03:53 mikeb kernel:  [reiser4_write+141/272]
reiser4_write+0x8d/0x110
Oct 20 10:03:53 mikeb kernel:  [<c02196ad>] reiser4_write+0x8d/0x110
Oct 20 10:03:53 mikeb kernel:  [reiser4_write+0/272]
reiser4_write+0x0/0x110
Oct 20 10:03:53 mikeb kernel:  [<c0219620>] reiser4_write+0x0/0x110
Oct 20 10:03:53 mikeb kernel:  [vfs_write+246/320] vfs_write+0xf6/0x140
Oct 20 10:03:53 mikeb kernel:  [<c014c456>] vfs_write+0xf6/0x140
Oct 20 10:03:53 mikeb kernel:  [sys_write+66/112] sys_write+0x42/0x70
Oct 20 10:03:53 mikeb kernel:  [<c014c552>] sys_write+0x42/0x70
Oct 20 10:03:53 mikeb kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Oct 20 10:03:53 mikeb kernel:  [<c01092cb>] syscall_call+0x7/0xb
Oct 20 10:03:53 mikeb kernel:
Oct 20 10:05:00 mikeb CROND[19654]: (root) CMD (  
/usr/share/sshd-monitor/sshd-restarter)
Oct 20 10:05:00 mikeb sshd[19659]: Did not receive identification string
from 127.0.0.1
Oct 20 10:06:06 mikeb shutdown: shutting down for system reboot
Oct 20 10:06:07 mikeb kernel: Unable to handle kernel NULL pointer
dereference at virtual address 00000164
Oct 20 10:06:07 mikeb kernel:  printing eip:
Oct 20 10:06:07 mikeb kernel: e08a33aa
Oct 20 10:06:07 mikeb kernel: *pde = 00000000
Oct 20 10:06:07 mikeb kernel: Oops: 0000 [#7]
Oct 20 10:06:07 mikeb kernel: CPU:    0
Oct 20 10:06:07 mikeb kernel: EIP:   
0060:[_end+541344002/1069149528]    Not tainted
Oct 20 10:06:07 mikeb kernel: EIP:    0060:[<e08a33aa>]    Not tainted
Oct 20 10:06:07 mikeb kernel: EFLAGS: 00010282
Oct 20 10:06:07 mikeb kernel: EIP is at smb_show_options+0x1a/0x1b0
[smbfs]
Oct 20 10:06:07 mikeb kernel: eax: 00000000   ebx: d3c5c000   ecx:
d3c5def0   edx: e08a689d
Oct 20 10:06:07 mikeb kernel: esi: d3c5def0   edi: d3c5df10   ebp:
cf7cdc00   esp: d3c5debc
Oct 20 10:06:07 mikeb kernel: ds: 007b   es: 007b   ss: 0068
Oct 20 10:06:07 mikeb kernel: Process shutdown (pid: 19669,
threadinfo=d3c5c000 task=d4302c80)
Oct 20 10:06:07 mikeb kernel: Stack: 00000000 fffb6c20 00000000 d3c5c000
d3c5def0 d3c5df10 d3c5c000 c016d99e
Oct 20 10:06:07 mikeb kernel:        cf7cdc00 d3c5def0 c016dae2 cf7cdc00
d3c5def0 00000000 00000002 00000000
Oct 20 10:06:07 mikeb kernel:        00004042 00000000 00000000 00000000
00000000 000000a0 00000000 00000000
Oct 20 10:06:07 mikeb kernel: Call Trace:
Oct 20 10:06:07 mikeb kernel:  [sync_sb_inodes+46/64]
sync_sb_inodes+0x2e/0x40
Oct 20 10:06:07 mikeb kernel:  [<c016d99e>] sync_sb_inodes+0x2e/0x40
Oct 20 10:06:07 mikeb kernel:  [sync_inodes_sb+130/160]
sync_inodes_sb+0x82/0xa0
Oct 20 10:06:07 mikeb kernel:  [<c016dae2>] sync_inodes_sb+0x82/0xa0
Oct 20 10:06:07 mikeb kernel:  [sync_inodes+34/160]
sync_inodes+0x22/0xa0
Oct 20 10:06:07 mikeb kernel:  [<c016dc02>] sync_inodes+0x22/0xa0
Oct 20 10:06:07 mikeb kernel:  [do_sync+32/112] do_sync+0x20/0x70
Oct 20 10:06:07 mikeb kernel:  [<c014dc20>] do_sync+0x20/0x70
Oct 20 10:06:07 mikeb kernel:  [sys_sync+15/32] sys_sync+0xf/0x20
Oct 20 10:06:07 mikeb kernel:  [<c014dc7f>] sys_sync+0xf/0x20
Oct 20 10:06:07 mikeb kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Oct 20 10:06:07 mikeb kernel:  [<c01092cb>] syscall_call+0x7/0xb
Oct 20 10:06:07 mikeb kernel:
Oct 20 10:06:07 mikeb kernel: Code: 8b 80 64 01 00 00 8b 58 30 74 4b 31
f6 eb 14 8d b4 26 00 00
Oct 20 10:06:07 mikeb kernel:  <6>note: shutdown[19669] exited with
preempt_count 1
Oct 20 10:06:07 mikeb kernel: bad: scheduling while atomic!
Oct 20 10:06:07 mikeb kernel: Call Trace:
Oct 20 10:06:07 mikeb kernel:  [schedule+1470/1536] schedule+0x5be/0x600
Oct 20 10:06:07 mikeb kernel:  [<c011406e>] schedule+0x5be/0x600
Oct 20 10:06:07 mikeb kernel:  [unmap_page_range+67/128]
unmap_page_range+0x43/0x80
Oct 20 10:06:07 mikeb kernel:  [<c013c673>] unmap_page_range+0x43/0x80
Oct 20 10:06:07 mikeb kernel:  [unmap_vmas+537/560]
unmap_vmas+0x219/0x230
Oct 20 10:06:07 mikeb kernel:  [<c013c8c9>] unmap_vmas+0x219/0x230
Oct 20 10:06:07 mikeb kernel:  [exit_mmap+123/448] exit_mmap+0x7b/0x1c0
Oct 20 10:06:07 mikeb kernel:  [<c014093b>] exit_mmap+0x7b/0x1c0
Oct 20 10:06:07 mikeb kernel:  [mmput+97/176] mmput+0x61/0xb0
Oct 20 10:06:07 mikeb kernel:  [<c0115a91>] mmput+0x61/0xb0
Oct 20 10:06:07 mikeb kernel:  [do_exit+289/1040] do_exit+0x121/0x410
Oct 20 10:06:07 mikeb kernel:  [<c0119c21>] do_exit+0x121/0x410
Oct 20 10:06:07 mikeb kernel:  [do_page_fault+0/1174]
do_page_fault+0x0/0x496
Oct 20 10:06:07 mikeb kernel:  [<c0112050>] do_page_fault+0x0/0x496
Oct 20 10:06:07 mikeb kernel:  [die+225/240] die+0xe1/0xf0
Oct 20 10:06:07 mikeb kernel:  [<c0109b31>] die+0xe1/0xf0
Oct 20 10:06:07 mikeb kernel:  [do_page_fault+1072/1174]
do_page_fault+0x430/0x496
Oct 20 10:06:07 mikeb kernel:  [<c0112480>] do_page_fault+0x430/0x496
Oct 20 10:06:07 mikeb kernel:  [txn_begin+29/48] txn_begin+0x1d/0x30
Oct 20 10:06:07 mikeb kernel:  [<c02051bd>] txn_begin+0x1d/0x30
Oct 20 10:06:07 mikeb kernel:  [force_commit_atom_nolock+79/112]
force_commit_atom_nolock+0x4f/0x70
Oct 20 10:06:07 mikeb kernel:  [<c0205cef>]
force_commit_atom_nolock+0x4f/0x70
Oct 20 10:06:07 mikeb kernel:  [txnmgr_force_commit_all+280/320]
txnmgr_force_commit_all+0x118/0x140
Oct 20 10:06:07 mikeb kernel:  [<c0205e88>]
txnmgr_force_commit_all+0x118/0x140
Oct 20 10:06:07 mikeb kernel:  [writeout+99/176] writeout+0x63/0xb0
Oct 20 10:06:07 mikeb kernel:  [<c0217203>] writeout+0x63/0xb0
Oct 20 10:06:07 mikeb kernel:  [reiser4_exit_context+78/112]
reiser4_exit_context+0x4e/0x70
Oct 20 10:06:07 mikeb kernel:  [<c0201dee>]
reiser4_exit_context+0x4e/0x70
Oct 20 10:06:07 mikeb kernel:  [reiser4_sync_inodes+125/176]
reiser4_sync_inodes+0x7d/0xb0
Oct 20 10:06:07 mikeb kernel:  [<c02172cd>]
reiser4_sync_inodes+0x7d/0xb0
Oct 20 10:06:07 mikeb kernel:  [do_page_fault+0/1174]
do_page_fault+0x0/0x496
Oct 20 10:06:07 mikeb kernel:  [<c0112050>] do_page_fault+0x0/0x496
Oct 20 10:06:07 mikeb kernel:  [error_code+45/56] error_code+0x2d/0x38
Oct 20 10:06:07 mikeb kernel:  [<c0109475>] error_code+0x2d/0x38
Oct 20 10:06:07 mikeb kernel:  [_end+541344002/1069149528]
smb_show_options+0x1a/0x1b0 [smbfs]
Oct 20 10:06:07 mikeb kernel:  [<e08a33aa>] smb_show_options+0x1a/0x1b0
[smbfs]
Oct 20 10:06:07 mikeb kernel:  [sync_sb_inodes+46/64]
sync_sb_inodes+0x2e/0x40
Oct 20 10:06:07 mikeb kernel:  [<c016d99e>] sync_sb_inodes+0x2e/0x40
Oct 20 10:06:07 mikeb kernel:  [sync_inodes_sb+130/160]
sync_inodes_sb+0x82/0xa0
Oct 20 10:06:07 mikeb kernel:  [<c016dae2>] sync_inodes_sb+0x82/0xa0
Oct 20 10:06:07 mikeb kernel:  [sync_inodes+34/160]
sync_inodes+0x22/0xa0
Oct 20 10:06:07 mikeb kernel:  [<c016dc02>] sync_inodes+0x22/0xa0
Oct 20 10:06:07 mikeb kernel:  [do_sync+32/112] do_sync+0x20/0x70
Oct 20 10:06:07 mikeb kernel:  [<c014dc20>] do_sync+0x20/0x70
Oct 20 10:06:07 mikeb kernel:  [sys_sync+15/32] sys_sync+0xf/0x20
Oct 20 10:06:07 mikeb kernel:  [<c014dc7f>] sys_sync+0xf/0x20
Oct 20 10:06:07 mikeb kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Oct 20 10:06:07 mikeb kernel:  [<c01092cb>] syscall_call+0x7/0xb
Oct 20 10:06:07 mikeb kernel:
Oct 20 10:06:15 mikeb kernel: Unable to handle kernel NULL pointer
dereference at virtual address 00000164
Oct 20 10:06:15 mikeb kernel:  printing eip:
Oct 20 10:06:15 mikeb kernel: e08a33aa
Oct 20 10:06:15 mikeb kernel: *pde = 00000000
Oct 20 10:06:15 mikeb kernel: Oops: 0000 [#8]
Oct 20 10:06:15 mikeb kernel: CPU:    0
Oct 20 10:06:15 mikeb kernel: EIP:   
0060:[_end+541344002/1069149528]    Not tainted
Oct 20 10:06:15 mikeb kernel: EIP:    0060:[<e08a33aa>]    Not tainted
Oct 20 10:06:15 mikeb kernel: EFLAGS: 00010282
Oct 20 10:06:15 mikeb kernel: EIP is at smb_show_options+0x1a/0x1b0
[smbfs]
Oct 20 10:06:15 mikeb kernel: eax: 00000000   ebx: d4378000   ecx:
d4379ef0   edx: e08a689d
Oct 20 10:06:15 mikeb kernel: esi: d4379ef0   edi: d4379f10   ebp:
cf7cdc00   esp: d4379ebc
Oct 20 10:06:15 mikeb kernel: ds: 007b   es: 007b   ss: 0068
Oct 20 10:06:15 mikeb kernel: Process sync (pid: 19671,
threadinfo=d4378000 task=d4302080)
Oct 20 10:06:15 mikeb kernel: Stack: 00000000 fffb6c20 00000000 d4378000
d4379ef0 d4379f10 d4378000 c016d99e
Oct 20 10:06:15 mikeb kernel:        cf7cdc00 d4379ef0 c016dae2 cf7cdc00
d4379ef0 00000000 00000002 00000000
Oct 20 10:06:15 mikeb kernel:        0000405a 00000000 00000000 00000000
00000000 000000a9 00000000 00000000
Oct 20 10:06:15 mikeb kernel: Call Trace:
Oct 20 10:06:15 mikeb kernel:  [sync_sb_inodes+46/64]
sync_sb_inodes+0x2e/0x40
Oct 20 10:06:15 mikeb kernel:  [<c016d99e>] sync_sb_inodes+0x2e/0x40
Oct 20 10:06:15 mikeb kernel:  [sync_inodes_sb+130/160]
sync_inodes_sb+0x82/0xa0
Oct 20 10:06:15 mikeb kernel:  [<c016dae2>] sync_inodes_sb+0x82/0xa0
Oct 20 10:06:15 mikeb kernel:  [sync_inodes+34/160]
sync_inodes+0x22/0xa0
Oct 20 10:06:15 mikeb kernel:  [<c016dc02>] sync_inodes+0x22/0xa0
Oct 20 10:06:15 mikeb kernel:  [do_sync+32/112] do_sync+0x20/0x70
Oct 20 10:06:15 mikeb kernel:  [<c014dc20>] do_sync+0x20/0x70
Oct 20 10:06:15 mikeb kernel:  [sys_sync+15/32] sys_sync+0xf/0x20
Oct 20 10:06:15 mikeb kernel:  [<c014dc7f>] sys_sync+0xf/0x20
Oct 20 10:06:15 mikeb kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Oct 20 10:06:15 mikeb kernel:  [<c01092cb>] syscall_call+0x7/0xb
Oct 20 10:06:15 mikeb kernel:
Oct 20 10:06:15 mikeb kernel: Code: 8b 80 64 01 00 00 8b 58 30 74 4b 31
f6 eb 14 8d b4 26 00 00
Oct 20 10:06:15 mikeb kernel:  <6>note: sync[19671] exited with
preempt_count 1
Oct 20 10:06:15 mikeb kernel: bad: scheduling while atomic!
Oct 20 10:06:15 mikeb kernel: Call Trace:
Oct 20 10:06:15 mikeb kernel:  [schedule+1470/1536] schedule+0x5be/0x600
Oct 20 10:06:15 mikeb kernel:  [<c011406e>] schedule+0x5be/0x600
Oct 20 10:06:15 mikeb kernel:  [unmap_page_range+67/128]
unmap_page_range+0x43/0x80
Oct 20 10:06:15 mikeb kernel:  [<c013c673>] unmap_page_range+0x43/0x80
Oct 20 10:06:15 mikeb kernel:  [unmap_vmas+537/560]
unmap_vmas+0x219/0x230
Oct 20 10:06:15 mikeb kernel:  [<c013c8c9>] unmap_vmas+0x219/0x230
Oct 20 10:06:15 mikeb kernel:  [exit_mmap+123/448] exit_mmap+0x7b/0x1c0
Oct 20 10:06:15 mikeb kernel:  [<c014093b>] exit_mmap+0x7b/0x1c0
Oct 20 10:06:15 mikeb kernel:  [mmput+97/176] mmput+0x61/0xb0
Oct 20 10:06:15 mikeb kernel:  [<c0115a91>] mmput+0x61/0xb0
Oct 20 10:06:15 mikeb kernel:  [do_exit+289/1040] do_exit+0x121/0x410
Oct 20 10:06:15 mikeb kernel:  [<c0119c21>] do_exit+0x121/0x410
Oct 20 10:06:15 mikeb kernel:  [do_page_fault+0/1174]
do_page_fault+0x0/0x496
Oct 20 10:06:15 mikeb kernel:  [<c0112050>] do_page_fault+0x0/0x496
Oct 20 10:06:15 mikeb kernel:  [die+225/240] die+0xe1/0xf0
Oct 20 10:06:15 mikeb kernel:  [<c0109b31>] die+0xe1/0xf0
Oct 20 10:06:15 mikeb kernel:  [do_page_fault+1072/1174]
do_page_fault+0x430/0x496
Oct 20 10:06:15 mikeb kernel:  [<c0112480>] do_page_fault+0x430/0x496
Oct 20 10:06:15 mikeb kernel:  [txn_begin+29/48] txn_begin+0x1d/0x30
Oct 20 10:06:15 mikeb kernel:  [<c02051bd>] txn_begin+0x1d/0x30
Oct 20 10:06:15 mikeb kernel:  [txnmgr_force_commit_all+52/320]
txnmgr_force_commit_all+0x34/0x140
Oct 20 10:06:15 mikeb kernel:  [<c0205da4>]
txnmgr_force_commit_all+0x34/0x140
Oct 20 10:06:15 mikeb kernel:  [writeout+99/176] writeout+0x63/0xb0
Oct 20 10:06:15 mikeb kernel:  [<c0217203>] writeout+0x63/0xb0
Oct 20 10:06:15 mikeb kernel:  [reiser4_exit_context+78/112]
reiser4_exit_context+0x4e/0x70
Oct 20 10:06:15 mikeb kernel:  [<c0201dee>]
reiser4_exit_context+0x4e/0x70
Oct 20 10:06:15 mikeb kernel:  [reiser4_sync_inodes+125/176]
reiser4_sync_inodes+0x7d/0xb0
Oct 20 10:06:15 mikeb kernel:  [<c02172cd>]
reiser4_sync_inodes+0x7d/0xb0
Oct 20 10:06:15 mikeb kernel:  [do_page_fault+0/1174]
do_page_fault+0x0/0x496
Oct 20 10:06:15 mikeb kernel:  [<c0112050>] do_page_fault+0x0/0x496
Oct 20 10:06:15 mikeb kernel:  [error_code+45/56] error_code+0x2d/0x38
Oct 20 10:06:15 mikeb kernel:  [<c0109475>] error_code+0x2d/0x38
Oct 20 10:06:15 mikeb kernel:  [_end+541344002/1069149528]
smb_show_options+0x1a/0x1b0 [smbfs]
Oct 20 10:06:15 mikeb kernel:  [<e08a33aa>] smb_show_options+0x1a/0x1b0
[smbfs]
Oct 20 10:06:15 mikeb kernel:  [sync_sb_inodes+46/64]
sync_sb_inodes+0x2e/0x40
Oct 20 10:06:15 mikeb kernel:  [<c016d99e>] sync_sb_inodes+0x2e/0x40
Oct 20 10:06:15 mikeb kernel:  [sync_inodes_sb+130/160]
sync_inodes_sb+0x82/0xa0
Oct 20 10:06:15 mikeb kernel:  [<c016dae2>] sync_inodes_sb+0x82/0xa0
Oct 20 10:06:15 mikeb kernel:  [sync_inodes+34/160]
sync_inodes+0x22/0xa0
Oct 20 10:06:15 mikeb kernel:  [<c016dc02>] sync_inodes+0x22/0xa0
Oct 20 10:06:15 mikeb kernel:  [do_sync+32/112] do_sync+0x20/0x70
Oct 20 10:06:15 mikeb kernel:  [<c014dc20>] do_sync+0x20/0x70
Oct 20 10:06:15 mikeb kernel:  [sys_sync+15/32] sys_sync+0xf/0x20
Oct 20 10:06:15 mikeb kernel:  [<c014dc7f>] sys_sync+0xf/0x20
Oct 20 10:06:15 mikeb kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Oct 20 10:06:15 mikeb kernel:  [<c01092cb>] syscall_call+0x7/0xb
Oct 20 10:06:15 mikeb kernel:



-- 
Best Regards,
 
Mike Benoit
NetNation Communications Inc.
Systems Engineer
Tel: 604-684-6892 or 888-983-6600
 ---------------------------------------
 
 Disclaimer: Opinions expressed here are my own and not 
 necessarily those of my employer

