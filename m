From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sat,  2 Mar 2013 10:36:31 +0000 (UTC)
Message-ID: <20130302103631.64E5611FCC0@bugzilla.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D29162





--- Comment #44 from Ra=C3=BAl <rasasi78@gmail.com>  2013-03-02 10:36:3=
0 ---
Created an attachment (id=3D94271)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=3D94271)
dmesg for the oops

Hi:

 Unfortunately, I can't explain how to reliably reproduce this problem =
but this
time it happenned quite soon as I upgraded to 3.8.0, exactly debian pac=
kage
linux-image-3.8-trunk-amd64 (3.8-1~experimental.1) The only thing I had=
 to do
was hibernate and after I resume the problem was already there.

  All partitions, but /boot are crypted. My disk and partition layout i=
s this:
# pvs
  PV                     VG      Fmt  Attr PSize   PFree
  /dev/mapper/sda5_crypt portaka lvm2 a--  186,07g    0=20

# vgs
  VG      #PV #LV #SN Attr   VSize   VFree
  portaka   1   5   0 wz--n- 186,07g    0=20

# lvs
  LV   VG      Attr     LSize   Pool Origin Data%  Move Log Copy%  Conv=
ert
  home portaka -wi-ao-- 170,45g                                        =
  =20
  root portaka -wi-ao--   1,73g                                        =
  =20
  swap portaka -wc-ao--   2,00g                                        =
  =20
  usr  portaka -wi-ao--   6,89g                                        =
  =20
  var  portaka -wi-ao--   5,00g=20

# cat /proc/mounts=20
rootfs / rootfs rw 0 0
sysfs /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
proc /proc proc rw,nosuid,nodev,noexec,relatime 0 0
udev /dev devtmpfs rw,relatime,size=3D10240k,nr_inodes=3D504930,mode=3D=
755 0 0
devpts /dev/pts devpts rw,nosuid,noexec,relatime,gid=3D5,mode=3D620,ptm=
xmode=3D000 0
0
tmpfs /run tmpfs rw,nosuid,nodev,noexec,relatime,size=3D405388k,mode=3D=
755 0 0
/dev/mapper/portaka-root / reiserfs rw,noatime 0 0
tmpfs /run/lock tmpfs rw,nosuid,nodev,noexec,relatime,size=3D5120k 0 0
tmpfs /run/shm tmpfs rw,nosuid,nodev,noexec,relatime,size=3D810760k 0 0
fusectl /sys/fs/fuse/connections fusectl rw,relatime 0 0
tmpfs /tmp tmpfs rw,nosuid,nodev,noatime,size=3D2026936k 0 0
/dev/sda1 /boot ext3 rw,noatime,errors=3Dcontinue,barrier=3D1,data=3Dor=
dered 0 0
/dev/mapper/portaka-home /home reiserfs rw,noatime 0 0
/dev/mapper/portaka-usr /usr reiserfs rw,noatime 0 0
/dev/mapper/portaka-var /var reiserfs rw,noatime 0 0
rpc_pipefs /var/lib/nfs/rpc_pipefs rpc_pipefs rw,relatime 0 0
binfmt_misc /proc/sys/fs/binfmt_misc binfmt_misc
rw,nosuid,nodev,noexec,relatime 0 0

  I knew I triggered the problem when I tried to issue a "sync" command=
=2E But
other options may be touching a file in a directory which is in the aff=
ected
filesystem. I could recover from this situation doing a sysrq-E, which
terminates all processes.

  I assume the best way to help is giving exact instructions to reprodu=
ce the
crash but till I could get that information let me know if I can be of =
help
some other way.

  This is an excerpt of the dmesg which I'm attaching:
