From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiser4 on PowerPC, oops and more
Date: Mon, 25 Oct 2004 16:10:34 +0400
Message-ID: <200410251532.48369.vitaly@namesys.com>
References: <87acuufed6.wl@pitr.ping.uio.no> <1097509160.4803.149.camel@tribesman.namesys.com> <87hdoj96mn.fsf@ping.uio.no>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_60OfBfL1owuO2CR"
Return-path: <reiserfs-list-return-22170-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87hdoj96mn.fsf@ping.uio.no>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Carl Henrik Lunde <chlunde+reiser@ping.uio.no>, Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--Boundary-00=_60OfBfL1owuO2CR
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Carl, 

would you try this patch for the reiser4progs, it swaps Stat Data 
extention mask and SD extentions should be reachable now.

-- 
Thanks,
Vitaly Fertman

On Monday 25 October 2004 00:57, Carl Henrik Lunde wrote:
> Vladimir Saveliev <vs@namesys.com> writes:
> > Would you please send us what do
> >
> > debugfs.reiser4
> > and
> > debugfs.reiser4 -t
> >
> > output?
>
> (This is from 1.0.2, made with mkfs.reiser4 -f -o key=key_short (I
> forgot to enable long keys in the kernel)):
>
> pitr ~ > /usr/local/sbin/debugfs.reiser4 img-from-ia32
> /usr/local/sbin/debugfs.reiser4 1.0.2
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           149457d7-c308-48e3-8dda-a6c9b3000000
> label:          <none>
>
> Format super block (17):
> plugin:         format40
> description:    Disk-format for reiser4.
> magic:          ReIsEr40FoRmAt
> flushes:        0
> mkfs id:        0x484b7b0a
> blocks:         32
> free blocks:    7
> root block:     23
> tail policy:    0x2 (smart)
> next oid:       0x10000
> file count:     0
> tree height:    2
> key policy:     SHORT
>
> FS status block (21):
> FS marked consistent
>
>
> pitr ~ > /usr/local/sbin/debugfs.reiser4 -t img-from-ia32
> /usr/local/sbin/debugfs.reiser4 1.0.2
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> NODE (23) LEVEL=2 ITEMS=1 SPACE=4030 MKFS ID=0x484b7b0a FLUSH=0x0
> #0  NPTR (nodeptr40): [29:1(SD):2a:0] OFF=28, LEN=8, flags=0x0
> [24]
> ===========================================================================
>=== NODE (24) LEVEL=1 ITEMS=2 SPACE=3856 MKFS ID=0x484b7b0a FLUSH=0x0
> #0  SD (stat40): [29:1(SD):2a:0] OFF=28, LEN=82, flags=0x0
> exts:           0
> mask:           0x0
> ---------------------------------------------------------------------------
>--- #1  DIRITEM (cde40): [2a:0(NAME):0:0] OFF=110, LEN=70, flags=0x0
> NR  NAME                                  OFFSET HASH                      
>        SDKEY 0 .                                         38
> 0000000000000000:0000000000000000 0000291:000002a 1 ..                     
>                   54 002e2e0000000000:0000000000000000 0000291:000002a
> ===========================================================================
>===
>
>
> pitr ~ > /usr/local/sbin/debugfs.reiser4 img-made-locally
> /usr/local/sbin/debugfs.reiser4 1.0.2
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           7bca4399-bef6-460e-a580-2b4ebbfdf3dd
> label:          <none>
>
> Format super block (17):
> plugin:         format40
> description:    Disk-format for reiser4.
> magic:          ReIsEr40FoRmAt
> flushes:        0
> mkfs id:        0x78cd07fa
> blocks:         32
> free blocks:    7
> root block:     23
> tail policy:    0x2 (smart)
> next oid:       0x10000
> file count:     0
> tree height:    2
> key policy:     SHORT
>
> FS status block (21):
> FS marked consistent
>
>
> pitr ~ > /usr/local/sbin/debugfs.reiser4 -t img-made-locally
> /usr/local/sbin/debugfs.reiser4 1.0.2
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> NODE (23) LEVEL=2 ITEMS=1 SPACE=4030 MKFS ID=0x78cd07fa FLUSH=0x0
> #0  NPTR (nodeptr40): [29:1(SD):2a:0] OFF=28, LEN=8, flags=0x0
> [24]
> ===========================================================================
>=== NODE (24) LEVEL=1 ITEMS=2 SPACE=3856 MKFS ID=0x78cd07fa FLUSH=0x0
> #0  SD (stat40): [29:1(SD):2a:0] OFF=28, LEN=82, flags=0x0
> exts:           3
> mask:           0x0
> plugin:         sdext_lw
> offset:         2
> len:            14
> mode:           drwxr-xr-x
> nlink:          3
> size:           2
> plugin:         sdext_unix
> offset:         16
> len:            28
> uid:            1000
> gid:            1000
> atime:          Sun Oct 24 22:30:16 2004
> mtime:          Sun Oct 24 22:30:16 2004
> ctime:          Sun Oct 24 22:30:16 2004
> rdev:           68
> bytes:          68
> plugin:         sdext_plug
> offset:         44
> len:            38
> Pset count:     9
>     permission : id = 0
>     formatting : id = 2 (smart)
>           hash : id = 1 (r5_hash)
>      fibration : id = 2 (ext_1_fibre)
>       statdata : id = 0 (stat40)
>        diritem : id = 2 (cde40)
>         crypto : id = 0
>         digest : id = 0
>       compress : id = 0
> ---------------------------------------------------------------------------
>--- #1  DIRITEM (cde40): [2a:0(NAME):0:0] OFF=110, LEN=70, flags=0x0
> NR  NAME                                  OFFSET HASH
>    SDKEY
>   0 .                                         38
> 0000000000000000:00000000000000 00 0000291:000002a
>   1 ..                                        54
> 002e2e0000000000:00000000000000 00 0000291:000002a
> ===========================================================================
>===
>
> > Would you please try to patch reiser4progs's
> > plugin/alloc/alloc40/alloc40.c with the attached patch and try again?
>
> This patch only fixes the alloc block, which (I believe) is not *yet* a
> problem, there are more bugs which has to be solved first.
>
> Anyway, today I compiled 2.6.9-mm1 and got a new backtrace (I get the
> same trace with both the image made on PPC and IA32 now (except for some
> registers)):
>
> pitr ~ > sudo mount -t reiser4 -o loop ~/img-from-ia32 /mnt
> reiser4[mount(1943)]: key_warning
> (fs/reiser4/plugin/object.c:97)[nikita-717]: WARNING: Error for inode
> 720575940379279360 (-2)
> reiser4[mount(1943)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1249)[zam-597]: kernel BUG in reiser4_do_panic at
> fs/reiser4/debug.c:131!
> Oops: Exception in kernel mode, sig: 5 [#2]
> NIP: C009E25C LR: C00AEDD4 SP: CAB9BB30 REGS: cab9ba80 TRAP: 0700    Not
> tainted MSR: 00029032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
> TASK = d1fb40b0[1943] 'mount' THREAD: cab9a000Last syscall: 120
> GPR00: C00AEDD4 CAB9BB30 D1FB40B0 C027152C FFFFFFE4 00000000 00017FC6
> C035FF68 GPR08: C036031C C03123C8 D7637E7C CAB9BB3C 00000001 1002AE6C
> 100C0000 100A0000 GPR16: 00000000 101F0448 00000000 00000000 7FFFF9D6
> 00000000 10020000 00000000 GPR24: 7FFFF9E8 C02AE52C CAB9BD30 CF1EE000
> CAB9BC28 CAB9BC20 C0370000 C0350000 NIP [c009e25c]
> reiser4_do_panic+0x2c/0xc4
> LR [c00aedd4] force_commit_atom_nolock+0x0/0x40
> Call trace:
>  [c00aedd4] force_commit_atom_nolock+0x0/0x40
>  [c00af5c0] try_commit_txnh+0x190/0x208
>  [c00af67c] commit_txnh+0x44/0xbc
>  [c00ae4cc] txn_end+0x68/0x70
>  [c00ae4ec] txn_restart+0x18/0x34
>  [c00aee00] force_commit_atom_nolock+0x2c/0x40
>  [c00aef38] txnmgr_force_commit_all+0xc8/0xdc
>  [c010736c] release_format40+0xd4/0x138
>  [c00cca30] _done_disk_format+0x20/0x30
>  [c00ccd98] done_super+0x48/0x64
>  [c00cce3c] reiser4_fill_super+0x88/0x90
>  [c0069a8c] get_sb_bdev+0x150/0x1cc
>  [c00c53fc] reiser4_get_sb+0x18/0x28
>  [c0069d90] do_kern_mount+0x64/0x128
>  [c00814cc] do_new_mount+0x94/0xc4































--Boundary-00=_60OfBfL1owuO2CR
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4progs_sdextmask.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4progs_sdextmask.patch"

===== plugin/item/stat40/stat40.c 1.272 vs edited =====
--- 1.272/plugin/item/stat40/stat40.c	Wed Sep 22 23:10:50 2004
+++ edited/plugin/item/stat40/stat40.c	Mon Oct 25 15:23:13 2004
@@ -42,7 +42,7 @@
 				}
 			}
 			
