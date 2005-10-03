From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Bug with reiser3 and quota in 2.6.12?
Date: Mon, 03 Oct 2005 18:53:34 +0400
Message-ID: <434145EE.5010502@namesys.com>
References: <20051003141006.GA4295@hex.no>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020704030307050507060101"
Return-path: <reiserfs-list-return-26385-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051003141006.GA4295@hex.no>
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?ISO-8859-1?Q?J=F8rgen_Hermanrud_Fjeld?= <jhf@hex.no>
Cc: reiserfs-list@namesys.com

--------------020704030307050507060101
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello

J=F8rgen Hermanrud Fjeld wrote:
> Hi!=20
> I'm posting this BUG on the reiserfs list, as I presume it is a
> reiser3/quota bug. If this is not the proper manner of reporting this=20
> bug, please advice me.
>=20
> I have a production server that suddenly experience problems with=20
> reiser3 and quota enabled.
> The server is running the latest 2.6.12 kernel offered by Debian.
> I=20
> I have not been able to locate the conditions of the error, but the
> server has been running stable for many months, so it seems likely the
> error is related to quota handling when limits are reached.
> The error is repeatable, and processes using files on the mountpoint hang.
> reiserfsck does not report any errors on the partition.
> When the filesystem is mounted without user and group quota, no crash
> occurs.=20
> In the error log, dm-3 is the problematic (/home) partition that
> procmail is accessing.
>=20
> The crash log reported from the kernel is:
> ##########################################
> Oct  1 16:19:36 ramaya kernel: ReiserFS: dm-3: warning: PAP-5660: reiserf=
s_do_truncate: wrong result -1 of search for [8 135167768 0xfffffffffffffff=
 DIRECT]
> Oct  1 16:19:36 ramaya kernel: ReiserFS: dm-2: warning: clm-2100: nesting=
 info a different FS

The attached patch should eliminate clm-2100 warning and probably will make
reiserfs to not crash after PAP-5660.
However, PAP-5660 indicates that file with inode number 135167768 in direct=
ory
with inode number 8 is corrupted.
Try to remove it or rename it so that it does not get accessed.

> Oct  1 16:19:36 ramaya kernel: ------------[ cut here ]------------
> Oct  1 16:19:36 ramaya kernel: SMP=20
> Oct  1 16:19:36 ramaya kernel: Modules linked in: nfsd exportfs lockd sun=
rpc lp af_packet ipv6 sch_ingress cls_u32 sch_sfq sch_htb ipt_TOS ipt_MASQU=
ERADE ipt_REJECT ipt_LOG ipt_state ipt_pkttype ipt_recent ipt_iprange ipt_p=
hysdev ipt_multiport ipt_conntrack iptable_mangle ip_nat_irc ip_nat_ftp ipt=
able_nat ip_conntrack_irc ip_conntrack_ftp ip_conntrack iptable_filter ip_t=
ables evdev pcspkr rtc floppy parport_pc parport pci_hotplug serverworks id=
e_core i2c_piix4 i2c_core sworks_agp agpgart st sym53c8xx ohci_hcd usbcore =
e100 mii quota_v2 reiserfs isofs vfat fat ext2 ext3 jbd mbcache dm_mod DAC9=
60 unix fbcon tileblit font bitblit vesafb cfbcopyarea cfbimgblt cfbfillrec=
t softcursor capability commoncap aic7xxx scsi_transport_spi scsi_mod
> Oct  1 16:19:36 ramaya kernel: CPU:    0
> Oct  1 16:19:36 ramaya kernel: EIP:    0060:[pg0+945613644/1069663232]   =
 Not tainted VLI
> Oct  1 16:19:36 ramaya kernel: EFLAGS: 00010246   (2.6.12-1-686-smp)=20
> Oct  1 16:19:36 ramaya kernel: EIP is at reiserfs_get_block+0x118c/0x14d0=
 [reiserfs]
> Oct  1 16:19:36 ramaya kernel: eax: 00000000   ebx: 00000000   ecx: 00000=
001   edx: 00000001
> Oct  1 16:19:36 ramaya kernel: esi: 00000000   edi: f724ca00   ebp: 00000=
003   esp: ed369bcc
> Oct  1 16:19:36 ramaya kernel: ds: 007b   es: 007b   ss: 0068
> Oct  1 16:19:36 ramaya kernel: Process procmail (pid: 5915, threadinfo=3D=
ed368000 task=3Def514ac0)
> Oct  1 16:19:36 ramaya kernel: Stack: ee7c20fc 00000000 00000044 efdbd0b0=
 00270008 00000000 00001000 00000000=20
> Oct  1 16:19:36 ramaya kernel:        c016532f 00270008 000002b8 0000001e=
 00000001 0000002c 00000061 00000001=20
> Oct  1 16:19:36 ramaya kernel:        c15cb060 00000001 00000000 ee7c20ac=
 c15cb060 00000000 c02fec80 c02ff484=20
