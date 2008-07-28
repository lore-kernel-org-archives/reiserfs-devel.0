From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/plugin/item/ctail.c
Date: Mon, 28 Jul 2008 18:13:40 +0400
Message-ID: <488DD414.4020409@gmail.com>
References: <558.1643-7112-806549272-1217237371@post.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070000020101000201090805"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <558.1643-7112-806549272-1217237371@post.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: "Mr. Tao" <tao@post.cz>
Cc: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070000020101000201090805
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mr. Tao wrote:
> Hi Edward,
>
>   

Hello.

> I tried to post this through gmane at reiserfs list but somehow I couldn't manage. Perhaps you might find it usefull.
>
>   

Yes, this is an interesting oops that has never occurred before.
The situation is clear: page is not uptodate and disk cluster is
"unprepped".

In accordance with Reiser4 design, unprepped disk clusters are allowed to
be written to disk, however the transactions remain active, as unprepped
dick cluster should be replaced with compressed data. If such replacement
is failed for some reasons (for example, system crash), then the changes
should be rolled back when replaying journal. So, normally, the kernel
shouldn't meet unprepped disk clusters in usual working sessions (when
servicing system calls).

However in this case we can see that journal was not replayed (properly),
so I would ask you to recall (if possible) in what circumstances did this
problem happen.

The attached patch will allow you to avoid unnecessary oopses in future.

Also we have encountered a problem that fsck can not handle unprepped
disk clusters properly. There is nothing criminal in having them on
disk, but
the correct solution is to cut them as "dead" metadata. So I'll try to
fix fsck to
handle them properly. Now live with kernel warnings ("edward-1570") for a
while.. Ok?

Thanks,
Edward.

