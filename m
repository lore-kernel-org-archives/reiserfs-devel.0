From: jose@huitzilopochtli.metztli-it.com (Metztli Information Technology)
Subject: Reiser4 Transparent-compression and Linux kernel 4.12.14 EOL
Date: Sun, 24 Sep 2017 04:31:30 -0700 (PDT)
Message-ID: <20170924113130.650A994E192@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1506252720; h=From: Date: Message-Id: To: Subject: Sender;
 bh=CUVHFGFA+0rdLMbyJFGuI2TFJmffwblycNA9pD2CAWI=; b=Q9F0U3mME3Tru7I8czgXuf+Lmw2Dr4bgTNM4KaIIyFBL+6+y4ry2WjTRKrxXGCBavSPm54MZ
 z4zzozgUMx6NVOeDxxY+am2YC/dQ+3pmgeSii6hKDT3WijGiuCZDwrpRwjY0wTBQlngy38ej
 qCu/oCjt/vZqBAc6mJJvrFFM3GM=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Niltze, Ed-

Here is some additional feedback on Debian stretch-backport'ed Linux kernel 4.12.14 EOL:

linux/debian/changelog top fragment below.

linux (4.12.14-2+reiser4.0.1) metztli; urgency=medium

  * Non-maintainer upload.
  * stretch-backports Reiser4, Software Format Release Number (SFRN) 4.0.1
  * Applied differential patches 4.12.12-13 and 4.12.13-14 to debian (last) packaging 4.12.12-2

 -- Metztli Information Technology <jose@metztli-it.com>  Wed, 20 Sep 2017 23:03:08 -0700

--------------end of fragment -----------------------

Still testing transparent-compression on 1.2TB reiser4 (SFRN) 4.0.1 root filesystem environment.

Same installation as reported (in recreated post for Twitter reiser4 promotion):
< https://metztli.it/blog/index.php/amatl/reiser-nahui/metztli-reiser4-successful-debian-stretch >

except upgraded to kernel referenced in subject.


I am using your last patch: reiser4-for-4.12.2.patch.gz

I have successfully built VirtualBox 5.1.28 with the headers generated with my current Debian kernel hack package:
< https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-Linux-4.12.14EOL_for-Stretch/ >

which I have used to create a couple of Debian VMs of some 400MB.

Issue description:

While using svn to fetch GCC-5, INFO summary of blocked tasks below introduced hiccups of 2 to 3 minutes.
I had firefox, chromium, and seamonkey, browsers open -- as well as Apache OpenOffice 4.1.4 and vi-clone elvis GUI text editor.

Desktop environment: Enlightenment E21 GUI manager and Terminology managing zsh instances.


INFO summary of blocked tasks:

[34680.372631] INFO: task Cache2 I/O:1738 blocked for more than 120 seconds.
[34680.373300] INFO: task localStorage DB:1816 blocked for more than 120 seconds.
[34680.373921] INFO: task mozStorage #4:1822 blocked for more than 120 seconds.
[34680.374333] INFO: task mozStorage #5:1827 blocked for more than 120 seconds.
[34680.374923] INFO: task SimpleCacheWork:7848 blocked for more than 120 seconds.
[34680.375453] INFO: task mozStorage #1:7969 blocked for more than 120 seconds.
[34680.375996] INFO: task mozStorage #3:7978 blocked for more than 120 seconds.
[34680.376647] INFO: task svn:2509 blocked for more than 120 seconds.


please see below for details:


[ 8892.495156] perf: interrupt took too long (3167 > 3126), lowering kernel.perf_event_max_sample_rate to 63000
[13485.210900] perf: interrupt took too long (3959 > 3958), lowering kernel.perf_event_max_sample_rate to 50500
[22505.233194] perf: interrupt took too long (4961 > 4948), lowering kernel.perf_event_max_sample_rate to 40250
[34680.372631] INFO: task Cache2 I/O:1738 blocked for more than 120 seconds.
[34680.372644]       Not tainted 4.12.0-2+reiser4.0.1-amd64 #1 Debian 4.12.14-2+reiser4.0.1
[34680.372647] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[34680.372652] Cache2 I/O      D    0  1738   1663 0x00000000
[34680.372659] Call Trace:
[34680.372675]  ? __schedule+0x3c5/0x850
[34680.372680]  ? schedule+0x32/0x80
[34680.372721]  ? reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[34680.372729]  ? remove_wait_queue+0x60/0x60
[34680.372761]  ? capture_fuse_wait.part.28+0x228/0x240 [reiser4]
[34680.372789]  ? atom_can_be_committed.part.14+0x10/0x10 [reiser4]
[34680.372816]  ? reiser4_try_capture+0x55b/0xc00 [reiser4]
[34680.372841]  ? capture_assign_txnh_nolock+0x53/0x80 [reiser4]
[34680.372867]  ? longterm_lock_znode+0x161/0x4f0 [reiser4]
[34680.372896]  ? traverse_tree+0x821/0xa50 [reiser4]
[34680.372921]  ? longterm_lock_znode+0x486/0x4f0 [reiser4]
[34680.372945]  ? lock_object+0x96/0x100 [reiser4]
[34680.372971]  ? cbk_cache_search+0xc6/0x2e0 [reiser4]
[34680.372996]  ? coord_by_key+0xdd/0xf0 [reiser4]
[34680.373032]  ? find_cluster_item.constprop.69+0x2dd/0x430 [reiser4]
[34680.373065]  ? save_plugin_sd.part.5+0x3f/0xf0 [reiser4]
[34680.373093]  ? reiser4_grab+0x48/0xc0 [reiser4]
[34680.373124]  ? find_disk_cluster+0x130/0x3a0 [reiser4]
[34680.373153]  ? prepare_logical_cluster+0x35d/0x880 [reiser4]
[34680.373180]  ? set_window_and_cluster+0x9c/0x130 [reiser4]
[34680.373205]  ? do_write_cryptcompress+0x380/0x690 [reiser4]
[34680.373211]  ? down_read+0xe/0x30
[34680.373238]  ? write_cryptcompress+0x6d/0xb0 [reiser4]
[34680.373265]  ? reiser4_write_dispatch+0xf2/0x4f0 [reiser4]
[34680.373272]  ? vfs_statx+0x73/0xe0
[34680.373279]  ? vfs_write+0xb0/0x190
[34680.373282]  ? SyS_write+0x52/0xc0
[34680.373288]  ? system_call_fast_compare_end+0xc/0x97
[34680.373300] INFO: task localStorage DB:1816 blocked for more than 120 seconds.
[34680.373305]       Not tainted 4.12.0-2+reiser4.0.1-amd64 #1 Debian 4.12.14-2+reiser4.0.1
[34680.373308] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[34680.373311] localStorage DB D    0  1816   1663 0x00000000
[34680.373316] Call Trace:
[34680.373321]  ? __schedule+0x3c5/0x850
[34680.373325]  ? schedule+0x32/0x80
[34680.373351]  ? reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[34680.373355]  ? remove_wait_queue+0x60/0x60
[34680.373383]  ? capture_fuse_wait.part.28+0x228/0x240 [reiser4]
[34680.373409]  ? atom_can_be_committed.part.14+0x10/0x10 [reiser4]
[34680.373435]  ? reiser4_try_capture+0x55b/0xc00 [reiser4]
[34680.373464]  ? lookup_node40+0x298/0x460 [reiser4]
[34680.373490]  ? longterm_lock_znode+0x161/0x4f0 [reiser4]
[34680.373517]  ? cbk_node_lookup+0x127/0x380 [reiser4]
[34680.373542]  ? traverse_tree+0x821/0xa50 [reiser4]
[34680.373565]  ? find_child_delimiting_keys+0xef/0x110 [reiser4]
[34680.373588]  ? traverse_tree+0x73d/0xa50 [reiser4]
[34680.373610]  ? cbk_cache_search+0xc6/0x2e0 [reiser4]
[34680.373634]  ? coord_by_key+0xdd/0xf0 [reiser4]
[34680.373656]  ? cbk_cache_search+0xc6/0x2e0 [reiser4]
[34680.373687]  ? find_cluster_item.constprop.69+0x2dd/0x430 [reiser4]
[34680.373715]  ? save_plugin_sd.part.5+0x3f/0xf0 [reiser4]
[34680.373743]  ? reiser4_grab+0x48/0xc0 [reiser4]
[34680.373770]  ? find_disk_cluster+0x130/0x3a0 [reiser4]
[34680.373796]  ? prepare_logical_cluster+0x35d/0x880 [reiser4]
[34680.373822]  ? set_window_and_cluster+0x9c/0x130 [reiser4]
[34680.373846]  ? do_write_cryptcompress+0x380/0x690 [reiser4]
[34680.373873]  ? write_cryptcompress+0x6d/0xb0 [reiser4]
[34680.373900]  ? reiser4_write_dispatch+0xf2/0x4f0 [reiser4]
[34680.373907]  ? vfs_write+0xb0/0x190
[34680.373910]  ? SyS_write+0x52/0xc0
[34680.373916]  ? system_call_fast_compare_end+0xc/0x97
[34680.373921] INFO: task mozStorage #4:1822 blocked for more than 120 seconds.
[34680.373925]       Not tainted 4.12.0-2+reiser4.0.1-amd64 #1 Debian 4.12.14-2+reiser4.0.1
[34680.373928] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[34680.373931] mozStorage #4   D    0  1822   1663 0x00000000
[34680.373935] Call Trace:
[34680.373940]  ? __schedule+0x3c5/0x850
[34680.373944]  ? schedule+0x32/0x80
[34680.373969]  ? reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[34680.373973]  ? remove_wait_queue+0x60/0x60
[34680.374001]  ? capture_fuse_wait.part.28+0x228/0x240 [reiser4]
[34680.374028]  ? atom_can_be_committed.part.14+0x10/0x10 [reiser4]
[34680.374054]  ? reiser4_try_capture+0x55b/0xc00 [reiser4]
[34680.374080]  ? longterm_lock_znode+0x453/0x4f0 [reiser4]
[34680.374109]  ? reiser4_seal_validate+0x60/0xe0 [reiser4]
[34680.374140]  ? update_sd+0x16d/0x470 [reiser4]
[34680.374169]  ? write_sd_by_inode_common+0x8c/0x90 [reiser4]
[34680.374200]  ? reiser4_dirty_inode+0x3e/0xd0 [reiser4]
[34680.374205]  ? __mark_inode_dirty+0x165/0x340
[34680.374210]  ? generic_update_time+0x7b/0xd0
[34680.374214]  ? current_time+0x38/0x70
[34680.374218]  ? touch_atime+0xab/0xd0
[34680.374223]  ? generic_file_read_iter+0x7ee/0x950
[34680.374231]  ? new_sync_read+0xd7/0x120
[34680.374261]  ? read_unix_file+0x445/0x4d0 [reiser4]
[34680.374287]  ? read_cryptcompress+0x7c/0xa0 [reiser4]
[34680.374314]  ? reiser4_read_dispatch+0x59/0x130 [reiser4]
[34680.374320]  ? vfs_read+0x91/0x130
[34680.374323]  ? SyS_read+0x52/0xc0
[34680.374329]  ? system_call_fast_compare_end+0xc/0x97
[34680.374333] INFO: task mozStorage #5:1827 blocked for more than 120 seconds.
[34680.374337]       Not tainted 4.12.0-2+reiser4.0.1-amd64 #1 Debian 4.12.14-2+reiser4.0.1
[34680.374340] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[34680.374343] mozStorage #5   D    0  1827   1663 0x00000000
[34680.374347] Call Trace:
[34680.374352]  ? __schedule+0x3c5/0x850
[34680.374355]  ? __schedule+0x3cd/0x850
[34680.374359]  ? schedule+0x32/0x80
[34680.374384]  ? reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[34680.374388]  ? remove_wait_queue+0x60/0x60
[34680.374416]  ? capture_fuse_wait.part.28+0x228/0x240 [reiser4]
[34680.374442]  ? atom_can_be_committed.part.14+0x10/0x10 [reiser4]
[34680.374468]  ? reiser4_try_capture+0x55b/0xc00 [reiser4]
[34680.374494]  ? longterm_lock_znode+0x161/0x4f0 [reiser4]
[34680.374521]  ? traverse_tree+0x821/0xa50 [reiser4]
[34680.374545]  ? longterm_lock_znode+0x486/0x4f0 [reiser4]
[34680.374569]  ? lock_object+0x96/0x100 [reiser4]
[34680.374595]  ? cbk_cache_search+0xc6/0x2e0 [reiser4]
[34680.374619]  ? coord_by_key+0xdd/0xf0 [reiser4]
[34680.374650]  ? find_cluster_item.constprop.69+0x2dd/0x430 [reiser4]
[34680.374679]  ? save_plugin_sd.part.5+0x3f/0xf0 [reiser4]
[34680.374685]  ? intel_pstate_update_pstate.part.5+0x21/0x30
[34680.374691]  ? intel_pstate_adjust_pstate+0xa5/0x1e0
[34680.374718]  ? reiser4_grab+0x48/0xc0 [reiser4]
[34680.374745]  ? find_disk_cluster+0x130/0x3a0 [reiser4]
[34680.374771]  ? prepare_logical_cluster+0x35d/0x880 [reiser4]
[34680.374797]  ? set_window_and_cluster+0x9c/0x130 [reiser4]
[34680.374821]  ? do_write_cryptcompress+0x380/0x690 [reiser4]
[34680.374847]  ? write_cryptcompress+0x6d/0xb0 [reiser4]
[34680.374874]  ? reiser4_write_dispatch+0xf2/0x4f0 [reiser4]
[34680.374881]  ? vfs_write+0xb0/0x190
[34680.374884]  ? SyS_write+0x52/0xc0
[34680.374890]  ? system_call_fast_compare_end+0xc/0x97
[34680.374923] INFO: task SimpleCacheWork:7848 blocked for more than 120 seconds.
[34680.374927]       Not tainted 4.12.0-2+reiser4.0.1-amd64 #1 Debian 4.12.14-2+reiser4.0.1
[34680.374930] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[34680.374933] SimpleCacheWork D    0  7848   1663 0x00000000
[34680.374937] Call Trace:
[34680.374941]  ? __schedule+0x3c5/0x850
[34680.374945]  ? schedule+0x32/0x80
[34680.374970]  ? reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[34680.374975]  ? remove_wait_queue+0x60/0x60
[34680.375002]  ? capture_fuse_wait.part.28+0x228/0x240 [reiser4]
[34680.375029]  ? atom_can_be_committed.part.14+0x10/0x10 [reiser4]
[34680.375054]  ? reiser4_try_capture+0x55b/0xc00 [reiser4]
[34680.375079]  ? lock_object+0x96/0x100 [reiser4]
[34680.375104]  ? longterm_lock_znode+0x161/0x4f0 [reiser4]
[34680.375126]  ? zlook+0x15/0x70 [reiser4]
[34680.375150]  ? longterm_unlock_znode+0xbf/0x2a0 [reiser4]
[34680.375176]  ? traverse_tree+0x821/0xa50 [reiser4]
[34680.375202]  ? cbk_node_lookup+0x44/0x380 [reiser4]
[34680.375225]  ? cbk_cache_search+0xc6/0x2e0 [reiser4]
[34680.375250]  ? reiser4_object_lookup+0x151/0x160 [reiser4]
[34680.375272]  ? cbk_cache_search+0x1d0/0x2e0 [reiser4]
[34680.375303]  ? reiser4_find_entry+0xaf/0x330 [reiser4]
[34680.375330]  ? reiser4_lookup_name+0x8d/0x140 [reiser4]
[34680.375362]  ? reiser4_lookup_common+0x63/0x140 [reiser4]
[34680.375367]  ? lookup_slow+0xa3/0x170
[34680.375371]  ? walk_component+0x1c0/0x350
[34680.375375]  ? path_init+0x1bd/0x300
[34680.375379]  ? path_lookupat+0x73/0x220
[34680.375383]  ? filename_lookup+0xb8/0x1a0
[34680.375392]  ? futex_wake+0x94/0x170
[34680.375397]  ? __check_object_size+0xb3/0x18e
[34680.375403]  ? strncpy_from_user+0x48/0x160
[34680.375408]  ? vfs_statx+0x73/0xe0
[34680.375412]  ? vfs_statx+0x73/0xe0
[34680.375418]  ? SYSC_newlstat+0x39/0x70
[34680.375421]  ? SyS_futex+0x7a/0x170
[34680.375424]  ? SyS_write+0x76/0xc0
[34680.375430]  ? system_call_fast_compare_end+0xc/0x97
[34680.375453] INFO: task mozStorage #1:7969 blocked for more than 120 seconds.
[34680.375457]       Not tainted 4.12.0-2+reiser4.0.1-amd64 #1 Debian 4.12.14-2+reiser4.0.1
[34680.375460] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[34680.375463] mozStorage #1   D    0  7969   1663 0x00000000
[34680.375467] Call Trace:
[34680.375472]  ? __schedule+0x3c5/0x850
[34680.375476]  ? schedule+0x32/0x80
[34680.375501]  ? reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[34680.375505]  ? remove_wait_queue+0x60/0x60
[34680.375533]  ? capture_fuse_wait.part.28+0x228/0x240 [reiser4]
[34680.375560]  ? atom_can_be_committed.part.14+0x10/0x10 [reiser4]
[34680.375585]  ? reiser4_try_capture+0x55b/0xc00 [reiser4]
[34680.375611]  ? longterm_lock_znode+0x161/0x4f0 [reiser4]
[34680.375636]  ? traverse_tree+0x821/0xa50 [reiser4]
[34680.375660]  ? longterm_lock_znode+0x486/0x4f0 [reiser4]
[34680.375684]  ? lock_object+0x96/0x100 [reiser4]
[34680.375708]  ? cbk_cache_search+0xc6/0x2e0 [reiser4]
[34680.375732]  ? coord_by_key+0xdd/0xf0 [reiser4]
[34680.375763]  ? find_cluster_item.constprop.69+0x2dd/0x430 [reiser4]
[34680.375791]  ? save_plugin_sd.part.5+0x3f/0xf0 [reiser4]
[34680.375819]  ? reiser4_grab+0x48/0xc0 [reiser4]
[34680.375846]  ? find_disk_cluster+0x130/0x3a0 [reiser4]
[34680.375872]  ? prepare_logical_cluster+0x35d/0x880 [reiser4]
[34680.375898]  ? set_window_and_cluster+0x9c/0x130 [reiser4]
[34680.375922]  ? do_write_cryptcompress+0x380/0x690 [reiser4]
[34680.375948]  ? write_cryptcompress+0x6d/0xb0 [reiser4]
[34680.375975]  ? reiser4_write_dispatch+0xf2/0x4f0 [reiser4]
[34680.375982]  ? vfs_write+0xb0/0x190
[34680.375985]  ? SyS_write+0x52/0xc0
[34680.375991]  ? system_call_fast_compare_end+0xc/0x97
[34680.375996] INFO: task mozStorage #3:7978 blocked for more than 120 seconds.
[34680.376000]       Not tainted 4.12.0-2+reiser4.0.1-amd64 #1 Debian 4.12.14-2+reiser4.0.1
[34680.376003] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[34680.376006] mozStorage #3   D    0  7978   1663 0x00000000
[34680.376010] Call Trace:
[34680.376015]  ? __schedule+0x3c5/0x850
[34680.376019]  ? schedule+0x32/0x80
[34680.376044]  ? reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[34680.376048]  ? remove_wait_queue+0x60/0x60
[34680.376075]  ? capture_fuse_wait.part.28+0x228/0x240 [reiser4]
[34680.376102]  ? atom_can_be_committed.part.14+0x10/0x10 [reiser4]
[34680.376127]  ? reiser4_try_capture+0x55b/0xc00 [reiser4]
[34680.376153]  ? cbk_cache_add+0xa0/0xd0 [reiser4]
[34680.376179]  ? capture_assign_txnh_nolock+0x53/0x80 [reiser4]
[34680.376204]  ? longterm_lock_znode+0x161/0x4f0 [reiser4]
[34680.376229]  ? traverse_tree+0x821/0xa50 [reiser4]
[34680.376253]  ? longterm_lock_znode+0x486/0x4f0 [reiser4]
[34680.376277]  ? lock_object+0x96/0x100 [reiser4]
[34680.376301]  ? cbk_cache_search+0xc6/0x2e0 [reiser4]
[34680.376325]  ? coord_by_key+0xdd/0xf0 [reiser4]
[34680.376356]  ? find_cluster_item.constprop.69+0x2dd/0x430 [reiser4]
[34680.376384]  ? save_plugin_sd.part.5+0x3f/0xf0 [reiser4]
[34680.376390]  ? intel_pstate_update_pstate.part.5+0x21/0x30
[34680.376395]  ? intel_pstate_adjust_pstate+0xa5/0x1e0
[34680.376422]  ? reiser4_grab+0x48/0xc0 [reiser4]
[34680.376450]  ? find_disk_cluster+0x130/0x3a0 [reiser4]
[34680.376476]  ? prepare_logical_cluster+0x35d/0x880 [reiser4]
[34680.376534]  ? set_window_and_cluster+0x9c/0x130 [reiser4]
[34680.376558]  ? do_write_cryptcompress+0x380/0x690 [reiser4]
[34680.376595]  ? write_cryptcompress+0x6d/0xb0 [reiser4]
[34680.376612]  ? reiser4_write_dispatch+0xf2/0x4f0 [reiser4]
[34680.376619]  ? vfs_write+0xb0/0x190
[34680.376628]  ? SyS_write+0x52/0xc0
[34680.376634]  ? system_call_fast_compare_end+0xc/0x97
[34680.376647] INFO: task svn:2509 blocked for more than 120 seconds.
[34680.376654]       Not tainted 4.12.0-2+reiser4.0.1-amd64 #1 Debian 4.12.14-2+reiser4.0.1
[34680.376659] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[34680.376665] svn             D    0  2509   5552 0x00000000
[34680.376672] Call Trace:
[34680.376677]  ? __schedule+0x3c5/0x850
[34680.376683]  ? schedule+0x32/0x80
[34680.376700]  ? reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[34680.376706]  ? remove_wait_queue+0x60/0x60
[34680.376723]  ? capture_fuse_wait.part.28+0x228/0x240 [reiser4]
[34680.376741]  ? atom_can_be_committed.part.14+0x10/0x10 [reiser4]
[34680.376759]  ? reiser4_try_capture+0x55b/0xc00 [reiser4]
[34680.376765]  ? update_group_capacity+0x23/0x1e0
[34680.376771]  ? cpumask_next_and+0x26/0x40
[34680.376788]  ? longterm_lock_znode+0x453/0x4f0 [reiser4]
[34680.376806]  ? cbk_cache_search+0x10f/0x2e0 [reiser4]
[34680.376825]  ? coord_by_key+0xb1/0xf0 [reiser4]
[34680.376844]  ? find_cluster_item.constprop.69+0x2dd/0x430 [reiser4]
[34680.376852]  ? __add_to_page_cache_locked+0xf5/0x1f0
[34680.376870]  ? reiser4_grab+0x48/0xc0 [reiser4]
[34680.376888]  ? find_disk_cluster+0x130/0x3a0 [reiser4]
[34680.376907]  ? prepare_logical_cluster+0x35d/0x880 [reiser4]
[34680.376924]  ? set_window_and_cluster+0x9c/0x130 [reiser4]
[34680.376940]  ? do_write_cryptcompress+0x380/0x690 [reiser4]
[34680.376948]  ? tcp_v4_do_rcv+0x12f/0x1d0
[34680.376966]  ? write_cryptcompress+0x6d/0xb0 [reiser4]
[34680.376983]  ? reiser4_write_dispatch+0xf2/0x4f0 [reiser4]
[34680.376991]  ? vfs_write+0xb0/0x190
[34680.376996]  ? SyS_write+0x52/0xc0
[34680.377002]  ? exit_to_usermode_loop+0x61/0xc0
[34680.377007]  ? system_call_fast_compare_end+0xc/0x97


Best Professional Regards.
