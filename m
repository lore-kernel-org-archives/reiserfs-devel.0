From: Sergey Ivanov <seriv@parkheights.dyndns.org>
Subject: Re: reiser4 problems
Date: Tue, 21 Mar 2006 16:20:16 -0500
Message-ID: <44206E10.6030801@parkheights.dyndns.org>
References: <442040FF.4040800@parkheights.dyndns.org> <442054D5.1060506@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070608090304030900010300"
Return-path: <reiserfs-list-return-28309-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <442054D5.1060506@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------070608090304030900010300
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thank you, Hans.
One additional bit, may be it's about different problem.
While copying from reiser4 volumes to newly created ext3 ones, I decided
to remount read-only the with "mount -o remount,ro" command the source
of copying.
And it results in kernel panics I'm attaching to this mail.
Then the cp process become unkillable, and the system did not reboot
down remotely, I'll see at which point it hanged when I'll be there.
-- 
	Sergey.

Hans Reiser wrote:
> Unless Vitaly is still around, you will probably have to wait until
> tomorrow for a response.  Thanks for your patience.
> 
> Hans
> 
> Sergey Ivanov wrote:
> 
>> Hi,
>> I am sorry to report problems I had this night at my e-mail server.
[skip]
> 





--------------070608090304030900010300
Content-Type: text/x-log;
 name="r4.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="r4.log"