> This is what i got on fres new install running zen 2.6.26-rc8-zen1.0
>
> System is gentoo amd64 on Pentium 4 with 2.5 GB RAM.
>
> FS is accessible and system boots off it, but when fscking it, fsck.reiser4 exits prematurely with signal 11. This happens on 2 (root and portage) partitions of three I have running R4. It's no different if I fsck it from SystemRescueCD.
>
> [  674.044908] ------------[ cut here ]------------
> [  674.044908] kernel BUG at fs/reiser4/plugin/item/ctail.c:672!
> [  674.044908] invalid opcode: 0000 [1] PREEMPT SMP
> [  674.044908] CPU 0
> [  674.044908] Modules linked in: libafs(P) lm85 hwmon_vid snd_pcm_oss snd_mixer_oss fuse parport_pc parport snd_hda_intel snd_pcm snd_timer snd soundcore i2c_i801 snd_page_alloc fglrx(P)
> [  674.044908] Pid: 8848, comm: svn Tainted: P          2.6.26-rc8-zen1.0-makalinux #2
> [  674.044908] RIP: 0010:[<ffffffff80331437>]  [<ffffffff80331437>] do_readpage_ctail+0x30b/0x40a
> [  674.044908] RSP: 0018:ffff8100641ef9e8  EFLAGS: 00010246
> [  674.044908] RAX: 00000000000003b0 RBX: 0000000000000000 RCX: 0000000000000000
> [  674.044908] RDX: 00000000000003b0 RSI: 00000000000003b0 RDI: 0000000000000000
> [  674.044908] RBP: 00000000000003b0 R08: 0000000000000020 R09: ffff810063cfd5f0
> [  674.044908] R10: ffff8100641efae8 R11: ffffffff80329807 R12: ffffe20001a4a598
> [  674.044908] R13: 0000000000000002 R14: ffff8100641efae8 R15: ffff810063cfd5f0
> [  674.044908] FS:  00007f37d91ba740(0000) GS:ffffffff80816000(0000) knlGS:0000000000000000
> [  674.044908] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [  674.044908] CR2: 00000030df60bd61 CR3: 00000000641e7000 CR4: 00000000000006e0
> [  674.044908] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  674.044908] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> [  674.044908] Process svn (pid: 8848, threadinfo ffff8100641ee000, task ffff8100738385a0)
> [  674.044908] Stack:  ffffffff8089c380 0000000080325578 ffff810063cfd5f0 ffff810073544500
> [  674.044908]  0000000100000001 ffffe20001a4a598 ffff8100641efae8 0000000000000000
> [  674.044908]  0000000000000000 0000000000000000 0000000000000000 ffffffff803316d0
> [  674.044908] Call Trace:
> [  674.044908]  [<ffffffff803316d0>] ? ctail_readpages_filler+0x19a/0x1f2
> [  674.044908]  [<ffffffff80272cc9>] ? lru_cache_add+0x66/0x84
> [  674.044908]  [<ffffffff80331536>] ? ctail_readpages_filler+0x0/0x1f2
> [  674.044908]  [<ffffffff802720ea>] ? read_cache_pages+0x70/0x93
> [  674.044908]  [<ffffffff80331124>] ? readpages_ctail+0x33b/0x343
> [  674.044908]  [<ffffffff80324b14>] ? readpages_cryptcompress+0x3b/0x64
> [  674.044908]  [<ffffffff80271f0e>] ? __do_page_cache_readahead+0x142/0x1cf
> [  674.044908]  [<ffffffff802722af>] ? ondemand_readahead+0x1a2/0x1b4
> [  674.044908]  [<ffffffff8026ca83>] ? generic_file_aio_read+0x1d0/0x4d1
> [  674.044908]  [<ffffffff8029247a>] ? do_sync_read+0xce/0x113
> [  674.044908]  [<ffffffff80601c4d>] ? _spin_unlock_irqrestore+0x12/0x2d
> [  674.044908]  [<ffffffff80243144>] ? autoremove_wake_function+0x0/0x2e
> [  674.044908]  [<ffffffff80290fd7>] ? __dentry_open+0x198/0x281
> [  674.044908]  [<ffffffff80601cd5>] ? _spin_unlock+0x10/0x2a
> [  674.044908]  [<ffffffff80308a57>] ? reiser4_grab+0x97/0xa1
> [  674.044908]  [<ffffffff80324756>] ? read_cryptcompress+0x6d/0x96
> [  674.044908]  [<ffffffff80323085>] ? reiser4_read_careful+0xc9/0x121
> [  674.044908]  [<ffffffff80292dc5>] ? vfs_read+0xaa/0x132
> [  674.044908]  [<ffffffff80292f09>] ? sys_read+0x45/0x6e
> [  674.044908]  [<ffffffff8020b25b>] ? system_call_after_swapgs+0x7b/0x80
> [  674.044908]
> [  674.044908]
> [  674.044908] Code: 00 00 45 8b ae 88 00 00 00 41 83 fd 01 0f 84 84 00 00 00 41 83 fd 02 74 12 41 8d 45 fd 45 31 ed 83 f8 01 0f 87 de 00 00 00 eb 04 <0f> 0b eb fe bf 01 00 00 00 e8 34 32 2d 00 48 bf 00 00 00 00 00
> [  674.044908] RIP  [<ffffffff80331437>] do_readpage_ctail+0x30b/0x40a
> [  674.044908]  RSP <ffff8100641ef9e8>
> [  674.045313] ---[ end trace 6d41c2445da53cc4 ]---
> [  674.045778] reiser4[svn(8848)]: release_unix_file (fs/reiser4/plugin/file/file.c:2365)[vs-44]:
> [  674.045781] WARNING: out of memory?
> [  739.980542] evolution[8886]: segfault at 8 ip 7f37f5b9f46e sp 42620fa0 error 4 in libcamelimap.so[7f37f5b8c000+1f000]
> [  829.478811] evolution[8974]: segfault at 8 ip 7ff8c08e346e sp 42599fa0 error 4 in libcamelimap.so[7ff8c08d0000+1f000]
> [  936.087105] afs: byte-range lock/unlock ignored; make sure no one else is running this program.
> [ 1076.022618] afs: byte-range lock/unlock ignored; make sure no one else is running this program.
> [ 1389.091485] afs: byte-range lock/unlock ignored; make sure no one else is running this program.
> [ 2091.023477] afs: byte-range lock/unlock ignored; make sure no one else is running this program.
> [ 2983.204399] afs: byte-range lock/unlock ignored; make sure no one else is running this program.
> [ 3110.586708] ------------[ cut here ]------------
> [ 3110.586708] kernel BUG at fs/reiser4/plugin/item/ctail.c:672!
> [ 3110.586708] invalid opcode: 0000 [2] PREEMPT SMP
> [ 3110.586708] CPU 0
> [ 3110.586708] Modules linked in: libafs(P) lm85 hwmon_vid snd_pcm_oss snd_mixer_oss fuse parport_pc parport snd_hda_intel snd_pcm snd_timer snd soundcore i2c_i801 snd_page_alloc fglrx(P)
> [ 3110.586708] Pid: 10078, comm: paludis Tainted: P      D   2.6.26-rc8-zen1.0-makalinux #2
> [ 3110.586708] RIP: 0010:[<ffffffff80331437>]  [<ffffffff80331437>] do_readpage_ctail+0x30b/0x40a
> [ 3110.586708] RSP: 0018:ffff810057d619e8  EFLAGS: 00010246
> [ 3110.586708] RAX: 0000000000000265 RBX: 0000000000000000 RCX: 0000000000000000
> [ 3110.586708] RDX: 0000000000000265 RSI: 0000000000000265 RDI: 0000000000000000
> [ 3110.586708] RBP: 0000000000000265 R08: 0000000000000018 R09: ffff810069e6d970
> [ 3110.586708] R10: ffff810057d61ae8 R11: ffffffff80329807 R12: ffffe20001363ea8
> [ 3110.586708] R13: 0000000000000002 R14: ffff810057d61ae8 R15: ffff810069e6d970
> [ 3110.586708] FS:  00007f1ec34df700(0000) GS:ffffffff80816000(0000) knlGS:0000000000000000
> [ 3110.586708] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 3110.586708] CR2: 0000000001bd4328 CR3: 0000000057d7a000 CR4: 00000000000006e0
> [ 3110.586708] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 3110.586708] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> [ 3110.586708] Process paludis (pid: 10078, threadinfo ffff810057d60000, task ffff81007383a1c0)
> [ 3110.586708] Stack:  ffff810057d61c88 0000000080325578 ffff810069e6d970 ffff8100570a0880
> [ 3110.586708]  0000000100000001 ffffe20001363ea8 ffff810057d61ae8 0000000000000000
> [ 3110.586708]  0000000000000000 0000000000000000 0000000000000000 ffffffff803316d0
> [ 3110.586708] Call Trace:
> [ 3110.586708]  [<ffffffff803316d0>] ? ctail_readpages_filler+0x19a/0x1f2
> [ 3110.586708]  [<ffffffff80272cc9>] ? lru_cache_add+0x66/0x84
> [ 3110.586708]  [<ffffffff80331536>] ? ctail_readpages_filler+0x0/0x1f2
> [ 3110.586708]  [<ffffffff802720ea>] ? read_cache_pages+0x70/0x93
> [ 3110.586708]  [<ffffffff80331124>] ? readpages_ctail+0x33b/0x343
> [ 3110.586708]  [<ffffffff80324b14>] ? readpages_cryptcompress+0x3b/0x64
> [ 3110.586708]  [<ffffffff80271f0e>] ? __do_page_cache_readahead+0x142/0x1cf
> [ 3110.586708]  [<ffffffff802722af>] ? ondemand_readahead+0x1a2/0x1b4
> [ 3110.586708]  [<ffffffff8026ca83>] ? generic_file_aio_read+0x1d0/0x4d1
> [ 3110.586708]  [<ffffffff8029247a>] ? do_sync_read+0xce/0x113
> [ 3110.586708]  [<ffffffff8027adf0>] ? handle_mm_fault+0x6cf/0x6ec
> [ 3110.586708]  [<ffffffff80243144>] ? autoremove_wake_function+0x0/0x2e
> [ 3110.586708]  [<ffffffff80604254>] ? do_page_fault+0x505/0x8b6
> [ 3110.586708]  [<ffffffff80601cd5>] ? _spin_unlock+0x10/0x2a
> [ 3110.586708]  [<ffffffff80308a57>] ? reiser4_grab+0x97/0xa1
> [ 3110.586708]  [<ffffffff80324756>] ? read_cryptcompress+0x6d/0x96
> [ 3110.586708]  [<ffffffff80323085>] ? reiser4_read_careful+0xc9/0x121
> [ 3110.586708]  [<ffffffff80292dc5>] ? vfs_read+0xaa/0x132
> [ 3110.586708]  [<ffffffff80292f09>] ? sys_read+0x45/0x6e
> [ 3110.586708]  [<ffffffff8020b25b>] ? system_call_after_swapgs+0x7b/0x80
> [ 3110.586708]
> [ 3110.586708]
> [ 3110.586708] Code: 00 00 45 8b ae 88 00 00 00 41 83 fd 01 0f 84 84 00 00 00 41 83 fd 02 74 12 41 8d 45 fd 45 31 ed 83 f8 01 0f 87 de 00 00 00 eb 04 <0f> 0b eb fe bf 01 00 00 00 e8 34 32 2d 00 48 bf 00 00 00 00 00
> [ 3110.586708] RIP  [<ffffffff80331437>] do_readpage_ctail+0x30b/0x40a
> [ 3110.586708]  RSP <ffff810057d619e8>
> [ 3110.586708] ---[ end trace 6d41c2445da53cc4 ]---
> [ 3127.017668] afs: byte-range lock/unlock ignored; make sure no one else is running this program.
> [ 3238.628906] gvfs-fuse-daemo[6459]: segfault at 3000000000 ip 30dde0b237 sp 7fff3e975c98 error 6 in libpthread-2.8.so[30dde00000+16000]
> [ 3247.321819] mtrr: type mismatch for d8000000,8000000 old: write-back new: write-combining
> [ 3247.321831] [fglrx:firegl_addmap] *ERROR* mtrr allocation failed (-22)
> [ 3247.324921] [fglrx] Reserved FB block: Shared offset:0, size:40000
> [ 3247.324929] [fglrx] Reserved FB block: Unshared offset:7fbf000, size:40000
> [ 3247.324937] [fglrx] Reserved FB block: Unshared offset:7fff000, size:1000
> [ 3384.566804] ------------[ cut here ]------------
> [ 3384.566934] kernel BUG at fs/reiser4/plugin/item/ctail.c:672!
> [ 3384.567059] invalid opcode: 0000 [3] PREEMPT SMP
> [ 3384.567268] CPU 0
> [ 3384.567285] Modules linked in: libafs(P) lm85 hwmon_vid snd_pcm_oss snd_mixer_oss fuse parport_pc parport snd_hda_intel snd_pcm snd_timer snd soundcore i2c_i801 snd_page_alloc fglrx(P)
> [ 3384.567285] Pid: 10666, comm: reconcilio Tainted: P      D   2.6.26-rc8-zen1.0-makalinux #2
> [ 3384.567285] RIP: 0010:[<ffffffff80331437>]  [<ffffffff80331437>] do_readpage_ctail+0x30b/0x40a
> [ 3384.567285] RSP: 0018:ffff81007241d9e8  EFLAGS: 00010246
> [ 3384.567285] RAX: 0000000000000005 RBX: 0000000000000000 RCX: 0000000000000000
> [ 3384.567285] RDX: 0000000000001000 RSI: 0000000000005ddc RDI: 0000000000000005
> [ 3384.567285] RBP: 0000000000001000 R08: 0000000000000018 R09: ffff8100669e3570
> [ 3384.567285] R10: ffff81007241dae8 R11: ffffffff80329807 R12: ffffe20001e7f798
> [ 3384.567285] R13: 0000000000000002 R14: ffff81007241dae8 R15: ffff8100669e3570
> [ 3384.567285] FS:  00007fc18ba33700(0000) GS:ffffffff80816000(0000) knlGS:0000000000000000
> [ 3384.567285] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 3384.567285] CR2: 00007fc18ad39058 CR3: 00000000614b1000 CR4: 00000000000006e0
> [ 3384.567285] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 3384.567285] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> [ 3384.567285] Process reconcilio (pid: 10666, threadinfo ffff81007241c000, task ffff81007383e540)
> [ 3384.567285] Stack:  0000000000000000 0000000080325578 ffff8100669e3570 ffff810073544c00
> [ 3384.567285]  0000000100000006 ffffe20001e7f798 ffff81007241dae8 0000000000000000
> [ 3384.567285]  0000000000000000 0000000000000000 0000000000000000 ffffffff803316d0
> [ 3384.567285] Call Trace:
> [ 3384.567285]  [<ffffffff803316d0>] ? ctail_readpages_filler+0x19a/0x1f2
> [ 3384.567285]  [<ffffffff80272cc9>] ? lru_cache_add+0x66/0x84
> [ 3384.567285]  [<ffffffff80331536>] ? ctail_readpages_filler+0x0/0x1f2
> [ 3384.567285]  [<ffffffff802720ea>] ? read_cache_pages+0x70/0x93
> [ 3384.567285]  [<ffffffff80331124>] ? readpages_ctail+0x33b/0x343
> [ 3384.567285]  [<ffffffff80324b14>] ? readpages_cryptcompress+0x3b/0x64
> [ 3384.567285]  [<ffffffff80271f0e>] ? __do_page_cache_readahead+0x142/0x1cf
> [ 3384.567285]  [<ffffffff802722af>] ? ondemand_readahead+0x1a2/0x1b4
> [ 3384.567285]  [<ffffffff8026ca83>] ? generic_file_aio_read+0x1d0/0x4d1
> [ 3384.567285]  [<ffffffff8029247a>] ? do_sync_read+0xce/0x113
> [ 3384.567285]  [<ffffffff80601c4d>] ? _spin_unlock_irqrestore+0x12/0x2d
> [ 3384.567285]  [<ffffffff80243144>] ? autoremove_wake_function+0x0/0x2e
> [ 3384.567285]  [<ffffffff80290fd7>] ? __dentry_open+0x198/0x281
> [ 3384.567285]  [<ffffffff80601cd5>] ? _spin_unlock+0x10/0x2a
> [ 3384.567285]  [<ffffffff80308a57>] ? reiser4_grab+0x97/0xa1
> [ 3384.567285]  [<ffffffff80324756>] ? read_cryptcompress+0x6d/0x96
> [ 3384.567285]  [<ffffffff80323085>] ? reiser4_read_careful+0xc9/0x121
> [ 3384.567285]  [<ffffffff80292dc5>] ? vfs_read+0xaa/0x132
> [ 3384.567285]  [<ffffffff80292f09>] ? sys_read+0x45/0x6e
> [ 3384.567285]  [<ffffffff8020b25b>] ? system_call_after_swapgs+0x7b/0x80
> [ 3384.567285]
> [ 3384.567285]
> [ 3384.567285] Code: 00 00 45 8b ae 88 00 00 00 41 83 fd 01 0f 84 84 00 00 00 41 83 fd 02 74 12 41 8d 45 fd 45 31 ed 83 f8 01 0f 87 de 00 00 00 eb 04 <0f> 0b eb fe bf 01 00 00 00 e8 34 32 2d 00 48 bf 00 00 00 00 00
> [ 3384.567285] RIP  [<ffffffff80331437>] do_readpage_ctail+0x30b/0x40a
> [ 3384.567285]  RSP <ffff81007241d9e8>
> [ 3384.576749] ---[ end trace 6d41c2445da53cc4 ]---
>
>   


--------------070000020101000201090805
Content-Type: text/x-patch;
 name="reiser4-use-warning-instead-of-bugon.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-use-warning-instead-of-bugon.patch"

do_readpage_ctail():
Fixup in handling the case when page is not uptodate and
disk cluster is unprepped:
. fill the page with zeroes;
. replace BUG_ON(1) with warning and suggestion to run fsck.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 linux-2.6.25-mm1/fs/reiser4/plugin/item/ctail.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletion(-)


--- linux-2.6.25-mm1/fs/reiser4/plugin/item/ctail.c.orig
+++ linux-2.6.25-mm1/fs/reiser4/plugin/item/ctail.c
@@ -669,7 +669,9 @@
 
 	switch (clust->dstat) {
 	case UNPR_DISK_CLUSTER:
-		BUG_ON(1);
+		warning("edward-1570",
+                        "Inode %llu : Invalid disk cluster (%lu). Fsck?",
+			(unsigned long long)get_inode_oid(inode), clust->index);
 	case TRNC_DISK_CLUSTER:
 		/*
 		 * Race with truncate!

--------------070000020101000201090805--