[ 8400.524149] INFO: task flush-254:2:2147 blocked for more than 120 se=
conds.
[ 8400.524156] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this
message.
[ 8400.524160] flush-254:2     D ffff88013fd13bc0     0  2147      2 0x=
00000000
[ 8400.524172]  ffff880137dcc760 0000000000000046 ffff880035bb4910
ffff88009c0738a0
[ 8400.524178]  0000000000013bc0 ffff8801384a3fd8 ffff8801384a3fd8
ffff880137dcc760
[ 8400.524183]  0000000000000000 ffff88013fd13bc0 ffff880137dcc760
ffff8801384a3aa0
[ 8400.524188] Call Trace:
[ 8400.524200]  [<ffffffff810c21e9>] ? __lock_page+0x66/0x66
[ 8400.524206]  [<ffffffff813811d0>] ? io_schedule+0x56/0x6d
[ 8400.524210]  [<ffffffff810c21f0>] ? sleep_on_page+0x7/0xc
[ 8400.524215]  [<ffffffff81380232>] ? __wait_on_bit_lock+0x3c/0x85
[ 8400.524219]  [<ffffffff810c279a>] ? find_get_pages_tag+0xe7/0x121
[ 8400.524223]  [<ffffffff810c21e4>] ? __lock_page+0x61/0x66
[ 8400.524229]  [<ffffffff81057b85>] ? autoremove_wake_function+0x2a/0x=
2a
[ 8400.524234]  [<ffffffff810ca2be>] ? write_cache_pages+0x166/0x2e2
[ 8400.524239]  [<ffffffff810c991b>] ? page_index+0x14/0x14
[ 8400.524244]  [<ffffffff810ca472>] ? generic_writepages+0x38/0x54
[ 8400.524250]  [<ffffffff81129c55>] ? __writeback_single_inode+0x3e/0x=
115
[ 8400.524255]  [<ffffffff8112a9ac>] ? writeback_sb_inodes+0x1dd/0x30c
[ 8400.524260]  [<ffffffff8112ab44>] ? __writeback_inodes_wb+0x69/0xab
[ 8400.524265]  [<ffffffff8112acbd>] ? wb_writeback+0x137/0x28c
[ 8400.524269]  [<ffffffff810ca71e>] ? bdi_dirty_limit+0x27/0x84
[ 8400.524273]  [<ffffffff8112b0f4>] ? wb_do_writeback+0x186/0x1bb
[ 8400.524279]  [<ffffffff81049538>] ? del_timer_sync+0x27/0x44
[ 8400.524283]  [<ffffffff8112b129>] ? wb_do_writeback+0x1bb/0x1bb
[ 8400.524288]  [<ffffffff8112b1d1>] ? bdi_writeback_thread+0xa8/0x1db
[ 8400.524293]  [<ffffffff8112b129>] ? wb_do_writeback+0x1bb/0x1bb
[ 8400.524297]  [<ffffffff8112b129>] ? wb_do_writeback+0x1bb/0x1bb
[ 8400.524301]  [<ffffffff81057280>] ? kthread+0x81/0x89
[ 8400.524306]  [<ffffffff8105fbd0>] ? mmdrop+0xd/0x1c
[ 8400.524310]  [<ffffffff81061447>] ? finish_task_switch+0x83/0xb3
[ 8400.524315]  [<ffffffff810571ff>] ? __kthread_parkme+0x5c/0x5c
[ 8400.524320]  [<ffffffff81386cbc>] ? ret_from_fork+0x7c/0xb0
[ 8400.524324]  [<ffffffff810571ff>] ? __kthread_parkme+0x5c/0x5c
[ 8400.524354] INFO: task klauncher:3794 blocked for more than 120 seco=
nds.
[ 8400.524357] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this
message.
[ 8400.524359] klauncher       D ffff880139fce7e0     0  3794   3791 0x=
00000000
[ 8400.524364]  ffff880139fce7e0 0000000000000082 0000000000000282
ffff880124ff4080
[ 8400.524369]  0000000000013bc0 ffff880139777fd8 ffff880139777fd8
ffff880139fce7e0
[ 8400.524373]  ffffffff81381a6d ffffc900108ae000 ffff880139fce7e0
ffff880138793c00
[ 8400.524378] Call Trace:
[ 8400.524383]  [<ffffffff81381a6d>] ? _raw_spin_lock_irqsave+0x14/0x35
[ 8400.524416]  [<ffffffffa0242d48>] ? queue_log_writer+0x7d/0xad [reis=
erfs]
[ 8400.524421]  [<ffffffff81064071>] ? try_to_wake_up+0x199/0x199
[ 8400.524433]  [<ffffffffa02475e1>] ? do_journal_begin_r+0x177/0x23e
[reiserfs]
[ 8400.524438]  [<ffffffff81381a6d>] ? _raw_spin_lock_irqsave+0x14/0x35
[ 8400.524443]  [<ffffffff811300b2>] ? create_page_buffers+0x42/0x51
[ 8400.524455]  [<ffffffffa024775d>] ? journal_begin+0xb5/0xec [reiserf=
s]
[ 8400.524466]  [<ffffffffa0232883>] ? reiserfs_write_end+0x10a/0x22b
[reiserfs]
[ 8400.524477]  [<ffffffffa0231c5c>] ? reiserfs_write_begin+0xcf/0x176
[reiserfs]
[ 8400.524481]  [<ffffffff810c2dbf>] ? generic_file_buffered_write+0x17=
e/0x235
[ 8400.524488]  [<ffffffff810c38c2>] ? __generic_file_aio_write+0x1cc/0=
x1fc
[ 8400.524493]  [<ffffffff8110cc0c>] ? __sb_start_write+0xb6/0xe8
[ 8400.524498]  [<ffffffff810613a6>] ? should_resched+0x5/0x23
[ 8400.524502]  [<ffffffff810c395b>] ? generic_file_aio_write+0x69/0xc9
[ 8400.524507]  [<ffffffff8110adcf>] ? do_sync_write+0x62/0x9b
[ 8400.524512]  [<ffffffff8110b376>] ? vfs_write+0x96/0xf8
[ 8400.524517]  [<ffffffff8110b59e>] ? sys_write+0x51/0x80
[ 8400.524522]  [<ffffffff81386d69>] ? system_call_fastpath+0x16/0x1b
[ 8400.524525] INFO: task kded4:3796 blocked for more than 120 seconds.
[ 8400.524528] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this
message.
[ 8400.524530] kded4           D ffff88013fd13bc0     0  3796      1 0x=
00000000
[ 8400.524534]  ffff880137aea820 0000000000000082 0200000000020028
ffff88013aeb4180
[ 8400.524539]  0000000000013bc0 ffff880139c8bfd8 ffff880139c8bfd8
ffff880137aea820
[ 8400.524544]  00007fffcfc48d90 ffff8801392d4c60 ffff880137aea820
ffff8801392d4c64
[ 8400.524549] Call Trace:
[ 8400.524554]  [<ffffffff813804f5>] ? __mutex_lock_common.isra.6+0x149=
/0x165
[ 8400.524559]  [<ffffffff81380320>] ? mutex_lock+0x1a/0x2d
[ 8400.524563]  [<ffffffff810c3947>] ? generic_file_aio_write+0x55/0xc9
[ 8400.524567]  [<ffffffff8110adcf>] ? do_sync_write+0x62/0x9b
[ 8400.524572]  [<ffffffff8110b376>] ? vfs_write+0x96/0xf8
[ 8400.524577]  [<ffffffff8110b59e>] ? sys_write+0x51/0x80
[ 8400.524581]  [<ffffffff81386d69>] ? system_call_fastpath+0x16/0x1b
[ 8400.524591] INFO: task plasma-desktop:4165 blocked for more than 120
seconds.
[ 8400.524594] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this
message.
[ 8400.524596] plasma-desktop  D ffff88013fc13bc0     0  4165      1 0x=
00000000
[ 8400.524600]  ffff880138782100 0000000000000086 0200000000020028
ffffffff81614400
[ 8400.524605]  0000000000013bc0 ffff880139d4dfd8 ffff880139d4dfd8
ffff880138782100
[ 8400.524610]  00000000fffffffd ffff8801392d4c60 ffff880138782100
ffff8801392d4c64
[ 8400.524615] Call Trace:
[ 8400.524620]  [<ffffffff813804f5>] ? __mutex_lock_common.isra.6+0x149=
/0x165
[ 8400.524625]  [<ffffffff81380320>] ? mutex_lock+0x1a/0x2d
[ 8400.524629]  [<ffffffff810c3947>] ? generic_file_aio_write+0x55/0xc9
[ 8400.524633]  [<ffffffff8110adcf>] ? do_sync_write+0x62/0x9b
[ 8400.524638]  [<ffffffff8110b376>] ? vfs_write+0x96/0xf8
[ 8400.524642]  [<ffffffff8110b59e>] ? sys_write+0x51/0x80
[ 8400.524647]  [<ffffffff81386d69>] ? system_call_fastpath+0x16/0x1b
[ 8400.524659] INFO: task nepomukservices:4232 blocked for more than 12=
0
seconds.
[ 8400.524661] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this
message.
[ 8400.524664] nepomukservices D ffff88013fd13bc0     0  4232   4227 0x=
00000000
[ 8400.524668]  ffff880108a92140 0000000000000082 ffff88013abcea00
ffff88013aeb4180
[ 8400.524673]  0000000000013bc0 ffff880104c37fd8 ffff880104c37fd8
ffff880108a92140
[ 8400.524677]  ffffffff81381a6d ffffc900108ae000 ffff880108a92140
ffff880138793c00
[ 8400.524682] Call Trace:
[ 8400.524687]  [<ffffffff81381a6d>] ? _raw_spin_lock_irqsave+0x14/0x35
[ 8400.524699]  [<ffffffffa0242d48>] ? queue_log_writer+0x7d/0xad [reis=
erfs]
[ 8400.524704]  [<ffffffff81064071>] ? try_to_wake_up+0x199/0x199
[ 8400.524716]  [<ffffffffa02475e1>] ? do_journal_begin_r+0x177/0x23e
[reiserfs]
[ 8400.524728]  [<ffffffffa024775d>] ? journal_begin+0xb5/0xec [reiserf=
s]
[ 8400.524740]  [<ffffffffa02313a3>] ? reiserfs_evict_inode+0x9a/0x137
[reiserfs]
[ 8400.524747]  [<ffffffff8111d937>] ? evict+0xa3/0x153
[ 8400.524752]  [<ffffffff8111aed7>] ? dentry_kill+0x10a/0x12b
[ 8400.524756]  [<ffffffff8111b349>] ? dput+0xe6/0xf3
[ 8400.524760]  [<ffffffff81112778>] ? path_put+0xd/0x16
[ 8400.524765]  [<ffffffff811392e3>] ? fsnotify_put_event+0x23/0x53
[ 8400.524770]  [<ffffffff8113b5fd>] ? inotify_read+0x209/0x290
[ 8400.524775]  [<ffffffff81057b5b>] ? abort_exclusive_wait+0x79/0x79
[ 8400.524779]  [<ffffffff8110b46b>] ? vfs_read+0x93/0xf5
[ 8400.524784]  [<ffffffff81118a73>] ? set_restore_sigmask+0x2d/0x2d
[ 8400.524788]  [<ffffffff8110b51e>] ? sys_read+0x51/0x80
[ 8400.524793]  [<ffffffff81386d69>] ? system_call_fastpath+0x16/0x1b
[ 8400.524800] INFO: task dolphin:4256 blocked for more than 120 second=
s.
[ 8400.524803] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this
message.
[ 8400.524805] dolphin         D ffff88013fd13bc0     0  4256   3791 0x=
00000000
[ 8400.524809]  ffff880124ff4080 0000000000000082 020000000002006c
ffff88013aeb4180
[ 8400.524814]  0000000000013bc0 ffff880104cddfd8 ffff880104cddfd8
ffff880124ff4080
[ 8400.524819]  0000000000000023 ffff8801392d4c60 ffff880124ff4080
ffff8801392d4c64
[ 8400.524823] Call Trace:
[ 8400.524829]  [<ffffffff813804f5>] ? __mutex_lock_common.isra.6+0x149=
/0x165
[ 8400.524834]  [<ffffffff81380320>] ? mutex_lock+0x1a/0x2d
[ 8400.524838]  [<ffffffff810c3947>] ? generic_file_aio_write+0x55/0xc9
[ 8400.524842]  [<ffffffff8110adcf>] ? do_sync_write+0x62/0x9b
[ 8400.524847]  [<ffffffff8110b376>] ? vfs_write+0x96/0xf8
[ 8400.524851]  [<ffffffff8110b59e>] ? sys_write+0x51/0x80
[ 8400.524856]  [<ffffffff81386d69>] ? system_call_fastpath+0x16/0x1b
[ 8400.524870] INFO: task virtuoso-t:4572 blocked for more than 120 sec=
onds.
[ 8400.524873] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this
message.
[ 8400.524875] virtuoso-t      D ffff88013fd13bc0     0  4572   4232 0x=
00000000
[ 8400.524879]  ffff8800ae54d0c0 0000000000000086 0000000000000000
ffff88013aeb4180
[ 8400.524884]  0000000000013bc0 ffff8800ae6c5fd8 ffff8800ae6c5fd8
ffff8800ae54d0c0
[ 8400.524889]  ffffffff81381a6d ffffc900108ae000 ffff8800ae54d0c0
ffff880138793c00
[ 8400.524893] Call Trace:
[ 8400.524898]  [<ffffffff81381a6d>] ? _raw_spin_lock_irqsave+0x14/0x35
[ 8400.524910]  [<ffffffffa0242d48>] ? queue_log_writer+0x7d/0xad [reis=
erfs]
[ 8400.524915]  [<ffffffff81064071>] ? try_to_wake_up+0x199/0x199
[ 8400.524927]  [<ffffffffa02475e1>] ? do_journal_begin_r+0x177/0x23e
[reiserfs]
[ 8400.524939]  [<ffffffffa024775d>] ? journal_begin+0xb5/0xec [reiserf=
s]
[ 8400.524949]  [<ffffffffa0230120>] ? reiserfs_create+0xcf/0x1eb [reis=
erfs]
[ 8400.524954]  [<ffffffff81114cf7>] ? vfs_create+0x62/0x8b
[ 8400.524958]  [<ffffffff811129f3>] ? lookup_dcache+0x22/0x95
[ 8400.524963]  [<ffffffff81115c39>] ? do_last+0x591/0xa0f
[ 8400.524968]  [<ffffffff81116178>] ? path_openat+0xc1/0x33b
[ 8400.524972]  [<ffffffff811166a9>] ? do_filp_open+0x2a/0x6e
[ 8400.524977]  [<ffffffff8111fc35>] ? __alloc_fd+0xdc/0xed
[ 8400.524981]  [<ffffffff8110aba4>] ? do_sys_open+0x5c/0xe0
[ 8400.524986]  [<ffffffff81386d69>] ? system_call_fastpath+0x16/0x1b
[ 8400.524994] INFO: task konqueror:14018 blocked for more than 120 sec=
onds.
[ 8400.524996] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this
message.
[ 8400.524999] konqueror       D ffff88013fd13bc0     0 14018   3791 0x=
00000000
[ 8400.525003]  ffff8801378aa180 0000000000000086 ffff8800aef4bc58
ffff88013aeb4180
[ 8400.525008]  0000000000013bc0 ffff8800aef4bfd8 ffff8800aef4bfd8
ffff8801378aa180
[ 8400.525012]  ffffffff81381a6d ffffc900108ae000 ffff8801378aa180
ffff880138793c00
[ 8400.525017] Call Trace:
[ 8400.525022]  [<ffffffff81381a6d>] ? _raw_spin_lock_irqsave+0x14/0x35
[ 8400.525034]  [<ffffffffa0242d48>] ? queue_log_writer+0x7d/0xad [reis=
erfs]
[ 8400.525039]  [<ffffffff81064071>] ? try_to_wake_up+0x199/0x199
[ 8400.525051]  [<ffffffffa02475e1>] ? do_journal_begin_r+0x177/0x23e
[reiserfs]
[ 8400.525055]  [<ffffffff81113447>] ? lookup_fast+0x39/0x211
[ 8400.525060]  [<ffffffff8114ed87>] ? dquot_active+0x28/0x50
[ 8400.525072]  [<ffffffffa024775d>] ? journal_begin+0xb5/0xec [reiserf=
s]
[ 8400.525082]  [<ffffffffa022f26a>] ? reiserfs_unlink+0x7c/0x24c [reis=
erfs]
[ 8400.525087]  [<ffffffff811208b0>] ? mntget+0x17/0x1c
[ 8400.525091]  [<ffffffff8111324e>] ? complete_walk+0x89/0xda
[ 8400.525096]  [<ffffffff81114424>] ? path_lookupat+0x6a/0x2b1
[ 8400.525100]  [<ffffffff810613a6>] ? should_resched+0x5/0x23
[ 8400.525104]  [<ffffffff81114e81>] ? vfs_unlink+0x63/0xbc
[ 8400.525109]  [<ffffffff81114fbc>] ? do_unlinkat+0xe2/0x18c
[ 8400.525113]  [<ffffffff8110edd9>] ? sys_newstat+0x25/0x2d
[ 8400.525118]  [<ffffffff81380ef1>] ? __schedule+0x4b2/0x4e0
[ 8400.525123]  [<ffffffff81386d69>] ? system_call_fastpath+0x16/0x1b
[ 8400.525131] INFO: task kworker/0:4:17879 blocked for more than 120 s=
econds.
[ 8400.525133] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this
message.
[ 8400.525135] kworker/0:4     D ffff88013fc13bc0     0 17879      2 0x=
00000000
[ 8400.525140]  ffff8800af5fb040 0000000000000046 ffff880139434584
ffff88013692f0c0
[ 8400.525145]  0000000000013bc0 ffff88009c389fd8 ffff88009c389fd8
ffff8800af5fb040
[ 8400.525149]  ffffffff81381a6d ffffc900108ae000 ffff8800af5fb040
ffff880138793c00
[ 8400.525154] Call Trace:
[ 8400.525158]  [<ffffffff81381a6d>] ? _raw_spin_lock_irqsave+0x14/0x35
[ 8400.525171]  [<ffffffffa0242d48>] ? queue_log_writer+0x7d/0xad [reis=
erfs]
[ 8400.525175]  [<ffffffff81064071>] ? try_to_wake_up+0x199/0x199
[ 8400.525187]  [<ffffffffa0246a55>] ? do_journal_end.isra.23+0x1ba/0xb=
cf
[reiserfs]
[ 8400.525199]  [<ffffffffa0238cd3>] ? reiserfs_sync_fs+0x40/0x5c [reis=
erfs]
[ 8400.525210]  [<ffffffffa0239de0>] ? flush_old_commits+0x1d/0x39 [rei=
serfs]
[ 8400.525216]  [<ffffffff810536ad>] ? process_one_work+0x16d/0x2c5
[ 8400.525220]  [<ffffffff813819f8>] ? _raw_spin_lock_irq+0xb/0x15
[ 8400.525232]  [<ffffffffa0239dc3>] ? reiserfs_freeze+0xc5/0xc5 [reise=
rfs]
[ 8400.525237]  [<ffffffff8105381d>] ? process_scheduled_works+0x18/0x2=
5
[ 8400.525241]  [<ffffffff81053ae2>] ? worker_thread+0x131/0x1b1
[ 8400.525246]  [<ffffffff810539b1>] ? rescuer_thread+0x187/0x187
[ 8400.525250]  [<ffffffff81057280>] ? kthread+0x81/0x89
[ 8400.525255]  [<ffffffff810571ff>] ? __kthread_parkme+0x5c/0x5c
[ 8400.525259]  [<ffffffff81386cbc>] ? ret_from_fork+0x7c/0xb0
[ 8400.525264]  [<ffffffff810571ff>] ? __kthread_parkme+0x5c/0x5c
[ 8400.525272] INFO: task kscreenlocker:19028 blocked for more than 120
seconds.
[ 8400.525274] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this
message.
[ 8400.525277] kscreenlocker   D ffff88013fd13bc0     0 19028   4230 0x=
00000000
[ 8400.525281]  ffff88013a3df8a0 0000000000000086 0200000000020028
ffff88013aeb4180
[ 8400.525286]  0000000000013bc0 ffff88012fc8dfd8 ffff88012fc8dfd8
ffff88013a3df8a0
[ 8400.525291]  0000000000000117 ffff8801392d4c60 ffff88013a3df8a0
ffff8801392d4c64
[ 8400.525295] Call Trace:
[ 8400.525301]  [<ffffffff813804f5>] ? __mutex_lock_common.isra.6+0x149=
/0x165
[ 8400.525306]  [<ffffffff81380320>] ? mutex_lock+0x1a/0x2d
[ 8400.525310]  [<ffffffff810c3947>] ? generic_file_aio_write+0x55/0xc9
[ 8400.525315]  [<ffffffff8110adcf>] ? do_sync_write+0x62/0x9b
[ 8400.525320]  [<ffffffff8110b376>] ? vfs_write+0x96/0xf8
[ 8400.525324]  [<ffffffff810613a6>] ? should_resched+0x5/0x23
[ 8400.525328]  [<ffffffff8110b59e>] ? sys_write+0x51/0x80
[ 8400.525332]  [<ffffffff81386d69>] ? system_call_fastpath+0x16/0x1b

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
