From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: namei.c problem
Date: Sat, 9 May 2009 12:44:41 +0100 (WEST)
Message-ID: <2701.87.196.232.177.1241869481.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi there,
Testing 2.6.30-rc5, i have this on a VMWare VM:
If any more info is needed just say.
Jorge,


------------[ cut here ]------------
WARNING: at fs/namei.c:1251 warn_slowpath_null+0x10/0x15()
Hardware name: VMware Virtual Platform
Modules linked in:
Pid: 1, comm: swapper Not tainted 2.6.30-rc5 #1
Call Trace:
 [<c011d6b2>] warn_slowpath_fmt+0x72/0x88
 [<c0221415>] ? notify_update+0x22/0x24
 [<c0221628>] ? vt_console_print+0x211/0x21f
 [<c0221417>] ? vt_console_print+0x0/0x21f
 [<c011d7c0>] ? __call_console_drivers+0x57/0x64
 [<c012fe3a>] ? up+0x2b/0x2f
 [<c011db38>] ? release_console_sem+0x168/0x195
 [<c01a87e4>] ? prepare_error_buf+0x38c/0x3e3
 [<c016074a>] ? cache_alloc_refill+0x60/0x18d
 [<c011d6d8>] warn_slowpath_null+0x10/0x15
 [<c016aba6>] lookup_one_len+0x30/0x9a
 [<c01b6911>] reiserfs_xattr_init+0x5d/0x198
 [<c01a79a8>] reiserfs_fill_super+0x950/0xa43
 [<c017453d>] ? mntput_no_expire+0x1c/0xed
 [<c01d9766>] ? string+0x33/0x7f
 [<c01da162>] ? vsnprintf+0x597/0x5d4
 [<c01da205>] ? snprintf+0x15/0x17
 [<c0194c06>] ? disk_name+0x5c/0x69
 [<c0165ae5>] get_sb_bdev+0xe2/0x127
 [<c01a5ccf>] get_super_block+0x13/0x15
 [<c01a7058>] ? reiserfs_fill_super+0x0/0xa43
 [<c0164c9d>] vfs_kern_mount+0x3b/0x76
 [<c0164d1d>] do_kern_mount+0x33/0xb9
 [<c0175ab3>] do_mount+0x610/0x649
 [<c015e4ff>] ? alloc_pages_current+0x51/0xaa
 [<c01446c4>] ? __get_free_pages+0x16/0x1c
 [<c0175b56>] sys_mount+0x6a/0xa8
 [<c0399b9c>] mount_block_root+0xab/0x1fa
 [<c016c116>] ? sys_mknod+0x13/0x15
 [<c0399d37>] mount_root+0x4c/0x54
 [<c0399e47>] prepare_namespace+0x108/0x12f
 [<c03995ae>] kernel_init+0x13e/0x14d
 [<c0399470>] ? kernel_init+0x0/0x14d
 [<c010324f>] kernel_thread_helper+0x7/0x10
---[ end trace b429f1f67b756378 ]---