> Oct  1 16:19:36 ramaya kernel: Call Trace:
> Oct  1 16:19:36 ramaya kernel:  [__find_get_block+207/288] __find_get_blo=
ck+0xcf/0x120
> Oct  1 16:19:36 ramaya kernel:  [cache_init_objs+116/160] cache_init_objs=
+0x74/0xa0
> Oct  1 16:19:36 ramaya kernel:  [cache_grow+307/464] cache_grow+0x133/0x1=
d0
> Oct  1 16:19:36 ramaya kernel:  [alloc_buffer_head+62/80] alloc_buffer_he=
ad+0x3e/0x50
> Oct  1 16:19:36 ramaya kernel:  [alloc_page_buffers+128/208] alloc_page_b=
uffers+0x80/0xd0
> Oct  1 16:19:36 ramaya kernel:  [create_empty_buffers+73/160] create_empt=
y_buffers+0x49/0xa0
> Oct  1 16:19:36 ramaya kernel:  [__block_prepare_write+714/1232] __block_=
prepare_write+0x2ca/0x4d0
> Oct  1 16:19:36 ramaya kernel:  [radix_tree_insert+267/320] radix_tree_in=
sert+0x10b/0x140
> Oct  1 16:19:36 ramaya kernel:  [add_to_page_cache+185/224] add_to_page_c=
ache+0xb9/0xe0
> Oct  1 16:19:36 ramaya kernel:  [block_prepare_write+49/64] block_prepare=
_write+0x31/0x40
> Oct  1 16:19:36 ramaya kernel:  [pg0+945609152/1069663232] reiserfs_get_b=
lock+0x0/0x14d0 [reiserfs]
> Oct  1 16:19:36 ramaya kernel:  [pg0+945609152/1069663232] reiserfs_get_b=
lock+0x0/0x14d0 [reiserfs]
> Oct  1 16:19:36 ramaya kernel:  [pg0+945626492/1069663232] reiserfs_prepa=
re_write+0x7c/0x190 [reiserfs]
> Oct  1 16:19:36 ramaya kernel:  [pg0+945609152/1069663232] reiserfs_get_b=
lock+0x0/0x14d0 [reiserfs]
> Oct  1 16:19:36 ramaya kernel:  [generic_cont_expand+206/448] generic_con=
t_expand+0xce/0x1c0
> Oct  1 16:19:36 ramaya kernel:  [pg0+945638699/1069663232] reiserfs_check=
_for_tail_and_convert+0x16b/0x240 [reiserfs]
> Oct  1 16:19:36 ramaya kernel:  [pg0+945642160/1069663232] reiserfs_file_=
write+0x340/0x750 [reiserfs]
> Oct  1 16:19:36 ramaya kernel:  [dput+232/480] dput+0xe8/0x1e0
> Oct  1 16:19:36 ramaya kernel:  [__d_lookup+269/288] __d_lookup+0x10d/0x1=
20
> Oct  1 16:19:36 ramaya kernel:  [in_group_p+67/144] in_group_p+0x43/0x90
> Oct  1 16:19:36 ramaya kernel:  [permission+210/288] permission+0xd2/0x120
> Oct  1 16:19:36 ramaya kernel:  [may_open+116/704] may_open+0x74/0x2c0
> Oct  1 16:19:36 ramaya kernel:  [__posix_lock_file+399/1504] __posix_lock=
_file+0x18f/0x5e0
> Oct  1 16:19:36 ramaya kernel:  [open_namei+148/1744] open_namei+0x94/0x6=
d0
> Oct  1 16:19:36 ramaya kernel:  [get_empty_filp+145/288] get_empty_filp+0=
x91/0x120
> Oct  1 16:19:36 ramaya kernel:  [file_move+32/96] file_move+0x20/0x60
> Oct  1 16:19:36 ramaya kernel:  [fcntl_setlk64+174/656] fcntl_setlk64+0xa=
e/0x290
> Oct  1 16:19:36 ramaya kernel:  [vfs_write+210/352] vfs_write+0xd2/0x160
> Oct  1 16:19:36 ramaya kernel:  [sys_write+75/128] sys_write+0x4b/0x80
> Oct  1 16:19:36 ramaya kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Oct  1 16:19:36 ramaya kernel: Code: 7c 24 0c 89 54 24 04 89 0c 24 e8 f0 =
ec ff ff 85 c0 89 c3 0f 85 c4 fa ff ff 8b 8c 24 34 01 00 00 8b b9 a0 00 00 =
00 e9 14 f0 ff ff <0f> 0b d3 06 52 59 9d f8 b8 01 00 00 00 89 44 24 40 e9 4=
8 ef ff=20
> ##########################################
>=20


--------------020704030307050507060101
Content-Type: text/plain;
 name="reiserfs-add-missing-journal_end.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-add-missing-journal_end.patch"


This patch adds missing calls to journal_end on error handling code paths.


 fs/reiserfs/inode.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletion(-)

diff -puN fs/reiserfs/inode.c~reiserfs-add-missing-journal_end fs/reiserfs/inode.c
--- linux-2.6.11.10/fs/reiserfs/inode.c~reiserfs-add-missing-journal_end	2005-07-27 18:03:06.197544430 +0400
+++ linux-2.6.11.10-vs/fs/reiserfs/inode.c	2005-07-27 18:04:07.363047159 +0400
@@ -46,6 +46,7 @@ void reiserfs_delete_inode (struct inode
 	reiserfs_update_inode_transaction(inode) ;
 
 	if (reiserfs_delete_object (&th, inode)) {
+	    journal_end(&th, inode->i_sb, jbegin_count);
 	    up (&inode->i_sem);
 	    goto out;
 	}
@@ -2015,8 +2016,10 @@ int reiserfs_truncate_file(struct inode 
 	       either appears truncated properly or not truncated at all */
 	add_save_link (&th, p_s_inode, 1);
     error = reiserfs_do_truncate (&th, p_s_inode, page, update_timestamps) ;
-    if (error)
+    if (error) {
+	journal_end (&th, p_s_inode->i_sb, JOURNAL_PER_BALANCE_CNT * 2 + 1);
         goto out;
+    }
     error = journal_end (&th, p_s_inode->i_sb, JOURNAL_PER_BALANCE_CNT * 2 + 1);
     if (error)
         goto out;

_

--------------020704030307050507060101--
