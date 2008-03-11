From: "Raymond A. Meijer" <raymond@internet.gr>
Subject: Reiser4 hang on 2.6.24-ck1
Date: Tue, 11 Mar 2008 14:57:31 +0200
Message-ID: <200803111457.31861.raymond@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hiya,

I had a problem with my Reiser4 /tmp this morning:

Mar 11 11:31:07 x-ray kernel: ------------[ cut here ]------------
Mar 11 11:31:07 x-ray kernel: kernel BUG at fs/reiser4/plugin/item/extent_flush_ops.c:551!
Mar 11 11:31:07 x-ray kernel: invalid opcode: 0000 [#1]
Mar 11 11:31:07 x-ray kernel: Modules linked in: nls_iso8859_1 nls_cp437 vfat fat nls_base loop vboxdrv usb_storage libusual fglrx(P) michael_mic arc4 ecb blkcipher cryptomgr ieee80211_crypt_tkip binfmt_misc rfcomm l2cap sbs sbshc dock 
acpi_cpufreq cpufreq_powersave cpufreq_stats cpufreq_userspace cpufreq_conservative aes_i586 dm_crypt af_packet pcmcia crc32 hci_usb bluetooth evdev container video psmouse serio_raw sdhci mmc_core yenta_socket rsrc_nonstatic ipw2200 
pcmcia_core ieee80211 ieee80211_crypt rng_core battery ac button iTCO_wdt iTCO_vendor_support 8250_pci 8250 serial_core intel_agp agpgart rtc pcspkr usbhid hid sg sr_mod cdrom piix generic ide_core pata_acpi ata_generic ehci_hcd 
uhci_hcd usbcore dm_mirror dm_snapshot thermal processor fan fuse
Mar 11 11:31:07 x-ray kernel: Pid: 4462, comm: ktxnmgrd:dm-5:r Tainted: P        (2.6.24-ck1 #11)
Mar 11 11:31:07 x-ray kernel: EIP: 0060:[<b01cdca4>] EFLAGS: 00010246 CPU: 0
Mar 11 11:31:07 x-ray kernel: EIP is at assign_real_blocknrs+0x66/0xa8
Mar 11 11:31:07 x-ray kernel: EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 00003fff
Mar 11 11:31:07 x-ray kernel: ESI: 00000024 EDI: 00000000 EBP: 00000000 ESP: ee81bd28
Mar 11 11:31:07 x-ray kernel: DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
Mar 11 11:31:07 x-ray kernel: Process ktxnmgrd:dm-5:r (pid: 4462, ti=ee81a000 task=ee0d8fc0 task.ti=ee81a000)
Mar 11 11:31:07 x-ray kernel: Stack: 00000000 0004731c 00000000 c76e34e8 eeb91414 ee81be04 0004731c 00000000
Mar 11 11:31:07 x-ray kernel: ee992064 b01ce874 00000000 00000006 00000000 00000024 00000000 00000000
Mar 11 11:31:07 x-ray kernel: 00000003 c76e34e8 00000006 00000000 00000000 00000000 00000001 ee81be1c
Mar 11 11:31:07 x-ray kernel: Call Trace:
Mar 11 11:31:07 x-ray kernel: [<b01ce874>] reiser4_alloc_extent+0x388/0x76c
Mar 11 11:31:07 x-ray kernel: [<b01c879c>] pointer_at+0x5/0xb
Mar 11 11:31:07 x-ray kernel: [<b01a33b3>] check_tree_pointer+0x86/0x9a
Mar 11 11:31:07 x-ray kernel: [<b01a26be>] move_lh_internal+0x9b/0xbc
Mar 11 11:31:07 x-ray kernel: [<b01a94fd>] handle_pos_to_twig+0xb7/0xd0
Mar 11 11:31:07 x-ray kernel: [<b01a9606>] handle_pos_on_twig+0xf0/0x170
Mar 11 11:31:07 x-ray kernel: [<b01aaa5f>] flush_current_atom+0x6af/0x79c
Mar 11 11:31:07 x-ray kernel: [<b0115582>] check_preempt_wakeup+0x4e/0x7d
Mar 11 11:31:07 x-ray kernel: [<b01a74d8>] reiser4_txn_end+0x1b1/0x3e9
Mar 11 11:31:07 x-ray kernel: [<b02e4d07>] schedule+0x1f0/0x20a
Mar 11 11:31:07 x-ray kernel: [<b01a7718>] reiser4_txn_restart+0x8/0x15
Mar 11 11:31:07 x-ray kernel: [<b01a78bd>] commit_some_atoms+0x6d/0x75
Mar 11 11:31:07 x-ray kernel: [<b01aecc7>] ktxnmgrd+0x13c/0x155
Mar 11 11:31:07 x-ray kernel: [<b01aeb8b>] ktxnmgrd+0x0/0x155
Mar 11 11:31:07 x-ray kernel: [<b0124fba>] kthread+0x36/0x5c
Mar 11 11:31:07 x-ray kernel: [<b0124f84>] kthread+0x0/0x5c
Mar 11 11:31:07 x-ray kernel: [<b0104797>] kernel_thread_helper+0x7/0x10
Mar 11 11:31:07 x-ray kernel: =======================
Mar 11 11:31:07 x-ray kernel: Code: 83 c0 14 89 44 24 10 8b 74 24 34 8b 7c 24 38 eb 40 89 2c 24 8b 54 24 04 8b 4c 24 08 8b 44 24 10 e8 72 0b fd ff 89 c3 85 c0 75 04 <0f> 0b eb fe 0f ba 30 1d 89 70 40 89 78 44 8b 44 24 0c 8b 50 64
Mar 11 11:31:07 x-ray kernel: EIP: [<b01cdca4>] assign_real_blocknrs+0x66/0xa8 SS:ESP 0068:ee81bd28
Mar 11 11:31:07 x-ray kernel: ---[ end trace 71b7040e6721da23 ]---

Every I/O to /tmp was hanging and I had to reboot my laptop...

When this occurred I was reading my mail with kmail, and I have not
been able to reproduce it...

After rebooting I had to run fsck.reiser4 --build-fs /dev/system/tmp to
fix the FS.

Do you need more info?


Thank you,

Raymond A. Meijer

-- 
You cannot discover new oceans unless
you have the courage to lose sight of
the shore