-			extmask = *((uint16_t *)stat_body(&stat));
+			extmask = st40_get_extmask(stat_body(&stat));
 			
 			stat.ext_plug = NULL;
 			
@@ -314,7 +314,7 @@
 
 	/* If this is a new item being inserted, zero the on-disk mask. */
 	if (place->pos.unit == MAX_UINT32 && insert)
-		((stat40_t *)stat_body(&stat))->extmask = 0;
+		st40_set_extmask(stat_body(&stat), 0);
 
 	if (!stath->extmask)
 		return 0;
@@ -339,7 +339,7 @@
 				}
 			}
 			
-			extmask = *((uint16_t *)stat_body(&stat));
+			extmask = st40_get_extmask(stat_body(&stat));
 
 			if (insert) {
 				/* Calculating new extmask in order to 
@@ -348,7 +348,7 @@
 					     0x000000000000ffff));
 
 				/* Update mask.*/
-				*((uint16_t *)stat_body(&stat)) = extmask;
+				st40_set_extmask(stat_body(&stat), extmask);
 			}
 			
 			stat.offset += sizeof(d16_t);
@@ -449,7 +449,7 @@
 				}
 			}
 			
-			old_extmask = *((uint16_t *)stat_body(&stat));
+			old_extmask = st40_get_extmask(stat_body(&stat));
 
 			
 			/* Calculating new extmask in order to update old
@@ -458,7 +458,7 @@
 						       0x000000000000ffff));
 
 			/* Update mask.*/
