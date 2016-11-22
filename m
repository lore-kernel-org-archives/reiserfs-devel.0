From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
Subject: Reiser4 Logical Volumes. Mirrors and Failover
Date: Tue, 22 Nov 2016 15:20:48 +0000
Message-ID: <CAFCWPP+r==XQcjfsjNwMGDk87Eur_3BoVKB+r-0JLRi7Y6KSTg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UVtG3ggeAaa0FHcqZgBhHB6/VYU8+++x1DrsGIpWFOk=;
        b=TLOEbJegZIUCILS4gAZceZ1EGqjDx79E+byr7DhEHy6/FvOlP3ipwORwWR1Hk+n50u
         ND53eiQO39GxzxOiw+MAte5x9PZhypgLIu5wq66mhdeYsGdYPi7GnbIt+9+8eDW55Hua
         6OXUpBzyqylDXArLeKyxqxxf/0e2iKa4xW4p9NlKtkutH+UFutifLQhAkQwGJ9BiMBkQ
         WrPKxy7YolYqrp1k3rDwzPczOKxAqQIzrqmAeI7W/g3+XJdW9DihYqU2Nd2wZnMvnOhC
         ZGFke9xzoWKdpZyd109pDaOFJBYNHM3KA1FNYApcMNWi9x9Ufc9ykhibAxzwuxzdPP/P
         b3qg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hi.

My problem - the procedure of individual commands.

root@ishi:[~]
# dmesg | grep reiser4
[    0.000000] Linux version 4.7.2-SAUX-reiser4 (root@ishi) (gcc
version 5.2.0 (GCC) ) #1 SMP Sun Nov 20 19:19:27 UTC 2016
[    0.000000] Command line: BOOT_IMAGE=3D/vmlinuz-4.7.2-SAUX-reiser4
root=3D/dev/sdb2 ro rootflags=3Dtxmode=3Dwa quiet
[    0.000000] Kernel command line:
BOOT_IMAGE=3D/vmlinuz-4.7.2-SAUX-reiser4 root=3D/dev/sdb2 ro
rootflags=3Dtxmode=3Dwa quiet
[    3.750151] usb usb1: Manufacturer: Linux 4.7.2-SAUX-reiser4 ehci_hcd
[    3.760151] usb usb2: Manufacturer: Linux 4.7.2-SAUX-reiser4 ehci_hcd
[    3.761776] usb usb3: Manufacturer: Linux 4.7.2-SAUX-reiser4 xhci-hcd
[    3.762263] usb usb4: Manufacturer: Linux 4.7.2-SAUX-reiser4 xhci-hcd
[    3.762893] usb usb5: Manufacturer: Linux 4.7.2-SAUX-reiser4 xhci-hcd
[    3.763068] usb usb6: Manufacturer: Linux 4.7.2-SAUX-reiser4 xhci-hcd
[    3.875733] reiser4: sdb2: found disk format 4.0.1.
[    3.875768] reiser4: sdb2: use 'fsck.reiser4 --fix' to complete
disk format upgrade.
[    4.063641] reiser4: sdb2: using Write-Anywhere Transaction Model.
[    4.063651] VFS: Mounted root (reiser4 filesystem) readonly on device 8:=
18.

root@ishi:[~]
# blkid | grep reiser4
/dev/sdb2: LABEL=3D"SYSTEM-ROOT"
UUID=3D"631c2925-dca7-41be-b40c-46e7b2052e28" TYPE=3D"reiser4"
PARTUUID=3D"0215fc7d-02"
/dev/sdd5: UUID=3D"bd01257d-7af7-4729-a970-c614ccda434e" TYPE=3D"reiser4"
PARTUUID=3D"614f1fba-05"
/dev/sdd6: UUID=3D"bd01257d-7af7-4729-a970-c614ccda434e" TYPE=3D"reiser4"
PARTUUID=3D"614f1fba-06"

root@ishi:[~]
# fdisk -l | grep sdd
Disk /dev/sdd: 119.2 GiB, 128035676160 bytes, 250069680 sectors
/dev/sdd1  *         2048    616447    614400  300M 83 Linux
/dev/sdd2          616448 250069679 249453232  119G  5 Extended
/dev/sdd5          618496 122253311 121634816   58G 83 Linux
/dev/sdd6       122255360 243890175 121634816   58G 83 Linux
/dev/sdd7       243892224 250069679   6177456    3G 82 Linux swap / Solaris

root@ishi:[~]
# debugfs.reiser4 /dev/sdd5
debugfs.reiser4 1.1.0
Format release: 4.1.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x1 (format41)
mirror id:      0
replicas:       1
volume uuid:    bd01257d-7af7-4729-a970-c614ccda434e
subvol uuid:    4af98787-f659-4567-a66c-1a5f3b9767a1
label:          <none>