Mar 21 14:01:08 parkheights crond[21683]: (root) CMD (run-parts /etc/cron.hourly)
Mar 21 14:13:12 parkheights kernel: <4>reiser4[ent:dm-6!(1146)]: disable_write_barrier (fs/reiser4/wander.c:233)[zam-1055]:
Mar 21 14:13:13 parkheights kernel: WARNING: disabling write barrier
Mar 21 14:13:13 parkheights kernel: 
Mar 21 14:25:29 parkheights -- MARK --
Mar 21 14:42:26 parkheights kernel: ------------[ cut here ]------------
Mar 21 14:42:27 parkheights kernel: kernel BUG at fs/reiser4/block_alloc.c:149!
Mar 21 14:42:33 parkheights kernel: invalid operand: 0000 [#1]
Mar 21 14:42:42 parkheights kernel: SMP 
Mar 21 14:42:42 parkheights kernel: Modules linked in: dm_mirror vfat fat nls_base lp ac thermal processor button ide_cd cdrom af_packet pdc202xx_new eepro100 mii hw_random amd_k7_agp agpgart analog ns558 gameport psmouse parport_pc parport usbhid floppy pcspkr ohci_hcd usbcore i810_audio ac97_codec soundcore reiser4 raid5 xor dm_mod rtc ext3 jbd mbcache sata_sil libata sd_mod scsi_mod ide_disk ide_generic amd74xx generic ide_core
Mar 21 14:42:42 parkheights kernel: CPU:    1
Mar 21 14:42:42 parkheights kernel: EIP:    0060:[pg0+550729131/1069798400]    Not tainted VLI
Mar 21 14:42:42 parkheights kernel: EIP:    0060:[<e10f85ab>]    Not tainted VLI
Mar 21 14:42:42 parkheights kernel: EFLAGS: 00210297   (2.6.14-vsr4-smp-alt5) 
Mar 21 14:42:42 parkheights kernel: EIP is at sub_from_ctx_grabbed+0x2b/0x40 [reiser4]
Mar 21 14:42:42 parkheights kernel: eax: 00000000   ebx: 00000000   ecx: 00000001   edx: 00000000
Mar 21 14:42:42 parkheights kernel: esi: de4f3ea4   edi: df51f400   ebp: 00000001   esp: de4f3c8c
Mar 21 14:42:42 parkheights kernel: ds: 007b   es: 007b   ss: 0068
Mar 21 14:42:42 parkheights kernel: Process ent:dm-8! (pid: 1128, threadinfo=de4f2000 task=df5aba90)
Mar 21 14:42:42 parkheights kernel: Stack: 00000001 00000000 e10f8dbb de4f3ea4 00000001 00000000 00000000 de4f3ea4 
Mar 21 14:42:42 parkheights kernel:        df51f400 e10f9119 de4f3ea4 df51f400 00000001 00000000 df51f400 de4f3cf8 
Mar 21 14:42:42 parkheights kernel:        00000001 de4f3d2c de4f3d70 e1100e58 de4f3cf8 de4f3d2c de4f3cf0 00000044 
Mar 21 14:42:42 parkheights kernel: Call Trace:
Mar 21 14:42:42 parkheights kernel:  [pg0+550731195/1069798400] grabbed2used+0x1b/0x60 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e10f8dbb>] grabbed2used+0x1b/0x60 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550732057/1069798400] reiser4_alloc_blocks+0x149/0x1a0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e10f9119>] reiser4_alloc_blocks+0x149/0x1a0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550764120/1069798400] get_more_wandered_blocks+0x38/0x50 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e1100e58>] get_more_wandered_blocks+0x38/0x50 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550766523/1069798400] alloc_wandered_blocks+0x5b/0x90 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e11017bb>] alloc_wandered_blocks+0x5b/0x90 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550766476/1069798400] alloc_wandered_blocks+0x2c/0x90 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e110178c>] alloc_wandered_blocks+0x2c/0x90 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550767226/1069798400] commit_tx+0x4a/0xe0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e1101a7a>] commit_tx+0x4a/0xe0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550767875/1069798400] reiser4_write_logs+0x123/0x1b0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e1101d03>] reiser4_write_logs+0x123/0x1b0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550783854/1069798400] current_atom_finish_all_fq+0x1e/0x70 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e1105b6e>] current_atom_finish_all_fq+0x1e/0x70 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550737328/1069798400] commit_current_atom+0x150/0x270 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e10fa5b0>] commit_current_atom+0x150/0x270 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550740451/1069798400] try_commit_txnh+0x133/0x1d0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e10fb1e3>] try_commit_txnh+0x133/0x1d0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550740656/1069798400] commit_txnh+0x30/0xc0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e10fb2b0>] commit_txnh+0x30/0xc0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550734558/1069798400] txn_end+0x3e/0x50 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e10f9ade>] txn_end+0x3e/0x50 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550734587/1069798400] txn_restart+0xb/0x20 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e10f9afb>] txn_restart+0xb/0x20 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550739421/1069798400] flush_some_atom+0x25d/0x3c0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e10faddd>] flush_some_atom+0x25d/0x3c0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550804062/1069798400] writeout+0xee/0x1a0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e110aa5e>] writeout+0xee/0x1a0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550810931/1069798400] entd_flush+0xb3/0xe0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e110c533>] entd_flush+0xb3/0xe0 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [pg0+550810167/1069798400] entd+0xb7/0x240 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e110c237>] entd+0xb7/0x240 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [autoremove_wake_function+0/64] autoremove_wake_function+0x0/0x40
Mar 21 14:42:42 parkheights kernel:  [<c0131500>] autoremove_wake_function+0x0/0x40
Mar 21 14:42:42 parkheights kernel:  [autoremove_wake_function+0/64] autoremove_wake_function+0x0/0x40
Mar 21 14:42:42 parkheights kernel:  [<c0131500>] autoremove_wake_function+0x0/0x40
Mar 21 14:42:42 parkheights kernel:  [pg0+550809984/1069798400] entd+0x0/0x240 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [<e110c180>] entd+0x0/0x240 [reiser4]
Mar 21 14:42:42 parkheights kernel:  [kthread+147/192] kthread+0x93/0xc0
Mar 21 14:42:42 parkheights kernel:  [<c01310e3>] kthread+0x93/0xc0
Mar 21 14:42:42 parkheights kernel:  [kthread+0/192] kthread+0x0/0xc0
Mar 21 14:42:42 parkheights kernel:  [<c0131050>] kthread+0x0/0xc0
Mar 21 14:42:42 parkheights kernel:  [kernel_thread_helper+5/24] kernel_thread_helper+0x5/0x18
Mar 21 14:42:42 parkheights kernel:  [<c010106d>] kernel_thread_helper+0x5/0x18
Mar 21 14:42:42 parkheights kernel: Code: 56 53 8b 74 24 0c 8b 5c 24 14 8b 4c 24 10 8b 56 70 8b 46 6c 39 da 76 0d 29 c8 19 da 89 46 6c 89 56 70 5b 5e c3 72 04 39 c8 73 ed <0f> 0b 95 00 8a 51 13 e1 eb e3 8d 74 26 00 8d bc 27 00 00 00 00 
Mar 21 14:42:55 parkheights kernel:  ------------[ cut here ]------------
Mar 21 14:42:55 parkheights kernel: kernel BUG at fs/reiser4/block_alloc.c:149!
Mar 21 14:43:05 parkheights kernel: invalid operand: 0000 [#2]
Mar 21 14:43:12 parkheights kernel: SMP 
Mar 21 14:43:12 parkheights kernel: Modules linked in: dm_mirror vfat fat nls_base lp ac thermal processor button ide_cd cdrom af_packet pdc202xx_new eepro100 mii hw_random amd_k7_agp agpgart analog ns558 gameport psmouse parport_pc parport usbhid floppy pcspkr ohci_hcd usbcore i810_audio ac97_codec soundcore reiser4 raid5 xor dm_mod rtc ext3 jbd mbcache sata_sil libata sd_mod scsi_mod ide_disk ide_generic amd74xx generic ide_core
Mar 21 14:43:12 parkheights kernel: CPU:    1
Mar 21 14:43:12 parkheights kernel: EIP:    0060:[pg0+550729131/1069798400]    Not tainted VLI
Mar 21 14:43:12 parkheights kernel: EIP:    0060:[<e10f85ab>]    Not tainted VLI
Mar 21 14:43:12 parkheights kernel: EFLAGS: 00210297   (2.6.14-vsr4-smp-alt5) 
Mar 21 14:43:12 parkheights kernel: EIP is at sub_from_ctx_grabbed+0x2b/0x40 [reiser4]
Mar 21 14:43:12 parkheights kernel: eax: 00000000   ebx: 00000000   ecx: 00000001   edx: 00000000
Mar 21 14:43:12 parkheights kernel: esi: d9b07860   edi: deeb7000   ebp: 00000001   esp: cd3f5ce0
Mar 21 14:43:12 parkheights kernel: ds: 007b   es: 007b   ss: 0068
Mar 21 14:43:12 parkheights kernel: Process pdflush (pid: 20540, threadinfo=cd3f4000 task=dc85e050)
Mar 21 14:43:12 parkheights kernel: Stack: 00000001 00000000 e10f8dbb d9b07860 00000001 00000000 00000000 d9b07860 
Mar 21 14:43:13 parkheights kernel:        deeb7000 e10f9119 d9b07860 deeb7000 00000001 00000000 deeb7000 00000000 
Mar 21 14:43:13 parkheights kernel:        de539ce8 cb073ca0 cd3f5d5c e10ff9df de539d24 cd3f5d5c cd3f5d54 00000014 
Mar 21 14:43:13 parkheights kernel: Call Trace:
Mar 21 14:43:13 parkheights kernel:  [pg0+550731195/1069798400] grabbed2used+0x1b/0x60 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e10f8dbb>] grabbed2used+0x1b/0x60 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550732057/1069798400] reiser4_alloc_blocks+0x149/0x1a0 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e10f9119>] reiser4_alloc_blocks+0x149/0x1a0 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550758879/1069798400] allocate_znode_update+0x7f/0x260 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e10ff9df>] allocate_znode_update+0x7f/0x260 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550689766/1069798400] jload_gfp+0x76/0x1c0 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e10eebe6>] jload_gfp+0x76/0x1c0 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550758235/1069798400] allocate_znode_loaded+0x5b/0x220 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e10ff75b>] allocate_znode_loaded+0x5b/0x220 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550758728/1069798400] allocate_znode+0x28/0x40 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e10ff948>] allocate_znode+0x28/0x40 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550752819/1069798400] alloc_pos_and_ancestors+0xd3/0x120 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e10fe233>] alloc_pos_and_ancestors+0xd3/0x120 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550750767/1069798400] jnode_flush+0x20f/0x360 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e10fda2f>] jnode_flush+0x20f/0x360 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550751722/1069798400] flush_current_atom+0x14a/0x290 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e10fddea>] flush_current_atom+0x14a/0x290 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550739305/1069798400] flush_some_atom+0x1e9/0x3c0 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e10fad69>] flush_some_atom+0x1e9/0x3c0 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550804062/1069798400] writeout+0xee/0x1a0 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e110aa5e>] writeout+0xee/0x1a0 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [pg0+550790268/1069798400] reiser4_sync_inodes+0x3c/0xa0 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [<e110747c>] reiser4_sync_inodes+0x3c/0xa0 [reiser4]
Mar 21 14:43:13 parkheights kernel:  [writeback_inodes+189/208] writeback_inodes+0xbd/0xd0
Mar 21 14:43:13 parkheights kernel:  [<c01881dd>] writeback_inodes+0xbd/0xd0
Mar 21 14:43:13 parkheights kernel:  [background_writeout+132/192] background_writeout+0x84/0xc0
Mar 21 14:43:13 parkheights kernel:  [<c014bc34>] background_writeout+0x84/0xc0
Mar 21 14:43:13 parkheights kernel:  [pdflush+0/48] pdflush+0x0/0x30
Mar 21 14:43:13 parkheights kernel:  [<c014c6b0>] pdflush+0x0/0x30
Mar 21 14:43:13 parkheights kernel:  [__pdflush+192/432] __pdflush+0xc0/0x1b0
Mar 21 14:43:13 parkheights kernel:  [<c014c5c0>] __pdflush+0xc0/0x1b0
Mar 21 14:43:13 parkheights kernel:  [pdflush+30/48] pdflush+0x1e/0x30
Mar 21 14:43:13 parkheights kernel:  [<c014c6ce>] pdflush+0x1e/0x30
Mar 21 14:43:13 parkheights kernel:  [background_writeout+0/192] background_writeout+0x0/0xc0
Mar 21 14:43:13 parkheights kernel:  [<c014bbb0>] background_writeout+0x0/0xc0
Mar 21 14:43:13 parkheights kernel:  [kthread+147/192] kthread+0x93/0xc0
Mar 21 14:43:13 parkheights kernel:  [<c01310e3>] kthread+0x93/0xc0
Mar 21 14:43:13 parkheights kernel:  [kthread+0/192] kthread+0x0/0xc0
Mar 21 14:43:13 parkheights kernel:  [<c0131050>] kthread+0x0/0xc0
Mar 21 14:43:13 parkheights kernel:  [kernel_thread_helper+5/24] kernel_thread_helper+0x5/0x18
Mar 21 14:43:13 parkheights kernel:  [<c010106d>] kernel_thread_helper+0x5/0x18
Mar 21 14:43:13 parkheights kernel: Code: 56 53 8b 74 24 0c 8b 5c 24 14 8b 4c 24 10 8b 56 70 8b 46 6c 39 da 76 0d 29 c8 19 da 89 46 6c 89 56 70 5b 5e c3 72 04 39 c8 73 ed <0f> 0b 95 00 8a 51 13 e1 eb e3 8d 74 26 00 8d bc 27 00 00 00 00 




--------------070608090304030900010300--
