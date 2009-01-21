From: Eric Sesterhenn <snakebyte@gmx.de>
Subject: Panic with corrupted reiserfs image
Date: Wed, 21 Jan 2009 10:03:26 +0100
Message-ID: <20090121090325.GB24169@alice>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: robm@fastmail.fm, carlos@fisica.ufpr.br

Mounting the corrupted image at
http://www.cccmz.de/~snakebyte/reiserfs.23.img.bck.bz2
results in a panic

[  290.056469] Pid: 5947, comm: mount Not tainted
2.6.29-rc2-00021-gd84d31c #216
[  290.056650] Call Trace:
[  290.056832]  [<c01f486c>] reiserfs_panic+0x22/0x42
[  290.056974]  [<c0200fe8>] journal_init+0x4b0/0x861
[  290.057211]  [<c0141486>] ? trace_hardirqs_on_caller+0x11c/0x15a
[  290.057368]  [<c04f82d6>] ? vsprintf+0x10/0x12
[  290.057528]  [<c01f47ca>] ? prepare_error_buf+0x3a0/0x3a8
[  290.057675]  [<c0182ce5>] ? __vmalloc_area_node+0xbf/0xda
[  290.057851]  [<c012476a>] ? printk+0x1a/0x1c
[  290.057985]  [<c01f482f>] ? reiserfs_info+0x37/0x52
[  290.058200]  [<c01f30b1>] reiserfs_fill_super+0x349/0xc58
[  290.058342]  [<c0142c7a>] ? __lock_acquire+0x6a8/0x6fe
[  290.058517]  [<c0107084>] ? native_sched_clock+0x41/0x68
[  290.058657]  [<c04f831f>] ? snprintf+0x1b/0x1d
[  290.058828]  [<c01919c5>] get_sb_bdev+0xf1/0x13f
[  290.058972]  [<c0178896>] ? kstrdup+0x2f/0x51
[  290.059182]  [<c01f0c8b>] get_super_block+0x18/0x1a
[  290.059321]  [<c01f2d68>] ? reiserfs_fill_super+0x0/0xc58
[  290.059485]  [<c019159c>] vfs_kern_mount+0x40/0x7b
[  290.059624]  [<c0191625>] do_kern_mount+0x37/0xbf
[  290.059794]  [<c01a2cb0>] do_mount+0x5cc/0x609
[  290.059934]  [<c07b087b>] ? lock_kernel+0x19/0x8c
[  290.060142]  [<c01a2d43>] ? sys_mount+0x56/0xa0
[  290.060275]  [<c01a2d56>] sys_mount+0x69/0xa0
[  290.060432]  [<c0102ea1>] sysenter_do_call+0x12/0x31
[  290.060569] Kernel panic - not syncing: <0>REISERFS: panic (device
loop0): sh-464: bad blocksize (1024)
[  290.060575] 

Greetings, Eric
