From: Arend Freije <afreije@inn.nl>
Subject: RAID-1 and Reiser4 issue: umount hangs
Date: Mon, 29 May 2006 22:17:05 +0200
Message-ID: <447B56C1.80608@inn.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm using Reiser4 for my filesystems on disk (/dev/sda) , and it works
just fine. Recently I bought a second disk (/dev/sdb) for RAID-1
mirroring. With mdadm I created a degraded raid-1 array  on /dev/md/0,
devices missing,/dev/sdb1. After that I created a Reiser4 filesystem on
/dev/md/0 and mounted it at /mnt. Then I copied the data from /dev/sda1
to /mnt.
All goes well until I umount /mnt, umount simply hangs without any
error. Syslog doesn't report any error. In /proc/mdstat, the array
remains "active sync". Shutting down linux fails because the umount is
still waiting and seems to block other umounts. The umount process
cannot be killed by the root. A hard reset is the only resolution to get
my system functioning normally, but without the raid-1 of course.
The problem seems to emerge only with the combination of RAID and
Reiser4.  I've created an ext-2 filesystem on /dev/md/0, and after that
mount ; cp -ax ; umount works without  a problem, and the hanging umount
re-appears when using Reiser4 again.

My questions:
- how can I find the cause of the hanging umount?
- how can I fix it?

A few details of my linux-box:

Gentoo Linux, 2.6.16 kernel with Reiser4-for-2.6.16-2.patch.gz
i686 AMD Athlon(tm) XP 2400+
DC4300 SATA-II controller (Silicon Image 3124, libata + sata_sil24 drivers)
2 x Samsung SP2504C hard disk

I've posted this issue to the linux-kernel mailing list, but Neil Brown
wrote:

> This looks very much like a reiser4 problem rather than a raid
> problem, or at least you will need someone very familiar with reiser4
> to understand what is going on here.
> 

So here's my post.
The call trace of the hanging umount is the following:

> syslog-ng     R running     0  7581      1                7197 (NOTLB)
> umount        D C011B591     0  7588   7200                     (NOTLB)
> f6643c98 00000000 c1808320 c011b591 f7db5ad0 f4d18c00 003d092a 00000000
> 00000000 f7db5ad0 c1808320 00000000 f4d18c00 003d092a f6b33540 c1808320
> 00000000 f4d18c00 003d092a f6b33540 f6b33668 c1808320 00000000 f6643cfc
> Call Trace:
> [<c011b591>] __wake_up_common+0x41/0x70
> [<c0318346>] io_schedule+0x26/0x30
> [<c01469fb>] sync_page+0x4b/0x60
> [<c03184d5>] __wait_on_bit+0x45/0x70
> [<c01469b0>] sync_page+0x0/0x60
> [<c014726d>] wait_on_page_bit+0xad/0xc0
> [<c0136a30>] wake_bit_function+0x0/0x60
> [<c0136a30>] wake_bit_function+0x0/0x60
> [<c01ac2f9>] jwait_io+0x59/0x80
> [<c01c1763>] update_journal_header+0x83/0xb0
> [<c01c272a>] commit_tx+0xca/0x110
> [<c01c29a1>] reiser4_write_logs+0x141/0x1e0
> [<c01b9d91>] commit_current_atom+0x171/0x2c0
> [<c01baabf>] try_commit_txnh+0x13f/0x1e0
> [<c01bab94>] commit_txnh+0x34/0xd0
> [<c01b91bc>] txn_end+0x2c/0x30
> [<c01b91d0>] txn_restart+0x10/0x30
> [<c01b920a>] txn_restart_current+0x1a/0x20
> [<c01b9f1f>] force_commit_atom+0x3f/0x70
> [<c01ba03a>] txnmgr_force_commit_all+0xea/0x130
> [<c01fcb0e>] release_format40+0x7e/0x150
> [<c01b5ea8>] init_context+0x58/0x80
> [<c01c8b89>] reiser4_put_super+0x89/0xf0
> [<c01857ed>] invalidate_inodes+0x5d/0x80
> [<c0170fb6>] generic_shutdown_super+0x156/0x160
> [<c0171b2d>] kill_block_super+0x2d/0x50
> [<c0170d90>] deactivate_super+0x60/0x80
> [<c0188e1f>] sys_umount+0x3f/0x90
> [<c01171b0>] do_page_fault+0x1c0/0x5a8
> [<c0159bc1>] sys_munmap+0x51/0x80
> [<c0188e87>] sys_oldumount+0x17/0x20
> [<c010306b>] sysenter_past_esp+0x54/0x75


Thanx in advance,

Arend



