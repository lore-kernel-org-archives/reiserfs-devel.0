From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [BUG] on mount with reiser4-for-4.8
Date: Sun, 18 Dec 2016 13:17:06 +0100
Message-ID: <CADW=+3n30cS=w6T69fdeTkhzdEN4oed4YHbtgx8i9BXdz4mJ=w@mail.gmail.com>
References: <CADW=+3=UA1ugAVzrLMw-R8T5dWXjWnwwfUJHYfDp-VFMPyE5jg@mail.gmail.com>
 <5855B20D.6020304@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ug6SR1l5zPl74Z3PbUg/d51TOv0BrK7EJgJUXmqljPg=;
        b=iGj3eKL+imUBATBWT54FFTJEjdGOjypgks23Jsj0y3nH6nlYBRaWVnxo8jYppO+o7U
         OJip+DQYFkAyMQyOwizYdLiHxKZqHTGJcxgxp72na/rGkJIZuTKFtEirv+Q0flFPwalz
         Dllx9xmbHuHmwPlK9vLN3IHdUptROXlXp4jtyAMm671RzJ7lUUe/t/Ksxau7e4UW+QzR
         40S//0YPWecktlYzROj2vL1fQHsi5mgBkbWlUlgV6/IudCNBYV2JADELfabWOV5wJHtX
         WNVxUP04On8dNYZeZ/pmoXdeGRYLhCHSbuNN5g1h0T6cYqGVJborn12tpxh45k0hBsP7
         JfFQ==
In-Reply-To: <5855B20D.6020304@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

It's OK now, mounts read-only on error.

What about that BUG on mount?

