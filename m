From: Michael Buesch <mbuesch@freenet.de>
Subject: Two "maybe" related problems
Date: Tue, 18 May 2004 16:57:25 +0200
Message-ID: <200405181657.48868.mbuesch@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18748-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I had a reiser4 partition.
While it was mounted, I deleted the partition with
cfdisk (yes, blame on me ;)
Then I rebooted the machine. I got the following oops
on booting (That's my first problem):

May 18 17:11:07 lfs kernel: Resume Machine: disabled
May 18 17:11:07 lfs kernel: found reiserfs format "3.6" with standard journ=
al
May 18 17:11:07 lfs kernel: Reiserfs journal params: device hda6, size 8192=
, journal first block 18, max trans len 1024, max batch 900, max commit age=
 30, max trans age 30
May 18 17:11:07 lfs kernel: reiserfs: checking transaction log (hda6) for (=
hda6)
May 18 17:11:07 lfs kernel: Using r5 hash to sort names
May 18 17:11:07 lfs kernel: VFS: Mounted root (reiserfs filesystem) readonl=
y.
May 18 17:11:07 lfs kernel: Freeing unused kernel memory: 152k freed
May 18 17:11:07 lfs kernel: Unable to find swap-space signature
May 18 17:11:07 lfs kernel: EXT2-fs warning: mounting unchecked fs, running=
 e2fsck is recommended
May 18 17:11:07 lfs kernel: attempt to access beyond end of device
May 18 17:11:07 lfs kernel: hda13: rw=3D0, want=3D6023432, limit=3D5859441
(hda13 was the reiser4 partition, before I deleted it.
Here my bootscript tries to boot the non-existing partition)
May 18 17:11:07 lfs kernel: Unable to handle kernel NULL pointer dereferenc=
e at virtual address 00000000
May 18 17:11:07 lfs kernel:  printing eip:
May 18 17:11:07 lfs kernel: c01a86fe
May 18 17:11:07 lfs kernel: *pde =3D 00000000
May 18 17:11:07 lfs kernel: Oops: 0000 [#1]
May 18 17:11:07 lfs kernel: PREEMPT=20
May 18 17:11:07 lfs kernel: CPU:    0
May 18 17:11:07 lfs kernel: EIP:    0060:[<c01a86fe>]    Not tainted
May 18 17:11:07 lfs kernel: EFLAGS: 00010206   (2.6.5)=20
May 18 17:11:07 lfs kernel: EIP is at znodes_tree_done+0x21/0x1eb
May 18 17:11:07 lfs kernel: eax: 00000000   ebx: dfd13014   ecx: 00000000  =
 edx: dfd13014
May 18 17:11:07 lfs kernel: esi: 00002000   edi: 00000000   ebp: dfd13038  =
 esp: df923d58
May 18 17:11:07 lfs kernel: ds: 007b   es: 007b   ss: 0068
May 18 17:11:07 lfs kernel: Process mount (pid: 37, threadinfo=3Ddf922000 t=
ask=3Ddf9472e0)
May 18 17:11:07 lfs kernel: Stack: 00000000 dfd13014 dfd16200 df923d9c 0000=
0000 c01b058b dfd13014 dfd13014=20
May 18 17:11:07 lfs kernel:        c01cb25f dfd13014 0000000c fffffffb c01c=
b537 dfd16200 df923d9c df89d000=20
May 18 17:11:07 lfs kernel:        00000000 4b1b5d0b 00000000 00000001 df92=
3da8 df923da8 df923db0 df923db0=20
May 18 17:11:07 lfs kernel: Call Trace:
May 18 17:11:07 lfs kernel:  [<c01b058b>] done_tree+0x3e/0x67
May 18 17:11:07 lfs kernel:  [<c01cb25f>] _done_formatted_fake+0x25/0x3e
May 18 17:11:07 lfs kernel:  [<c01cb537>] reiser4_fill_super+0x5e/0x7d
May 18 17:11:07 lfs kernel:  [<c0153913>] sb_set_blocksize+0x1f/0x45
May 18 17:11:07 lfs kernel:  [<c0153325>] get_sb_bdev+0xef/0x145
May 18 17:11:07 lfs kernel:  [<c01674ff>] alloc_vfsmnt+0x93/0xce
May 18 17:11:07 lfs kernel:  [<c01c56a4>] reiser4_get_sb+0x2f/0x33
May 18 17:11:07 lfs kernel:  [<c01cb4d9>] reiser4_fill_super+0x0/0x7d
May 18 17:11:07 lfs kernel:  [<c015357b>] do_kern_mount+0x5b/0xe1
May 18 17:11:07 lfs kernel:  [<c01688ba>] do_mount+0x570/0x765
May 18 17:11:07 lfs kernel:  [<c0192608>] remove_save_link+0xbe/0xe8
May 18 17:11:07 lfs kernel:  [<c015aaa3>] __user_walk+0x5c/0x72
May 18 17:11:07 lfs kernel:  [<c0136a27>] __alloc_pages+0xb9/0x364
May 18 17:11:07 lfs kernel:  [<c01682d1>] copy_mount_options+0x7d/0xf6
May 18 17:11:07 lfs kernel:  [<c0168e64>] sys_mount+0xc2/0x137
May 18 17:11:07 lfs kernel:  [<c01063dd>] sysenter_past_esp+0x52/0x71
May 18 17:11:07 lfs kernel:=20
May 18 17:11:07 lfs kernel: Code: 8b 3c 81 85 ff 75 07 83 c0 01 39 c6 77 f2=
 31 c0 85 ff 89 fa=20


Now, I ignored it and continued booting.
I wanted to create a new reiserfs-3.6 filesystem on the already
exiting hda8. I fired up mkreiserfs:

root@lfs:~> mkreiserfs /dev/hda8
mkreiserfs 3.6.11 (2003 www.namesys.com)

A pair of credits:
Joshua Macdonald wrote the first draft of the transaction manager. Yuri Rup=
asov
did testing  and benchmarking,  plus he invented the r5 hash  (also used by=
 the
dcache  code).  Yura  Rupasov,  Anatoly Pinchuk,  Igor Krasheninnikov,  Gri=
gory
Zaigralin,  Mikhail  Gilula,   Igor  Zagorovsky,  Roman  Pozlevich,  Konsta=
ntin
Shvachko, and Joshua MacDonald are former contributors to the project.

Oleg Drokin was the debugger for  V3 during most of the time that  V4 was u=
nder
development,  and was quite  skilled and fast at it.  He wrote  the large w=
rite
optimization of V3.

Guessing about desired format.. Kernel 2.6.5 is running.
=46ormat 3.6 with standard journal
Count of blocks on the device: 732430
Number of blocks consumed by mkreiserfs formatting process: 8234
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: dd3f1273-77a2-4a25-9289-384ba5a723e8
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
        ALL DATA WILL BE LOST ON '/dev/hda8'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..


mkreiserfs is stuck in unkillable D state at this point.
(That's my second problem).


Kernel is 2.6.5 with reiser4 snapshot 2004.03.26
Please CC: me, as I'm not subscribed to this list.

=2D --=20
Regards Michael Buesch  [ http://www.tuxsoft.de.vu ]

=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAqiRqFGK1OIvVOP4RAnDRAKDTBq/AhGQe23gnXEfp4h2eDYgi7wCgk4An
ZT5P3f2CyF/mLiSPbrxt7Gs=3D
=3DtUh1
=2D----END PGP SIGNATURE-----