-			*((uint16_t *)stat_body(&stat)) = new_extmask;
+			st40_set_extmask(stat_body(&stat), new_extmask);
 				
 			chunks++;
 			stat.offset += sizeof(d16_t);
===== plugin/item/stat40/stat40.h 1.49 vs edited =====
--- 1.49/plugin/item/stat40/stat40.h	Mon Apr 26 22:56:52 2004
+++ edited/plugin/item/stat40/stat40.h	Mon Oct 25 15:13:38 2004
@@ -29,7 +29,7 @@
 
 #define STAT40_EXTNR (64)
 
-#define st40_get_extmask(stat)		aal_get_le16(stat, extmask)
-#define st40_set_extmask(stat, val)	aal_set_le16(stat, extmask, val)
+#define st40_get_extmask(stat)		aal_get_le16(((stat40_t *)stat), extmask)
+#define st40_set_extmask(stat, val)	aal_set_le16(((stat40_t *)stat), extmask, val)
 
 #endif
===== plugin/item/stat40/stat40_repair.c 1.64 vs edited =====
--- 1.64/plugin/item/stat40/stat40_repair.c	Sat Oct 16 01:10:22 2004
+++ edited/plugin/item/stat40/stat40_repair.c	Mon Oct 25 15:20:05 2004
@@ -65,7 +65,7 @@
 		return 0;
 
 	/* This time the callback is called for the extmask. Fix it. */
-	*((uint16_t *)stat_body(stat)) = *(uint16_t *)mask;
+	st40_set_extmask(stat_body(stat), *(uint16_t *)mask);
 
 	(*mask) >>= 16;
 	return 0;

--Boundary-00=_60OfBfL1owuO2CR--



