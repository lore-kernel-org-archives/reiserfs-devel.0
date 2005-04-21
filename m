From: Hans Reiser <reiser@namesys.com>
Subject: Re: file system curruption
Date: Thu, 21 Apr 2005 01:59:31 -0700
Message-ID: <42676B73.4040109@namesys.com>
References: <425FB56E.7060801@cpc.wmin.ac.uk> <1113817744.3975.58.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23902-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1113817744.3975.58.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Szabolcs Illes <illes@cpc.wmin.ac.uk>, reiserfs-list@namesys.com

Vladimir Saveliev wrote:

>Hello
>
>On Fri, 2005-04-15 at 16:37, Szabolcs Illes wrote:
>  
>
>>Hi,
>>
>>I have found these entries in my system log: (maybe it's a reiserfs4 bug)
>>
>>Mar 14 20:06:15 sunset reiser4[umount(8489)]: reiser4_handle_error (fs/reiser4/vfs_ops.c:1432)[foobar-42]:
>>Mar 14 20:06:15 sunset reiser4 panicked cowardly: Filesystem error occured
>>Mar 14 20:06:15 sunset 
>>    
>>
>
>This indicates that reiser4 were not able to write block to a disk. It
>is very likely that disk has problems.
>
>As you have fsck.reiser4-ed it succesfully - store data on better hard
>drive and start thinking about not using this device for reiser4,
>because such erorrs may come up again.
>  
>
Please send me a proposal for how you can change our error messages so 
that everything you advised in this email would already have been 
advised by the error messages.

>  
>
>>Mar 14 20:06:15 sunset ------------[ cut here ]------------
>>Mar 14 20:06:15 sunset kernel BUG at fs/reiser4/debug.c:131!
>>Mar 14 20:06:15 sunset invalid operand: 0000 [#1]
>>Mar 14 20:06:15 sunset PREEMPT 
>>Mar 14 20:06:15 sunset Modules linked in: michael_mic arc4 ieee80211_crypt_tkip crc32 ipw2200 firmware_class ieee80211 ieee80211_crypt yenta_socket pcmcia_core bcm4400 usbmouse usb_storage usbhid snd_intel8x0 snd_ac97_codec snd_pcm snd_timer snd soundcore snd_page_alloc ehci_hcd uhci_hcd usbcore i8k nvidia
>>Mar 14 20:06:15 sunset CPU:    0
>>Mar 14 20:06:15 sunset EIP:    0060:[<c018ec7d>]    Tainted: P      VLI
>>Mar 14 20:06:15 sunset EFLAGS: 00210246   (2.6.10) 
>>Mar 14 20:06:15 sunset EIP is at reiser4_do_panic+0xd/0xe0
>>Mar 14 20:06:15 sunset eax: 00000000   ebx: d4cde000   ecx: de11d000   edx: 00000001
>>Mar 14 20:06:15 sunset esi: d4cde000   edi: 00000000   ebp: 00000003   esp: d4cdfcc0
>>Mar 14 20:06:15 sunset ds: 007b   es: 007b   ss: 0068
>>Mar 14 20:06:15 sunset Process umount (pid: 8489, threadinfo=d4cde000 task=d639e0e0)
>>Mar 14 20:06:15 sunset Stack: d8bb2600 00000001 c0306903 d4cdfcdc c02f9b05 c01b0d3c c03068e9 00000001 
>>Mar 14 20:06:15 sunset c03068df c02f9b05 c0306620 00000598 d3fe4480 c01aadd2 d3fe4480 d4cdfd1c 
>>Mar 14 20:06:15 sunset d65030c0 d4cdfd1c d4cde000 d8bb2600 c01aae23 d65030c0 d4cdfd1c 00000003 
>>Mar 14 20:06:15 sunset Call Trace:
>>Mar 14 20:06:15 sunset [<c01b0d3c>] reiser4_handle_error+0xcc/0xd0
>>Mar 14 20:06:15 sunset [<c01aadd2>] finish_all_fq+0xb2/0xe0
>>Mar 14 20:06:15 sunset [<c01aae23>] current_atom_finish_all_fq+0x23/0x70
>>Mar 14 20:06:15 sunset [<c01a5e02>] reiser4_write_logs+0x1c2/0x330
>>Mar 14 20:06:15 sunset [<c019d5fc>] commit_current_atom+0x14c/0x250
>>Mar 14 20:06:15 sunset [<c019dff4>] try_commit_txnh+0x124/0x200
>>Mar 14 20:06:15 sunset [<c019e105>] commit_txnh+0x35/0xc0
>>Mar 14 20:06:15 sunset [<c019ccfc>] txn_end+0x3c/0x40
>>Mar 14 20:06:15 sunset [<c019cd10>] txn_restart+0x10/0x20
>>Mar 14 20:06:15 sunset [<c019cd3a>] txn_restart_current+0x1a/0x20
>>Mar 14 20:06:15 sunset [<c019d72f>] force_commit_atom_nolock+0x2f/0x50
>>Mar 14 20:06:15 sunset [<c019d8c2>] txnmgr_force_commit_all+0x102/0x130
>>Mar 14 20:06:15 sunset [<c01ddfcf>] release_format40+0x8f/0x140
>>Mar 14 20:06:15 sunset [<c01aa418>] kcond_signal+0x38/0x40
>>Mar 14 20:06:15 sunset [<c01b0a1e>] reiser4_put_super+0xde/0xe0
>>Mar 14 20:06:15 sunset [<c015b82d>] generic_shutdown_super+0x11d/0x130
>>Mar 14 20:06:15 sunset [<c015c3ce>] kill_block_super+0x2e/0x60
>>Mar 14 20:06:15 sunset [<c015b5fb>] deactivate_super+0x5b/0x90
>>Mar 14 20:06:15 sunset [<c01727cf>] sys_umount+0x3f/0xa0
>>Mar 14 20:06:15 sunset [<c0155f7f>] __fput+0xcf/0x160
>>Mar 14 20:06:15 sunset [<c0154552>] filp_close+0x52/0xa0
>>Mar 14 20:06:15 sunset [<c0172845>] sys_oldumount+0x15/0x20
>>Mar 14 20:06:15 sunset [<c01026ef>] syscall_call+0x7/0xb
>>Mar 14 20:06:15 sunset Code: fe ff ff 8d 42 68 e8 bf 6d 16 00 e9 77 ff ff ff 8d 42 68 e8 b2 6d 16 00 eb cc 90 90 90 90 53 83 ec 10 a1 80 bb 3d c0 85 c0 74 23 <0f> 0b 83 00 06 60 30 c0 c7 04 24 69 44 31 c0 b8 a0 bb 3d c0 89 
>>Mar 14 20:06:15 sunset <6>note: umount[8489] exited with preempt_count 2
>>Mar 14 20:06:15 sunset scheduling while atomic: umount/0x00000002/8489
>>Mar 14 20:06:15 sunset [<c02f5ef4>] schedule+0x4c4/0x580
>>Mar 14 20:06:15 sunset [<c0143bc3>] unmap_page_range+0x53/0x90
>>Mar 14 20:06:15 sunset [<c0143dcc>] unmap_vmas+0x1cc/0x1e0
>>Mar 14 20:06:15 sunset [<c014896c>] exit_mmap+0x7c/0x160
>>Mar 14 20:06:15 sunset [<c0114037>] mmput+0x37/0xa0
>>Mar 14 20:06:15 sunset [<c01188a6>] do_exit+0x166/0x430
>>Mar 14 20:06:15 sunset [<c0103400>] do_invalid_op+0x0/0xb0
>>Mar 14 20:06:15 sunset [<c010307b>] die+0x18b/0x190
>>Mar 14 20:06:15 sunset [<c01034a6>] do_invalid_op+0xa6/0xb0
>>Mar 14 20:06:15 sunset [<c01122e2>] try_to_wake_up+0xb2/0xc0
>>Mar 14 20:06:15 sunset [<c018ec7d>] reiser4_do_panic+0xd/0xe0
>>Mar 14 20:06:15 sunset [<c0112c48>] __wake_up_common+0x38/0x70
>>Mar 14 20:06:15 sunset [<c01169af>] release_console_sem+0xbf/0xd0
>>Mar 14 20:06:15 sunset [<c0102897>] error_code+0x2b/0x30
>>Mar 14 20:06:15 sunset [<c018ec7d>] reiser4_do_panic+0xd/0xe0
>>Mar 14 20:06:15 sunset [<c01b0d3c>] reiser4_handle_error+0xcc/0xd0
>>Mar 14 20:06:15 sunset [<c01aadd2>] finish_all_fq+0xb2/0xe0
>>Mar 14 20:06:15 sunset [<c01aae23>] current_atom_finish_all_fq+0x23/0x70
>>Mar 14 20:06:15 sunset [<c01a5e02>] reiser4_write_logs+0x1c2/0x330
>>Mar 14 20:06:15 sunset [<c019d5fc>] commit_current_atom+0x14c/0x250
>>Mar 14 20:06:15 sunset [<c019dff4>] try_commit_txnh+0x124/0x200
>>Mar 14 20:06:15 sunset [<c019e105>] commit_txnh+0x35/0xc0
>>Mar 14 20:06:15 sunset [<c019ccfc>] txn_end+0x3c/0x40
>>Mar 14 20:06:15 sunset [<c019cd10>] txn_restart+0x10/0x20
>>Mar 14 20:06:15 sunset [<c019cd3a>] txn_restart_current+0x1a/0x20
>>Mar 14 20:06:15 sunset [<c019d72f>] force_commit_atom_nolock+0x2f/0x50
>>Mar 14 20:06:15 sunset [<c019d8c2>] txnmgr_force_commit_all+0x102/0x130
>>Mar 14 20:06:15 sunset [<c01ddfcf>] release_format40+0x8f/0x140
>>Mar 14 20:06:15 sunset [<c01aa418>] kcond_signal+0x38/0x40
>>Mar 14 20:06:15 sunset [<c01b0a1e>] reiser4_put_super+0xde/0xe0
>>Mar 14 20:06:15 sunset [<c015b82d>] generic_shutdown_super+0x11d/0x130
>>Mar 14 20:06:15 sunset [<c015c3ce>] kill_block_super+0x2e/0x60
>>Mar 14 20:06:15 sunset [<c015b5fb>] deactivate_super+0x5b/0x90
>>Mar 14 20:06:15 sunset [<c01727cf>] sys_umount+0x3f/0xa0
>>Mar 14 20:06:15 sunset [<c0155f7f>] __fput+0xcf/0x160
>>Mar 14 20:06:15 sunset [<c0154552>] filp_close+0x52/0xa0
>>Mar 14 20:06:15 sunset [<c0172845>] sys_oldumount+0x15/0x20
>>Mar 14 20:06:15 sunset [<c01026ef>] syscall_call+0x7/0xb
>>...
>>Mar 19 12:36:14 sunset reiser4[umount(1504)]: reiser4_handle_error (fs/reiser4/vfs_ops.c:1432)[foobar-42]:
>>Mar 19 12:36:14 sunset reiser4 panicked cowardly: Filesystem error occured
>>Mar 19 12:36:14 sunset 
>>Mar 19 12:36:14 sunset ------------[ cut here ]------------
>>Mar 19 12:36:14 sunset kernel BUG at fs/reiser4/debug.c:131!
>>Mar 19 12:36:14 sunset invalid operand: 0000 [#1]
>>Mar 19 12:36:14 sunset PREEMPT 
>>Mar 19 12:36:14 sunset Modules linked in: usb_storage nls_iso8859_1 isofs nls_base michael_mic arc4 ieee80211_crypt_tkip crc32 ipw2200 firmware_class ieee80211 ieee80211_crypt yenta_socket pcmcia_core bcm4400 usbmouse usbhid snd_intel8x0 snd_ac97_codec snd_pcm snd_timer snd soundcore snd_page_alloc ehci_hcd uhci_hcd usbcore i8k nvidia
>>Mar 19 12:36:14 sunset CPU:    0
>>Mar 19 12:36:14 sunset EIP:    0060:[<c018ec7d>]    Tainted: P      VLI
>>Mar 19 12:36:14 sunset EFLAGS: 00210246   (2.6.10) 
>>Mar 19 12:36:14 sunset EIP is at reiser4_do_panic+0xd/0xe0
>>Mar 19 12:36:14 sunset eax: 00000000   ebx: d7990000   ecx: c9cfe800   edx: 00000001
>>Mar 19 12:36:14 sunset esi: d7990000   edi: 00000000   ebp: 00000003   esp: d7991cc0
>>Mar 19 12:36:14 sunset ds: 007b   es: 007b   ss: 0068
>>Mar 19 12:36:14 sunset Process umount (pid: 1504, threadinfo=d7990000 task=d1f71ac0)
>>Mar 19 12:36:14 sunset Stack: d6c31a00 00000001 c0306903 d7991cdc c02f9b05 c01b0d3c c03068e9 00000001 
>>Mar 19 12:36:14 sunset c03068df c02f9b05 c0306620 00000598 c17bf480 c01aadd2 c17bf480 d7991d1c 
>>Mar 19 12:36:14 sunset c1fcc340 d7991d1c d7990000 d6c31a00 c01aae23 c1fcc340 d7991d1c 00000003 
>>Mar 19 12:36:14 sunset Call Trace:
>>Mar 19 12:36:14 sunset [<c01b0d3c>] reiser4_handle_error+0xcc/0xd0
>>Mar 19 12:36:14 sunset [<c01aadd2>] finish_all_fq+0xb2/0xe0
>>Mar 19 12:36:14 sunset [<c01aae23>] current_atom_finish_all_fq+0x23/0x70
>>Mar 19 12:36:14 sunset [<c01a5e02>] reiser4_write_logs+0x1c2/0x330
>>Mar 19 12:36:14 sunset [<c019d5fc>] commit_current_atom+0x14c/0x250
>>Mar 19 12:36:14 sunset [<c019dff4>] try_commit_txnh+0x124/0x200
>>Mar 19 12:36:14 sunset [<c019e105>] commit_txnh+0x35/0xc0
>>Mar 19 12:36:14 sunset [<c019ccfc>] txn_end+0x3c/0x40
>>Mar 19 12:36:14 sunset [<c019cd10>] txn_restart+0x10/0x20
>>Mar 19 12:36:14 sunset [<c019cd3a>] txn_restart_current+0x1a/0x20
>>Mar 19 12:36:14 sunset [<c019d72f>] force_commit_atom_nolock+0x2f/0x50
>>Mar 19 12:36:14 sunset [<c019d8c2>] txnmgr_force_commit_all+0x102/0x130
>>Mar 19 12:36:14 sunset [<c01ddfcf>] release_format40+0x8f/0x140
>>Mar 19 12:36:14 sunset [<c01aa418>] kcond_signal+0x38/0x40
>>Mar 19 12:36:14 sunset [<c01b0a1e>] reiser4_put_super+0xde/0xe0
>>Mar 19 12:36:14 sunset [<c015b82d>] generic_shutdown_super+0x11d/0x130
>>Mar 19 12:36:14 sunset [<c015c3ce>] kill_block_super+0x2e/0x60
>>Mar 19 12:36:14 sunset [<c015b5fb>] deactivate_super+0x5b/0x90
>>Mar 19 12:36:14 sunset [<c01727cf>] sys_umount+0x3f/0xa0
>>Mar 19 12:36:14 sunset [<c0155f7f>] __fput+0xcf/0x160
>>Mar 19 12:36:14 sunset [<c0154552>] filp_close+0x52/0xa0
>>Mar 19 12:36:14 sunset [<c0172845>] sys_oldumount+0x15/0x20
>>Mar 19 12:36:14 sunset [<c01026ef>] syscall_call+0x7/0xb
>>Mar 19 12:36:14 sunset Code: fe ff ff 8d 42 68 e8 bf 6d 16 00 e9 77 ff ff ff 8d 42 68 e8 b2 6d 16 00 eb cc 90 90 90 90 53 83 ec 10 a1 80 bb 3d c0 85 c0 74 23 <0f> 0b 83 00 06 60 30 c0 c7 04 24 69 44 31 c0 b8 a0 bb 3d c0 89 
>>Mar 19 12:36:14 sunset <6>note: umount[1504] exited with preempt_count 2
>>Mar 19 12:36:14 sunset scheduling while atomic: umount/0x00000002/1504
>>Mar 19 12:36:14 sunset [<c02f5ef4>] schedule+0x4c4/0x580
>>Mar 19 12:36:14 sunset [<c0143bc3>] unmap_page_range+0x53/0x90
>>Mar 19 12:36:14 sunset [<c0143dcc>] unmap_vmas+0x1cc/0x1e0
>>Mar 19 12:36:14 sunset [<c014896c>] exit_mmap+0x7c/0x160
>>Mar 19 12:36:14 sunset [<c0114037>] mmput+0x37/0xa0
>>Mar 19 12:36:14 sunset [<c01188a6>] do_exit+0x166/0x430
>>Mar 19 12:36:14 sunset [<c0103400>] do_invalid_op+0x0/0xb0
>>Mar 19 12:36:14 sunset [<c010307b>] die+0x18b/0x190
>>Mar 19 12:36:14 sunset [<c01034a6>] do_invalid_op+0xa6/0xb0
>>Mar 19 12:36:14 sunset [<c01122e2>] try_to_wake_up+0xb2/0xc0
>>Mar 19 12:36:14 sunset [<c018ec7d>] reiser4_do_panic+0xd/0xe0
>>Mar 19 12:36:14 sunset [<c0112c48>] __wake_up_common+0x38/0x70
>>Mar 19 12:36:14 sunset [<c01169af>] release_console_sem+0xbf/0xd0
>>Mar 19 12:36:14 sunset [<c0102897>] error_code+0x2b/0x30
>>Mar 19 12:36:14 sunset [<c018ec7d>] reiser4_do_panic+0xd/0xe0
>>Mar 19 12:36:14 sunset [<c01b0d3c>] reiser4_handle_error+0xcc/0xd0
>>Mar 19 12:36:14 sunset [<c01aadd2>] finish_all_fq+0xb2/0xe0
>>Mar 19 12:36:14 sunset [<c01aae23>] current_atom_finish_all_fq+0x23/0x70
>>Mar 19 12:36:14 sunset [<c01a5e02>] reiser4_write_logs+0x1c2/0x330
>>Mar 19 12:36:14 sunset [<c019d5fc>] commit_current_atom+0x14c/0x250
>>Mar 19 12:36:14 sunset [<c019dff4>] try_commit_txnh+0x124/0x200
>>Mar 19 12:36:14 sunset [<c019e105>] commit_txnh+0x35/0xc0
>>Mar 19 12:36:14 sunset [<c019ccfc>] txn_end+0x3c/0x40
>>Mar 19 12:36:14 sunset [<c019cd10>] txn_restart+0x10/0x20
>>Mar 19 12:36:14 sunset [<c019cd3a>] txn_restart_current+0x1a/0x20
>>Mar 19 12:36:14 sunset [<c019d72f>] force_commit_atom_nolock+0x2f/0x50
>>Mar 19 12:36:14 sunset [<c019d8c2>] txnmgr_force_commit_all+0x102/0x130
>>Mar 19 12:36:14 sunset [<c01ddfcf>] release_format40+0x8f/0x140
>>Mar 19 12:36:14 sunset [<c01aa418>] kcond_signal+0x38/0x40
>>Mar 19 12:36:14 sunset [<c01b0a1e>] reiser4_put_super+0xde/0xe0
>>Mar 19 12:36:14 sunset [<c015b82d>] generic_shutdown_super+0x11d/0x130
>>Mar 19 12:36:14 sunset [<c015c3ce>] kill_block_super+0x2e/0x60
>>Mar 19 12:36:14 sunset [<c015b5fb>] deactivate_super+0x5b/0x90
>>Mar 19 12:36:14 sunset [<c01727cf>] sys_umount+0x3f/0xa0
>>Mar 19 12:36:14 sunset [<c0155f7f>] __fput+0xcf/0x160
>>Mar 19 12:36:14 sunset [<c0154552>] filp_close+0x52/0xa0
>>Mar 19 12:36:14 sunset [<c0172845>] sys_oldumount+0x15/0x20
>>Mar 19 12:36:14 sunset [<c01026ef>] syscall_call+0x7/0xb
>>..
>>Mar 27 19:56:52 sunset reiser4[mount(9287)]: _init_read_super (fs/reiser4/init_super.c:180)[nikita-2608]:
>>Mar 27 19:56:52 sunset WARNING: sda1: wrong master super block magic.
>>..
>>Apr  5 13:05:20 sunset reiser4[cc1(14193)]: update_stale_dk (fs/reiser4/search.c:1368)[nikita-38210]:
>>Apr  5 13:05:20 sunset WARNING: stale dk
>>..
>>Apr 13 21:01:47 sunset reiser4[mount(18079)]: _init_read_super (fs/reiser4/init_super.c:180)[nikita-2608]:
>>Apr 13 21:01:47 sunset WARNING: loop1: wrong master super block magic.
>>Apr 13 21:02:13 sunset reiser4[mount(18092)]: _init_read_super (fs/reiser4/init_super.c:180)[nikita-2608]:
>>Apr 13 21:02:13 sunset WARNING: loop2: wrong master super block magic.
>>..
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
>>Apr 14 21:27:25 sunset WARNING: Wrong level found in node: 1 != 32
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
>>Apr 14 21:27:25 sunset WARNING: failure: -5
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: delete_inode_common (fs/reiser4/plugin/object.c:997)[vs-1216]:
>>Apr 14 21:27:25 sunset WARNING: Failed to delete file body 892634
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
>>Apr 14 21:27:25 sunset WARNING: Wrong level found in node: 1 != 117
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
>>Apr 14 21:27:25 sunset WARNING: failure: -5
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: delete_inode_common (fs/reiser4/plugin/object.c:997)[vs-1216]:
>>Apr 14 21:27:25 sunset WARNING: Failed to delete file body 892635
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
>>Apr 14 21:27:25 sunset WARNING: Wrong level found in node: 1 != 117
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
>>Apr 14 21:27:25 sunset WARNING: failure: -5
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: delete_inode_common (fs/reiser4/plugin/object.c:997)[vs-1216]:
>>Apr 14 21:27:25 sunset WARNING: Failed to delete file body 892636
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
>>Apr 14 21:27:25 sunset WARNING: Wrong level found in node: 1 != 114
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
>>Apr 14 21:27:25 sunset WARNING: failure: -5
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: delete_inode_common (fs/reiser4/plugin/object.c:997)[vs-1216]:
>>Apr 14 21:27:25 sunset WARNING: Failed to delete file body 892639
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
>>Apr 14 21:27:25 sunset WARNING: Wrong level found in node: 1 != 59
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
>>Apr 14 21:27:25 sunset WARNING: failure: -5
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: delete_inode_common (fs/reiser4/plugin/object.c:997)[vs-1216]:
>>Apr 14 21:27:25 sunset WARNING: Failed to delete file body 892642
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
>>Apr 14 21:27:25 sunset WARNING: Wrong level found in node: 1 != 97
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
>>Apr 14 21:27:25 sunset WARNING: failure: -5
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: delete_inode_common (fs/reiser4/plugin/object.c:997)[vs-1216]:
>>Apr 14 21:27:25 sunset WARNING: Failed to delete file body 892648
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
>>Apr 14 21:27:25 sunset WARNING: Wrong level found in node: 1 != 97
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
>>Apr 14 21:27:25 sunset WARNING: failure: -5
>>Apr 14 21:27:25 sunset reiser4[mc(8134)]: delete_inode_common (fs/reiser4/plugin/object.c:997)[vs-1216]:
>>Apr 14 21:27:25 sunset WARNING: Failed to delete file body 892650
>>
>>
>>fsck.reiser4 /dev/hda5:
>>
>>*******************************************************************
>>This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>>*******************************************************************
>>
>>Fscking the /dev/hda5 block device. 
>>Will check the consistency of the Reiser4 SuperBlock. 
>>Will check the consistency of the Reiser4 FileSystem. 
>>Continue? 
>>(Yes/No): yes
>>***** fsck.reiser4 started at Thu Apr 14 22:06:46 2005
>>Reiser4 fs was detected on /dev/hda5. 
>>Master super block (16): 
>>magic:		ReIsEr4 
>>blksize:	4096 
>>format:		0x0 (format40) 
>>uuid:		4ac684e3-e959-4ee1-b912-2d7a1525b874 
>>label:		<none> 
>> 
>>Format super block (17): 
>>plugin:		format40 
>>description:	Disk-format for reiser4.  
>>magic:		ReIsEr40FoRmAt 
>>flushes:	0 
>>mkfs id:	0x61998a65 
>>blocks:		8343751 
>>free blocks:	1195334 
>>root block:	4193101 
>>tail policy:	0x2 (smart) 
>>next oid:	0xe075d 
>>file count:	83555 
>>tree height:	4 
>>key policy:	LARGE 
>> 
>>
>>CHECKING STORAGE TREE 
>>FSCK: Node (7066416): failed to open the node pointed by the node (6931093), 
>>item (57), unit (0) on the level (2). The whole subtree is skipped. 
>>FSCK: Node (7066417): failed to open the node pointed by the node (6931093), 
>>item (58), unit (0) on the level (2). The whole subtree is skipped. 
>>FSCK: Node (7066418): failed to open the node pointed by the node (6942576), 
>>item (0), unit (0) on the level (2). The whole subtree is skipped. 
>>FSCK: Node (7066419): failed to open the node pointed by the node (6942576), 
>>item (1), unit (0) on the level (2). The whole subtree is skipped. 
>>FSCK: Node (7066420): failed to open the node pointed by the node (6942576), 
>>item (2), unit (0) on the level (2). The whole subtree is skipped. 
>>FSCK: Node (7066421): failed to open the node pointed by the node (6942576), 
>>item (3), unit (0) on the level (2). The whole subtree is skipped. 
>>	Read nodes 60310 
>>	Nodes left in the tree 60310 
>>		Leaves of them 58273, Twigs of them 1994 
>>	Invalid node pointers 6 
>>	Time interval: Thu Apr 14 22:06:51 2005 - Thu Apr 14 22:08:24 2005 
>>CHECKING EXTENT REGIONS. 
>>	Read twigs 1994 
>>	Time interval: Thu Apr 14 22:08:24 2005 - Thu Apr 14 22:08:28 2005 
>>Warn : Fatal corruptions were found. Semantic pass is skipped. 
>>***** fsck.reiser4 finished at Thu Apr 14 22:08:28 2005
>>Closing fs...done
>>
>>6 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.
>>
>>----------
>>
>>fsck.reiser4 --build-fs:
>>    
>>
>
>  
>
>>*******************************************************************
>>This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>>*******************************************************************
>>
>>Fscking the /dev/hda5 block device. 
>>Will check the consistency of the Reiser4 SuperBlock. 
>>Will build the Reiser4 FileSystem. 
>>Continue? 
>>(Yes/No): yes
>>***** fsck.reiser4 started at Thu Apr 14 22:09:33 2005
>>Reiser4 fs was detected on /dev/hda5. 
>>Master super block (16): 
>>magic:		ReIsEr4 
>>blksize:	4096 
>>format:		0x0 (format40) 
>>uuid:		4ac684e3-e959-4ee1-b912-2d7a1525b874 
>>label:		<none> 
>> 
>>Format super block (17): 
>>plugin:		format40 
>>description:	Disk-format for reiser4.  
>>magic:		ReIsEr40FoRmAt 
>>flushes:	0 
>>mkfs id:	0x61998a65 
>>blocks:		8343751 
>>free blocks:	1195334 
>>root block:	4193101 
>>tail policy:	0x2 (smart) 
>>next oid:	0xe075d 
>>file count:	83555 
>>tree height:	4 
>>key policy:	LARGE 
>> 
>>
>>CHECKING STORAGE TREE 
>>FSCK: Node (7066416): failed to open the node pointed by the node (6931093), 
>>item (57), unit (0) on the level (2). The whole subtree is skipped. 
>>FSCK: Node (7066417): failed to open the node pointed by the node (6931093), 
>>item (57), unit (0) on the level (2). The whole subtree is skipped. 
>>FSCK: Node (7066418): failed to open the node pointed by the node (6942576), 
>>item (0), unit (0) on the level (2). The whole subtree is skipped. 
>>FSCK: Node (7066419): failed to open the node pointed by the node (6942576), 
>>item (0), unit (0) on the level (2). The whole subtree is skipped. 
>>FSCK: Node (7066420): failed to open the node pointed by the node (6942576), 
>>item (0), unit (0) on the level (2). The whole subtree is skipped. 
>>FSCK: Node (7066421): failed to open the node pointed by the node (6942576), 
>>item (0), unit (0) on the level (2). The whole subtree is skipped. 
>>	Read nodes 60310 
>>	Nodes left in the tree 60310 
>>		Leaves of them 58273, Twigs of them 1994 
>>	Zeroed node pointers 6 
>>	Time interval: Thu Apr 14 22:09:37 2005 - Thu Apr 14 22:12:15 2005 
>>CHECKING EXTENT REGIONS. 
>>	Read twigs 1994 
>>	Time interval: Thu Apr 14 22:12:15 2005 - Thu Apr 14 22:12:21 2005 
>>LOOKING FOR UNCONNECTED NODES 
>>	Read nodes 6 
>>	Good nodes 0 
>>		Leaves of them 0, Twigs of them 0 
>>	Time interval: Thu Apr 14 22:12:22 2005 - Thu Apr 14 22:12:22 2005 
>>CHECKING EXTENT REGIONS. 
>>	Read twigs 0 
>>	Time interval: Thu Apr 14 22:12:22 2005 - Thu Apr 14 22:12:22 2005 
>>INSERTING UNCONNECTED NODES 
>>	Twigs: read 0, inserted 0, by item 0, empty 0 
>>	Leaves: read 0, inserted 0, by item 0 
>>	Time interval: Thu Apr 14 22:12:22 2005 - Thu Apr 14 22:12:22 2005 
>>CHECKING SEMANTIC TREE 
>>FSCK: No 'lost+found' entry found. Building a new object with the key 2a:0:ffff.
>>FSCK: Failed to recognize the plugin for the directory [2a:0:ffff]. 
>>FSCK: Trying to recover the directory [2a:0:ffff] with the default 
>>plugin--dir40. 
>>FSCK: The file [2a:0:ffff] does not have a StatData item. Creating a new one. 
>>Plugin dir40. 
>>FSCK: Directory [2a:0:ffff]: The entry "." is not found. Insert a new one. 
>>Plugin (dir40). 
>>FSCK: Node (6942580), item (2), [2a:0:ffff] (stat40): wrong size (0), Fixed to 
>>(1). 
>>FSCK: Node (6942580), item (2), [2a:0:ffff] (stat40): wrong bytes (0), Fixed to
>>(50). 
>>	Found 83557 objects. 
>>	Time interval: Thu Apr 14 22:12:22 2005 - Thu Apr 14 22:13:50 2005 
>>CLEANUPING STORAGE TREE 
>>	Removed items 1 
>>	Time interval: Thu Apr 14 22:13:50 2005 - Thu Apr 14 22:13:56 2005 
>>FSCK: File count 83555 is wrong. Fixed to 83557. 
>>***** fsck.reiser4 finished at Thu Apr 14 22:13:57 2005
>>Closing fs...done
>>
>>FS is consistent.
>>
>>
>>I was using 2.6.10 with
>>ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.10/reiser4-for-2.6.10-1.gz
>>then:
>>ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/reiser4-for-2.6.11-broken-out.1.tar.gz
>>ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/reiser4-for-2.6.11-broken-out.2.tar.gz
>>
>>Now I am using:
>>ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/reiser4-for-2.6.11-3.patch.gz
>>
>>Cheers,
>>Szabolcs
>>
>>
>>    
>>
>
>
>
>  
>