Format super block (17):
subvolume id:   0
num subvols:    1
plugin:         format41
description:    Standard layout for logical volumes.
version:        1
magic:          ReIsEr40FoRmAt
mkfs id:        0x47846701
flushes:        0
blocks:         15204352
free blocks:    15203849
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10000
file count:     1
tree height:    2
key policy:     LARGE

FS status block (21):
FS marked consistent

root@ishi:[~]
# debugfs.reiser4 /dev/sdd6
debugfs.reiser4 1.1.0
Format release: 4.1.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x1 (format41)
mirror id:      1
replicas:       1
volume uuid:    bd01257d-7af7-4729-a970-c614ccda434e
subvol uuid:    cc7f1605-7636-45d0-a237-5f9e4a7d457e
label:          <none>

Format super block (17):
subvolume id:   0
num subvols:    1
plugin:         format41
description:    Standard layout for logical volumes.
version:        1
magic:          ReIsEr40FoRmAt
mkfs id:        0x47846701
flushes:        0
blocks:         15204352
free blocks:    15203849
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10000
file count:     1
tree height:    2
key policy:     LARGE

FS status block (21):
FS marked consistent

root@ishi:[~]
# fsck.reiser4 --yes /dev/sdd5
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdd5 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
***** fsck.reiser4 started at Tue Nov 22 15:52:03 2016
Reiser4 fs was detected on /dev/sdd5.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x1 (format41)
mirror id:      0
replicas:       1
volume uuid:    bd01257d-7af7-4729-a970-c614ccda434e
subvol uuid:    4af98787-f659-4567-a66c-1a5f3b9767a1
label:          <none>

Format super block (17):
subvolume id:   0
num subvols:    1
plugin:         format41
description:    Standard layout for logical volumes.
version:        1
magic:          ReIsEr40FoRmAt
mkfs id:        0x47846701
flushes:        0
blocks:         15204352
free blocks:    15203849
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10000
file count:     1
tree height:    2
key policy:     LARGE


CHECKING THE STORAGE TREE
        Read nodes 2
        Nodes left in the tree 2
                Leaves of them 1, Twigs of them 1
        Time interval: Tue Nov 22 15:52:03 2016 - Tue Nov 22 15:52:03 2016
CHECKING EXTENT REGIONS.
        Read twigs 1
        Time interval: Tue Nov 22 15:52:03 2016 - Tue Nov 22 15:52:03 2016
CHECKING THE SEMANTIC TREE
        Found 1 objects (some could be encountered more then once).
        Time interval: Tue Nov 22 15:52:03 2016 - Tue Nov 22 15:52:03 2016
***** fsck.reiser4 finished at Tue Nov 22 15:52:03 2016
Closing fs...done

FS is consistent.

root@ishi:[~]
# fsck.reiser4 --yes /dev/sdd6
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdd6 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
***** fsck.reiser4 started at Tue Nov 22 15:52:34 2016
FSCK: master.c: 125: repair_master_check_struct: Refuse to check/repar
replica. Fsck works only with original subvolumes.
Fatal: Failed to open the master super block.

Operational error occurred while fscking.

