From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Reiser4 bug in 2.6.17-ck1+reiser4-for-2.6.16-4?
Date: Fri, 30 Jun 2006 09:19:49 +0300
Message-ID: <200606300919.49480.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28869-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

Yesterday morning my Squid went Zombie and I had to reboot to get it
working again:

Jun 29 10:00:14 rmeijer-noc kernel: Kernel BUG at fs/reiser4/plugin/item/extent_file_ops.c:713
Jun 29 10:00:14 rmeijer-noc kernel: invalid opcode: 0000 [1]
Jun 29 10:00:14 rmeijer-noc kernel: CPU 0
Jun 29 10:00:14 rmeijer-noc kernel: Modules linked in: ipv6 powernow_k8 cpufreq_powersave cpufreq_stats cpufreq_userspace cpufreq_ondemand cpufreq_conservative freq_table video battery container fan button thermal processor ac nvidia sk98lin ide_cd cdrom usbhid parport_pc parport 8250_pnp 8250 serial_core skge crc32 forcedeth amd74xx ide_core i2c_nforce2 i2c_core ohci_hcd snd_intel8x0 snd_ac97_codec snd_ac97_bus sg
Jun 29 10:00:14 rmeijer-noc kernel: Pid: 4022, comm: squid Tainted: P      2.6.17-ck1 #4
Jun 29 10:00:14 rmeijer-noc kernel: RIP: 0010:[<ffffffff802db7cc>] <ffffffff802db7cc>{overwrite_extent+791}
Jun 29 10:00:14 rmeijer-noc kernel: RSP: 0018:ffff8100b298ba38  EFLAGS: 00010282
Jun 29 10:00:14 rmeijer-noc kernel: RAX: 00000000fffffe08 RBX: 0000000000000000 RCX: ffff81002cb74f38
Jun 29 10:00:14 rmeijer-noc kernel: RDX: ffff81002cb74f38 RSI: ffff81002cb74c40 RDI: ffff81002cb74e00
Jun 29 10:00:14 rmeijer-noc kernel: RBP: ffff8100b298bc28 R08: 0000000000000000 R09: ffff8100b298bcb8
Jun 29 10:00:14 rmeijer-noc kernel: R10: ffff8100b298bcb8 R11: ffffffff802d0b33 R12: ffff8100b298bc18
Jun 29 10:00:14 rmeijer-noc kernel: R13: ffff8100b298bd58 R14: ffff8100b298bcb8 R15: ffff810029d29440
Jun 29 10:00:14 rmeijer-noc kernel: FS:  00002b253e1b6b60(0000) GS:ffffffff804fd000(0000) knlGS:00000000f5330bb0
Jun 29 10:00:14 rmeijer-noc kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
Jun 29 10:00:14 rmeijer-noc kernel: CR2: 00002ad1faea2d80 CR3: 00000000b34ba000 CR4: 00000000000006e0
Jun 29 10:00:14 rmeijer-noc kernel: Process squid (pid: 4022, threadinfo ffff8100b298a000, task ffff8100b43b2b30)
Jun 29 10:00:14 rmeijer-noc kernel: Stack: 0000000000000001 0000000000000000 0000000000000002 ffff8100b298bd58
Jun 29 10:00:14 rmeijer-noc kernel: 000000000007dee7 ffff8100b298bcb8 ffff8100bf6df818 ffff8100b298bcb8
Jun 29 10:00:14 rmeijer-noc kernel: ffff8100b298bc28 0000000100000002
Jun 29 10:00:14 rmeijer-noc kernel: Call Trace: <ffffffff8029822b>{reiserfs_file_write+6043}
Jun 29 10:00:14 rmeijer-noc kernel: <ffffffff802d98c6>{extent_size+27} <ffffffff802d9a02>{unit_key_extent+34}
Jun 29 10:00:14 rmeijer-noc kernel: <ffffffff802db993>{update_extents+294} <ffffffff802dbfab>{write_extent+1401}
Jun 29 10:00:14 rmeijer-noc kernel: <ffffffff802d4e2f>{save_static_sd+81} <ffffffff802b54ea>{txn_begin+32}
Jun 29 10:00:14 rmeijer-noc kernel: <ffffffff802dba32>{write_extent+0} <ffffffff802c91eb>{write_unix_file+556}
Jun 29 10:00:14 rmeijer-noc kernel: <ffffffff80258574>{vfs_write+171} <ffffffff80258de2>{sys_write+69}
Jun 29 10:00:14 rmeijer-noc kernel: <ffffffff80209556>{system_call+126}
Jun 29 10:00:14 rmeijer-noc kernel: Code: 0f 0b 68 38 82 41 80 c2 c9 02 4c 89 ff e8 23 a5 fd ff 83 7d
Jun 29 10:00:14 rmeijer-noc kernel: RIP <ffffffff802db7cc>{overwrite_extent+791} RSP <ffff8100b298ba38>

I use 2.6.17 with the ck1 and reiser4-for-2.6.16-4 patches on an AMD64.

Any ideas?


Thanks,

Ray