On Sat, Dec 17, 2016 at 10:45 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Please, check if this help.
> Apply from reiser4 directory.
>
> Thanks,
> Edward.
>
>
> On 12/17/2016 10:08 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> When mounting reiser4 partitions I get the following bug, but the
>> system keeps working, even as reiser4 remounted partition as read
>> only.
>>
>> All R4 partitions are ccreg40.
>>
>> Thanks
>>
>> Dushan
>>
>>   cat /etc/fstab | grep -v "#"
>>
>>
>> /dev/sda1        /boot        ext2        noauto,noatime    1 2
>> /dev/md123              none            swap            sw              =
0
>> 0
>> /dev/sda2        /        reiser4        noatime,onerror=3Dremount-ro
>> 0 0
>> /dev/md125        /mnt/backup    reiser4
>> noatime,noauto,onerror=3Dremount-ro    0 0
>> /dev/md126        /mnt/media    reiser4
>> noatime,users,onerror=3Dremount-ro    0 0
>> /dev/md127        /usr/portage    reiser4
>> noatime,onerror=3Dremount-ro        0 0
>> /dev/dvdrom        /mnt/cdrom    auto        noauto,ro    0 0
>> shm            /dev/shm    tmpfs        nodev,nosuid,noexec    0 0
>>
>>
>> cat /proc/mdstat
>> Personalities : [raid1]
>> md122 : active raid1 sdc1[1] sdb1[0]
>>        104320 blocks [2/2] [UU]
>>
>> md123 : active raid1 sdc2[1] sdb2[0]
>>        594304 blocks [2/2] [UU]
>>
>> md124 : active raid1 sdc5[1] sdb5[0]
>>        9775424 blocks [2/2] [UU]
>>
>> md125 : active raid1 sdc6[1] sdb6[0]
>>        68364480 blocks [2/2] [UU]
>>
>> md126 : active raid1 sdc7[1] sdb7[0]
>>        403110912 blocks [2/2] [UU]
>>
>> md127 : active raid1 sdc8[1] sdb8[0]
>>        6433920 blocks [2/2] [UU]
>>
>>   df
>>
>> Filesystem     1K-blocks      Used Available Use% Mounted on
>> /dev/sda2       37017728  30413152   6604576  83% /
>> tmpfs             680644      1012    679632   1% /run
>> dev                10240         0     10240   0% /dev
>> shm              3403212      1284   3401928   1% /dev/shm
>> cgroup_root        10240         0     10240   0% /sys/fs/cgroup
>> /dev/md126     383034100 350741596  32292504  92% /mnt/media
>> /dev/md127       6113484   5605344    508140  92% /usr/portage
>> none             3403212        12   3403200   1% /run/user/1001
>> none             3403212         0   3403212   0% /run/user/1000
>> /dev/md125      64959612  52568760  12390852  81% /mnt/backup
>>
>>
>> dmesg
>>
>> [    2.057469] reiser4[swapper/0(1)]: try_init_format40
>> (fs/reiser4/plugin/disk_format/disk_format40.c:303)[vpf-1364]:
>>                 NOTICE: Warning: mounting sda2 with fatal errors,
>> forcing read-only mount.
>> [    2.060544] reiser4: sda2: found disk format 4.0.1.
>> [    2.062410]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [    2.063993] BUG: KASAN: use-after-free in
>> init_format_format40+0x401/0x750 at addr ffff8801d0fc0850
>> [    2.065616] Read of size 4 by task swapper/0/1
>> [    2.067228] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.8.11-gentoo #=
3
>> [    2.068857] Hardware name: Gigabyte Technology Co., Ltd. To be
>> filled by O.E.M./B75-D3V, BIOS F5 07/04/2012
>> [    2.070566]  ffff8801d08f4580 ffff8801d6327a20 ffffffff81424185
>> ffff8801d6000600
>> [    2.072316]  ffff8801d0fc0800 ffff8801d6327a48 ffffffff811ff90c
>> ffff8801d6327ad8
>> [    2.074078]  ffff8801d0fc0800 ffff8801d0fc0800 ffff8801d6327ac8
>> ffffffff811ffb79
>> [    2.075861] Call Trace:
>> [    2.077616]  [<ffffffff81424185>] dump_stack+0x4d/0x68
>> [    2.079402]  [<ffffffff811ff90c>] kasan_object_err+0x1c/0x70
>> [    2.081216]  [<ffffffff811ffb79>] kasan_report_error+0x1c9/0x4b0
>> [    2.083049]  [<ffffffff812a10cf>] ? zget+0xdf/0x3c0
>> [    2.084876]  [<ffffffff811ffef4>] kasan_report+0x34/0x40
>> [    2.086717]  [<ffffffff81304b11>] ? init_format_format40+0x401/0x750
>> [    2.088594]  [<ffffffff811ff601>] __asan_load4+0x61/0x80
>> [    2.090471]  [<ffffffff81304b11>] init_format_format40+0x401/0x750
>> [    2.092356]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [    2.094224]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [    2.096073]  [<ffffffff812c4df0>] ? reiser4_mount+0x20/0x20
>> [    2.097930]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [    2.099785]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [    2.101654]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [    2.103528]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [    2.105397]  [<ffffffff811fe944>] ? kasan_check_write+0x14/0x20
>> [    2.107295]  [<ffffffff811c4624>] ? strndup_user+0x54/0x70
>> [    2.109187]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [    2.111089]  [<ffffffff820a8759>] mount_block_root+0x171/0x3ac
>> [    2.113023]  [<ffffffff820a8a0b>] mount_root+0x77/0xd8
>> [    2.114955]  [<ffffffff820a8ba1>] prepare_namespace+0x135/0x16d
>> [    2.116887]  [<ffffffff820a84ec>] kernel_init_freeable+0x237/0x24b
>> [    2.118811]  [<ffffffff81a50e9e>] kernel_init+0xe/0x120
>> [    2.120713]  [<ffffffff81a5780f>] ret_from_fork+0x1f/0x40
>> [    2.122618]  [<ffffffff81a50e90>] ? rest_init+0x80/0x80
>> [    2.124522] Object at ffff8801d0fc0800, in cache kmalloc-512 size: 51=
2
>> [    2.126453] Allocated:
>> [    2.128364] PID =3D 1
>> [    2.130261]  [<ffffffff8109f536>] save_stack_trace+0x26/0x50
>> [    2.132219]  [<ffffffff811fe802>] kasan_kmalloc.part.5+0x62/0xf0
>> [    2.134206]  [<ffffffff811ff018>] kasan_kmalloc+0x78/0xa0
>> [    2.136188]  [<ffffffff813048bc>] init_format_format40+0x1ac/0x750
>> [    2.138174]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [    2.140144]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [    2.142096]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [    2.144055]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [    2.146028]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [    2.148016]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [    2.150014]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [    2.152026]  [<ffffffff820a8759>] mount_block_root+0x171/0x3ac
>> [    2.154055]  [<ffffffff820a8a0b>] mount_root+0x77/0xd8
>> [    2.156066]  [<ffffffff820a8ba1>] prepare_namespace+0x135/0x16d
>> [    2.158074]  [<ffffffff820a84ec>] kernel_init_freeable+0x237/0x24b
>> [    2.160079]  [<ffffffff81a50e9e>] kernel_init+0xe/0x120
>> [    2.162020]  [<ffffffff81a5780f>] ret_from_fork+0x1f/0x40
>> [    2.163918] Freed:
>> [    2.165760] PID =3D 1
>> [    2.167562]  [<ffffffff8109f536>] save_stack_trace+0x26/0x50
>> [    2.169376]  [<ffffffff811feed7>] kasan_slab_free+0xb7/0x180
>> [    2.171150]  [<ffffffff811fd67b>] kfree+0x6b/0x90
>> [    2.172895]  [<ffffffff81304b09>] init_format_format40+0x3f9/0x750
>> [    2.174616]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [    2.176290]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [    2.177962]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [    2.179633]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [    2.181273]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [    2.182910]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [    2.184541]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [    2.186171]  [<ffffffff820a8759>] mount_block_root+0x171/0x3ac
>> [    2.187804]  [<ffffffff820a8a0b>] mount_root+0x77/0xd8
>> [    2.189430]  [<ffffffff820a8ba1>] prepare_namespace+0x135/0x16d
>> [    2.191056]  [<ffffffff820a84ec>] kernel_init_freeable+0x237/0x24b
>> [    2.192683]  [<ffffffff81a50e9e>] kernel_init+0xe/0x120
>> [    2.194296]  [<ffffffff81a5780f>] ret_from_fork+0x1f/0x40
>> [    2.195902] Memory state around the buggy address:
>> [    2.197517]  ffff8801d0fc0700: fc fc fc fc fc fc fc fc fc fc fc fc
>> fc fc fc fc
>> [    2.199178]  ffff8801d0fc0780: fc fc fc fc fc fc fc fc fc fc fc fc
>> fc fc fc fc
>> [    2.200818] >ffff8801d0fc0800: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [    2.202460]                                                  ^
>> [    2.204114]  ffff8801d0fc0880: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [    2.205804]  ffff8801d0fc0900: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [    2.207471]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [    2.209162] Disabling lock debugging due to kernel taint
>> [    2.210933] reiser4: sda2: use 'fsck.reiser4 --fix' to complete
>> disk format upgrade.
>> [    2.212696] usb 1-1.4: new high-speed USB device number 3 using
>> ehci-pci
>> [    2.214507] usb 2-1.5: new full-speed USB device number 3 using
>> ehci-pci
>> [    2.234910] hid-generic 0003:051D:0002.0002: device has no
>> listeners, quitting
>> [    2.312037] reiser4: sda2: using Hybrid Transaction Model.
>> [    2.313880] VFS: Mounted root (reiser4 filesystem) readonly on device
>> 8:2.
>> [    2.315949] Freeing unused kernel memory: 968K (ffffffff82086000 -
>> ffffffff82178000)
>> [    2.317823] Write protecting the kernel read-only data: 16384k
>> [    2.320900] Freeing unused kernel memory: 1636K (ffff880001a67000 -
>> ffff880001c00000)
>> [    2.331114] Freeing unused kernel memory: 1848K (ffff880001e32000 -
>> ffff880002000000)
>> [    2.334644] hub 1-1.4:1.0: USB hub found
>> [    2.336766] hub 1-1.4:1.0: 2 ports detected
>> [    2.624398] usb 1-1.4.2: new full-speed USB device number 4 using
>> ehci-pci
>> [    5.221431] random: crng init done
>> [    7.579186] Adding 594300k swap on /dev/md123.  Priority:-1
>> extents:1 across:594300k
>> [    7.661464] reiser4: md126: found disk format 4.0.1.
>> [    7.661541]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [    7.661546] BUG: KASAN: use-after-free in
>> init_format_format40+0x401/0x750 at addr ffff8801cfaf1350
>> [    7.661548] Read of size 4 by task mount/1662
>> [    7.661551] CPU: 0 PID: 1662 Comm: mount Tainted: G    B
>> 4.8.11-gentoo #3
>> [    7.661552] Hardware name: Gigabyte Technology Co., Ltd. To be
>> filled by O.E.M./B75-D3V, BIOS F5 07/04/2012
>> [    7.661553]  ffff8801ceef3580 ffff8801cf087b28 ffffffff81424185
>> ffff8801d6000600
>> [    7.661556]  ffff8801cfaf1300 ffff8801cf087b50 ffffffff811ff90c
>> ffff8801cf087be0
>> [    7.661559]  ffff8801cfaf1300 ffff8801cfaf1300 ffff8801cf087bd0
>> ffffffff811ffb79
>> [    7.661561] Call Trace:
>> [    7.661565]  [<ffffffff81424185>] dump_stack+0x4d/0x68
>> [    7.661569]  [<ffffffff811ff90c>] kasan_object_err+0x1c/0x70
>> [    7.661571]  [<ffffffff811ffb79>] kasan_report_error+0x1c9/0x4b0
>> [    7.661574]  [<ffffffff812a10cf>] ? zget+0xdf/0x3c0
>> [    7.661577]  [<ffffffff811ffef4>] kasan_report+0x34/0x40
>> [    7.661580]  [<ffffffff81304b11>] ? init_format_format40+0x401/0x750
>> [    7.661582]  [<ffffffff811ff601>] __asan_load4+0x61/0x80
>> [    7.661585]  [<ffffffff81304b11>] init_format_format40+0x401/0x750
>> [    7.661588]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [    7.661591]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [    7.661593]  [<ffffffff812c4df0>] ? reiser4_mount+0x20/0x20
>> [    7.661594]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [    7.661597]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [    7.661600]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [    7.661602]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [    7.661604]  [<ffffffff812337f1>] ? copy_mount_options+0x111/0x220
>> [    7.661606]  [<ffffffff812337da>] ? copy_mount_options+0xfa/0x220
>> [    7.661608]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [    7.661613]  [<ffffffff81a5761b>] entry_SYSCALL_64_fastpath+0x13/0x8f
>> [    7.661614] Object at ffff8801cfaf1300, in cache kmalloc-512 size: 51=
2
>> [    7.661615] Allocated:
>> [    7.661615] PID =3D 1662
>> [    7.661616]  [<ffffffff8109f536>] save_stack_trace+0x26/0x50
>> [    7.661620]  [<ffffffff811fe802>] kasan_kmalloc.part.5+0x62/0xf0
>> [    7.661622]  [<ffffffff811ff018>] kasan_kmalloc+0x78/0xa0
>> [    7.661625]  [<ffffffff813048bc>] init_format_format40+0x1ac/0x750
>> [    7.661628]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [    7.661630]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [    7.661632]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [    7.661634]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [    7.661637]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [    7.661639]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [    7.661641]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [    7.661643]  [<ffffffff81a5761b>] entry_SYSCALL_64_fastpath+0x13/0x8f
>> [    7.661646] Freed:
>> [    7.661646] PID =3D 1662
>> [    7.661647]  [<ffffffff8109f536>] save_stack_trace+0x26/0x50
>> [    7.661649]  [<ffffffff811feed7>] kasan_slab_free+0xb7/0x180
>> [    7.661652]  [<ffffffff811fd67b>] kfree+0x6b/0x90
>> [    7.661654]  [<ffffffff81304b09>] init_format_format40+0x3f9/0x750
>> [    7.661657]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [    7.661659]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [    7.661662]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [    7.661664]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [    7.661666]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [    7.661668]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [    7.661670]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [    7.661672]  [<ffffffff81a5761b>] entry_SYSCALL_64_fastpath+0x13/0x8f
>> [    7.661675] Memory state around the buggy address:
>> [    7.661677]  ffff8801cfaf1200: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [    7.661679]  ffff8801cfaf1280: fc fc fc fc fc fc fc fc fc fc fc fc
>> fc fc fc fc
>> [    7.661681] >ffff8801cfaf1300: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [    7.661681]                                                  ^
>> [    7.661683]  ffff8801cfaf1380: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [    7.661684]  ffff8801cfaf1400: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [    7.661685]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [   10.972840] rcu-perf:rcu_perf_writer 0 has 100 measurements
>> [   11.016722] rcu-perf:Test complete
>> [   26.835385] reiser4: md126: using Hybrid Transaction Model.
>> [   26.857910] reiser4: md127: found disk format 4.0.1.
>> [   26.857995]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [   26.858002] BUG: KASAN: use-after-free in
>> init_format_format40+0x401/0x750 at addr ffff8801cbf560d0
>> [   26.858003] Read of size 4 by task mount/1662
>> [   26.858006] CPU: 0 PID: 1662 Comm: mount Tainted: G    B
>> 4.8.11-gentoo #3
>> [   26.858007] Hardware name: Gigabyte Technology Co., Ltd. To be
>> filled by O.E.M./B75-D3V, BIOS F5 07/04/2012
>> [   26.858009]  ffff8801b9ded5c0 ffff8801cf087b28 ffffffff81424185
>> ffff8801d6000600
>> [   26.858012]  ffff8801cbf56080 ffff8801cf087b50 ffffffff811ff90c
>> ffff8801cf087be0
>> [   26.858014]  ffff8801cbf56080 ffff8801cbf56080 ffff8801cf087bd0
>> ffffffff811ffb79
>> [   26.858017] Call Trace:
>> [   26.858020]  [<ffffffff81424185>] dump_stack+0x4d/0x68
>> [   26.858024]  [<ffffffff811ff90c>] kasan_object_err+0x1c/0x70
>> [   26.858027]  [<ffffffff811ffb79>] kasan_report_error+0x1c9/0x4b0
>> [   26.858029]  [<ffffffff812a10cf>] ? zget+0xdf/0x3c0
>> [   26.858032]  [<ffffffff811ffef4>] kasan_report+0x34/0x40
>> [   26.858035]  [<ffffffff81304b11>] ? init_format_format40+0x401/0x750
>> [   26.858038]  [<ffffffff811ff601>] __asan_load4+0x61/0x80
>> [   26.858040]  [<ffffffff81304b11>] init_format_format40+0x401/0x750
>> [   26.858043]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [   26.858046]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [   26.858048]  [<ffffffff812c4df0>] ? reiser4_mount+0x20/0x20
>> [   26.858050]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [   26.858052]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [   26.858055]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [   26.858057]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [   26.858059]  [<ffffffff812337da>] ? copy_mount_options+0xfa/0x220
>> [   26.858061]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [   26.858065]  [<ffffffff81a5761b>] entry_SYSCALL_64_fastpath+0x13/0x8f
>> [   26.858067] Object at ffff8801cbf56080, in cache kmalloc-512 size: 51=
2
>> [   26.858067] Allocated:
>> [   26.858068] PID =3D 1662
>> [   26.858069]  [<ffffffff8109f536>] save_stack_trace+0x26/0x50
>> [   26.858072]  [<ffffffff811fe802>] kasan_kmalloc.part.5+0x62/0xf0
>> [   26.858075]  [<ffffffff811ff018>] kasan_kmalloc+0x78/0xa0
>> [   26.858077]  [<ffffffff813048bc>] init_format_format40+0x1ac/0x750
>> [   26.858080]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [   26.858082]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [   26.858085]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [   26.858087]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [   26.858089]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [   26.858091]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [   26.858093]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [   26.858095]  [<ffffffff81a5761b>] entry_SYSCALL_64_fastpath+0x13/0x8f
>> [   26.858098] Freed:
>> [   26.858099] PID =3D 1662
>> [   26.858099]  [<ffffffff8109f536>] save_stack_trace+0x26/0x50
>> [   26.858102]  [<ffffffff811feed7>] kasan_slab_free+0xb7/0x180
>> [   26.858104]  [<ffffffff811fd67b>] kfree+0x6b/0x90
>> [   26.858107]  [<ffffffff81304b09>] init_format_format40+0x3f9/0x750
>> [   26.858109]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [   26.858111]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [   26.858114]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [   26.858116]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [   26.858118]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [   26.858120]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [   26.858122]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [   26.858124]  [<ffffffff81a5761b>] entry_SYSCALL_64_fastpath+0x13/0x8f
>> [   26.858128] Memory state around the buggy address:
>> [   26.858130]  ffff8801cbf55f80: fc fc fc fc fc fc fc fc fc fc fc fc
>> fc fc fc fc
>> [   26.858131]  ffff8801cbf56000: fc fc fc fc fc fc fc fc fc fc fc fc
>> fc fc fc fc
>> [   26.858133] >ffff8801cbf56080: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [   26.858134]                                                  ^
>> [   26.858135]  ffff8801cbf56100: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [   26.858137]  ffff8801cbf56180: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [   26.858137]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [   27.199941] reiser4: md127: using Hybrid Transaction Model.
>>
>>
>> [33530.203469] reiser4[mount(11677)]: try_init_format40
>> (fs/reiser4/plugin/disk_format/disk_format40.c:303)[vpf-1364]:
>>                 NOTICE: Warning: mounting md125 with fatal errors,
>> forcing read-only mount.
>> [33530.203480] reiser4: md125: found disk format 4.0.1.
>> [33530.203564]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [33530.203570] BUG: KASAN: use-after-free in
>> init_format_format40+0x401/0x750 at addr ffff88013164d810
>> [33530.203571] Read of size 4 by task mount/11677
>> [33530.203574] CPU: 0 PID: 11677 Comm: mount Tainted: G    B
>> 4.8.11-gentoo #3
>> [33530.203575] Hardware name: Gigabyte Technology Co., Ltd. To be
>> filled by O.E.M./B75-D3V, BIOS F5 07/04/2012
>> [33530.203577]  ffff88000e65ce80 ffff88000da87b28 ffffffff81424185
>> ffff8801d6000600
>> [33530.203580]  ffff88013164d7c0 ffff88000da87b50 ffffffff811ff90c
>> ffff88000da87be0
>> [33530.203582]  ffff88013164d7c0 ffff88013164d7c0 ffff88000da87bd0
>> ffffffff811ffb79
>> [33530.203585] Call Trace:
>> [33530.203588]  [<ffffffff81424185>] dump_stack+0x4d/0x68
>> [33530.203592]  [<ffffffff811ff90c>] kasan_object_err+0x1c/0x70
>> [33530.203595]  [<ffffffff811ffb79>] kasan_report_error+0x1c9/0x4b0
>> [33530.203597]  [<ffffffff812a10cf>] ? zget+0xdf/0x3c0
>> [33530.203600]  [<ffffffff811ffef4>] kasan_report+0x34/0x40
>> [33530.203603]  [<ffffffff81304b11>] ? init_format_format40+0x401/0x750
>> [33530.203605]  [<ffffffff811ff601>] __asan_load4+0x61/0x80
>> [33530.203608]  [<ffffffff81304b11>] init_format_format40+0x401/0x750
>> [33530.203610]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [33530.203613]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [33530.203615]  [<ffffffff812c4df0>] ? reiser4_mount+0x20/0x20
>> [33530.203617]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [33530.203620]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [33530.203622]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [33530.203625]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [33530.203627]  [<ffffffff812337f1>] ? copy_mount_options+0x111/0x220
>> [33530.203629]  [<ffffffff812337da>] ? copy_mount_options+0xfa/0x220
>> [33530.203631]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [33530.203635]  [<ffffffff81a5761b>] entry_SYSCALL_64_fastpath+0x13/0x8f
>> [33530.203637] Object at ffff88013164d7c0, in cache kmalloc-512 size: 51=
2
>> [33530.203637] Allocated:
>> [33530.203638] PID =3D 11677
>> [33530.203639]  [<ffffffff8109f536>] save_stack_trace+0x26/0x50
>> [33530.203642]  [<ffffffff811fe802>] kasan_kmalloc.part.5+0x62/0xf0
>> [33530.203645]  [<ffffffff811ff018>] kasan_kmalloc+0x78/0xa0
>> [33530.203647]  [<ffffffff813048bc>] init_format_format40+0x1ac/0x750
>> [33530.203650]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [33530.203652]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [33530.203654]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [33530.203656]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [33530.203659]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [33530.203661]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [33530.203663]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [33530.203665]  [<ffffffff81a5761b>] entry_SYSCALL_64_fastpath+0x13/0x8f
>> [33530.203668] Freed:
>> [33530.203669] PID =3D 11677
>> [33530.203669]  [<ffffffff8109f536>] save_stack_trace+0x26/0x50
>> [33530.203671]  [<ffffffff811feed7>] kasan_slab_free+0xb7/0x180
>> [33530.203674]  [<ffffffff811fd67b>] kfree+0x6b/0x90
>> [33530.203676]  [<ffffffff81304b09>] init_format_format40+0x3f9/0x750
>> [33530.203679]  [<ffffffff812c4f3a>] fill_super+0x14a/0x300
>> [33530.203681]  [<ffffffff81209b6f>] mount_bdev+0x1bf/0x200
>> [33530.203683]  [<ffffffff812c4de0>] reiser4_mount+0x10/0x20
>> [33530.203685]  [<ffffffff81209dfe>] mount_fs+0x2e/0xe0
>> [33530.203688]  [<ffffffff81231a96>] vfs_kern_mount+0x66/0x190
>> [33530.203690]  [<ffffffff81233af2>] do_mount+0x1d2/0x1080
>> [33530.203692]  [<ffffffff81234e46>] SyS_mount+0x66/0xb0
>> [33530.203694]  [<ffffffff81a5761b>] entry_SYSCALL_64_fastpath+0x13/0x8f
>> [33530.203697] Memory state around the buggy address:
>> [33530.203699]  ffff88013164d700: fc fc fc fc fc fc fc fc fc fc fc fc
>> fc fc fc fc
>> [33530.203701]  ffff88013164d780: fc fc fc fc fc fc fc fc fb fb fb fb
>> fb fb fb fb
>> [33530.203703] >ffff88013164d800: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [33530.203703]                          ^
>> [33530.203705]  ffff88013164d880: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [33530.203707]  ffff88013164d900: fb fb fb fb fb fb fb fb fb fb fb fb
>> fb fb fb fb
>> [33530.203707]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [33533.485380] reiser4: md125: using Hybrid Transaction Model.
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel=
"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