root@ishi:[~]
# mount /dev/sdd5 /mnt
[  498.457176] BUG: unable to handle kernel paging request at 0000138800000=
000
[  498.457370] IP: [<0000138800000000>] 0x138800000000
[  498.457559] PGD 0
[  498.457949] Oops: 0010 [#1] SMP
[  498.458373] Modules linked in: nf_conntrack_ipv4 nf_defrag_ipv4
xt_addrtype xt_conntrack nf_conntrack iptable_filter xt_tcpudp xt_DSCP
iptable_mangle ip_tables x_tables cfg80211 rfkill joydev hid_generic
usbhid hid uvcvideo snd_usb_audio snd_hda_codec_hdmi snd_usbmidi_lib
videobuf2_vmalloc videobuf2_memops snd_rawmidi videobuf2_v4l2
snd_seq_device videobuf2_core videodev snd_hda_codec_via
snd_hda_codec_generic nouveau iTCO_wdt iTCO_vendor_support mxm_wmi wmi
coretemp hwmon x86_pkg_temp_thermal ttm intel_powerclamp
drm_kms_helper kvm_intel snd_hda_intel kvm psmouse serio_raw irqbypass
snd_hda_codec crct10dif_pclmul evdev crc32_pclmul snd_hda_core
crc32c_intel snd_hwdep ghash_clmulni_intel drm agpgart i2c_algo_bit
fb_sys_fops syscopyarea sysfillrect sysimgblt snd_pcm atl1c snd_timer
i2c_i801 snd soundcore i2c_core lpc_ich shpchp fan thermal battery
acpi_cpufreq video processor button
[  498.460662] CPU: 2 PID: 2000 Comm: mount Not tainted 4.7.2-SAUX-reiser4 =
#1
[  498.461297] Hardware name: Gigabyte Technology Co., Ltd. To be
filled by O.E.M./Z77-D3H, BIOS F23b 01/06/2014
[  498.461883] task: ffff8807fa935780 ti: ffff8807eca18000 task.ti:
ffff8807eca18000
[  498.462535] RIP: 0010:[<0000138800000000>]  [<0000138800000000>]
0x138800000000
[  498.463126] RSP: 0018:ffff8807eca1bc70  EFLAGS: 00010246
[  498.463731] RAX: ffffffff81e513e8 RBX: ffff8807f7a49800 RCX: 00000000000=
00000
[  498.464346] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8807f7a=
49800
[  498.464971] RBP: ffff8807eca1bda0 R08: ffff88081ef9fa30 R09: 00000000000=
00001
[  498.465638] R10: ffff8807eca1bc08 R11: 0000000000000001 R12: 00000000000=
00000
[  498.466298] R13: ffff8807f7a4e800 R14: ffff8807f7a4e950 R15: 00000000000=
00000
[  498.466933] FS:  00007fd643cc0780(0000) GS:ffff88081ed00000(0000)
knlGS:0000000000000000
[  498.467606] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  498.468247] CR2: 0000138800000000 CR3: 00000007ec8e9000 CR4: 00000000001=
406e0
[  498.468907] Stack:
[  498.469558]  ffffffff81237eff 000000004b1b5d0b 0000000000000000
0000000000000001
[  498.470260]  ffff8807eca1bc90 ffff8807eca1bc90 ffff8807eca1bca0
ffff8807eca1bca0
[  498.470955]  0000000000000000 0000000000000000 0000000000000000
0000000000000000
[  498.471638] Call Trace:
[  498.472371]  [<ffffffff81237eff>] ? fill_super+0x101/0x27c
[  498.473087]  [<ffffffff8119801a>] mount_bdev+0x141/0x193
[  498.473783]  [<ffffffff81237dfe>] ? reiser4_mount+0x17/0x17
[  498.474491]  [<ffffffff81237dfc>] reiser4_mount+0x15/0x17
[  498.475207]  [<ffffffff81198d2d>] mount_fs+0x67/0x12e
[  498.475917]  [<ffffffff811af22b>] vfs_kern_mount+0x6a/0xe2
[  498.476642]  [<ffffffff811b1d3b>] do_mount+0x8ee/0xa2a
[  498.477399]  [<ffffffff811b209e>] SyS_mount+0x77/0x9f
[  498.478134]  [<ffffffff818fa71f>] entry_SYSCALL_64_fastpath+0x17/0x93
[  498.478858] Code:  Bad RIP value.
[  498.479589] RIP  [<0000138800000000>] 0x138800000000
[  498.480304]  RSP <ffff8807eca1bc70>
[  498.481055] CR2: 0000138800000000
[  498.481787] ---[ end trace abb63613c002b217 ]---
[  498.482586] reiser4[mount(2000)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[  498.482586] WARNING: out of memory?
[  498.483995] reiser4[mount(2000)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[  498.483995] WARNING: out of memory?
[  498.485422] reiser4[mount(2000)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[  498.485422] WARNING: out of memory?
[  498.486878] reiser4[mount(2000)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[  498.486878] WARNING: out of memory?
[  498.488438] reiser4[mount(2000)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[  498.488438] WARNING: out of memory?
Killed

root@ishi:[~]
# mount /dev/sdd6 /mnt
[  540.345866] BUG: unable to handle kernel paging request at 0000138800000=
000
[  540.346127] IP: [<0000138800000000>] 0x138800000000
[  540.346869] PGD 0
[  540.347624] Oops: 0010 [#2] SMP
[  540.348423] Modules linked in: nf_conntrack_ipv4 nf_defrag_ipv4
xt_addrtype xt_conntrack nf_conntrack iptable_filter xt_tcpudp xt_DSCP
iptable_mangle ip_tables x_tables cfg80211 rfkill joydev hid_generic
usbhid hid uvcvideo snd_usb_audio snd_hda_codec_hdmi snd_usbmidi_lib
videobuf2_vmalloc videobuf2_memops snd_rawmidi videobuf2_v4l2
snd_seq_device videobuf2_core videodev snd_hda_codec_via
snd_hda_codec_generic nouveau iTCO_wdt iTCO_vendor_support mxm_wmi wmi
coretemp hwmon x86_pkg_temp_thermal ttm intel_powerclamp
drm_kms_helper kvm_intel snd_hda_intel kvm psmouse serio_raw irqbypass
snd_hda_codec crct10dif_pclmul evdev crc32_pclmul snd_hda_core
crc32c_intel snd_hwdep ghash_clmulni_intel drm agpgart i2c_algo_bit
fb_sys_fops syscopyarea sysfillrect sysimgblt snd_pcm atl1c snd_timer
i2c_i801 snd soundcore i2c_core lpc_ich shpchp fan thermal battery
acpi_cpufreq video processor button
[  540.351912] CPU: 0 PID: 2003 Comm: mount Tainted: G      D
4.7.2-SAUX-reiser4 #1
[  540.352769] Hardware name: Gigabyte Technology Co., Ltd. To be
filled by O.E.M./Z77-D3H, BIOS F23b 01/06/2014
[  540.353659] task: ffff8807fa937080 ti: ffff8807ec828000 task.ti:
ffff8807ec828000
[  540.354587] RIP: 0010:[<0000138800000000>]  [<0000138800000000>]
0x138800000000
[  540.355517] RSP: 0018:ffff8807ec82bc70  EFLAGS: 00010246
[  540.356418] RAX: ffffffff81e513e8 RBX: ffff8807f7a4f800 RCX: 00000000000=
00000
[  540.357334] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8807f7a=
4f800
[  540.358265] RBP: ffff8807ec82bda0 R08: ffff88081ef98320 R09: 00000000000=
00001
[  540.359166] R10: ffff8807ec82bc08 R11: 0000000000000001 R12: 00000000000=
00000
[  540.360106] R13: ffff8807f7a4d800 R14: ffff8807f7a4d950 R15: 00000000000=
00000
[  540.360983] FS:  00007f78ee5ff780(0000) GS:ffff88081ec00000(0000)
knlGS:0000000000000000
[  540.361840] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  540.362666] CR2: 0000138800000000 CR3: 00000007ec8f7000 CR4: 00000000001=
406f0
[  540.363470] Stack:
[  540.364248]  ffffffff81237eff 000000004b1b5d0b 0000000000000000
0000000000000001
[  540.365085]  ffff8807ec82bc90 ffff8807ec82bc90 ffff8807ec82bca0
ffff8807ec82bca0
[  540.365865]  0000000000000000 0000000000000000 0000000000000000
0000000000000000
[  540.366676] Call Trace:
[  540.367455]  [<ffffffff81237eff>] ? fill_super+0x101/0x27c
[  540.368239]  [<ffffffff8119801a>] mount_bdev+0x141/0x193
[  540.369017]  [<ffffffff81237dfe>] ? reiser4_mount+0x17/0x17
[  540.369794]  [<ffffffff81237dfc>] reiser4_mount+0x15/0x17
[  540.370594]  [<ffffffff81198d2d>] mount_fs+0x67/0x12e
[  540.371374]  [<ffffffff811af22b>] vfs_kern_mount+0x6a/0xe2
[  540.372133]  [<ffffffff811b1d3b>] do_mount+0x8ee/0xa2a
[  540.372906]  [<ffffffff811b209e>] SyS_mount+0x77/0x9f
[  540.373648]  [<ffffffff818fa71f>] entry_SYSCALL_64_fastpath+0x17/0x93
[  540.374377] Code:  Bad RIP value.
[  540.375141] RIP  [<0000138800000000>] 0x138800000000
[  540.375899]  RSP <ffff8807ec82bc70>
[  540.376657] CR2: 0000138800000000
[  540.377416] ---[ end trace abb63613c002b218 ]---
[  540.378225] reiser4[mount(2003)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[  540.378225] WARNING: out of memory?
[  540.379645] reiser4[mount(2003)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[  540.379645] WARNING: out of memory?
[  540.381186] reiser4[mount(2003)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[  540.381186] WARNING: out of memory?
[  540.382734] reiser4[mount(2003)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[  540.382734] WARNING: out of memory?
[  540.384380] reiser4[mount(2003)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[  540.384380] WARNING: out of memory?
Killed

root@ishi:[~]    :-(((

after all - cmd - sync reboot poweroff - not working !!!

followed by a hard reboot

I Linux distribution Crux

Best regards


Milan Bu=C5=A1ka


--=20
---------------------------------------------------------------------------=
-
Remember, no question is too stupid and no problem
          too small--We've all been beginners
