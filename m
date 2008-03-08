From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch] reiser4: new export_ops fixup
Date: Sat, 08 Mar 2008 17:18:12 +0300
Message-ID: <47D2A024.4020702@gmail.com>
References: <20080224133851.249540@gmx.net> <5c7c368b0802241542x6be9420cy48332f52ece73bc4@mail.gmail.com> <20080225203235.107140@gmx.net> <47C36B60.1090402@gmail.com> <20080227144602.220610@gmx.net> <47C5B875.7020100@gmail.com> <20080307154338.84630@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030900060704090701020008"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20080307154338.84630@gmx.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?ISO-8859-1?Q?Sven_M=FCller?= <musv@gmx.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

This is a multi-part message in MIME format.
--------------030900060704090701020008
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Sven M=FCller wrote:

>Hi,=20
>
>yesterday I tried a new kernel version (2.6.24-r3). And today in the morni=
ng I got the next kernel oops. The problem is still the same:
>
>Access portage via nfs.
>
>The file system should be consistent. At least my machine didn't crash sin=
ce the last check. And I didn't get any other errors.=20
>
>The kernel ooops message is:=20
>
>
>Mar  7 08:23:46 Blechkasten su[7174]: + pts/4 sm:root
>Mar  7 08:30:01 Blechkasten BUG: unable to handle kernel NULL pointer dere=
ference at virtual address 00000050
>Mar  7 08:30:01 Blechkasten printing eip: c01a8c7a *pde =3D 00000000=20
>Mar  7 08:30:01 Blechkasten Oops: 0000 [#1]=20
>Mar  7 08:30:01 Blechkasten Modules linked in: libafs(P) lirc_i2c(F) lirc_=
dev nvidia(P) tuner tea5767 tda8290 tuner_simple mt20xx tea5761 bttv ir_com=
mon videobuf_dma_sg videobuf_core btcx_risc tveeprom
>Mar  7 08:30:01 Blechkasten=20
>Mar  7 08:30:01 Blechkasten Pid: 3233, comm: nfsd Tainted: PF       (2.6.2=
4-gentoo-r3 #1)
>Mar  7 08:30:01 Blechkasten EIP: 0060:[<c01a8c7a>] EFLAGS: 00010286 CPU: 0
>Mar  7 08:30:01 Blechkasten EIP is at max_item_size_node40+0xb/0x15
>Mar  7 08:30:01 Blechkasten EAX: 00000000 EBX: 00000002 ECX: ec2352b4 EDX:=
 c01ae184
>Mar  7 08:30:01 Blechkasten ESI: c04dd9e4 EDI: c045a02a EBP: f4f8fbdc ESP:=
 f4f8fb60
>Mar  7 08:30:01 Blechkasten cron[30633]: (root) CMD (test -x /usr/sbin/run=
-crons && /usr/sbin/run-crons )
>Mar  7 08:30:01 Blechkasten DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
>Mar  7 08:30:01 Blechkasten Process nfsd (pid: 3233, ti=3Df4f8e000 task=3D=
f4f02ff0 task.ti=3Df4f8e000)
>Mar  7 08:30:01 Blechkasten Stack: c01ae18f c019836d c01a8842 ffffffdc c01=
a81eb 0000000c 8e0d1a53 f4f8fc58=20
>Mar  7 08:30:01 Blechkasten ec2352b4 f4f8fb9c 00000282 0000fa80 d0dddd00 0=
0000074 e3d49000 c036957f=20
>Mar  7 08:30:01 Blechkasten e3d49000 f4921242 00000074 00000000 00000000 0=
0000000 f4921242 00000042=20
>Mar  7 08:30:01 Blechkasten Call Trace:
>Mar  7 08:30:01 Blechkasten [<c01ae18f>] max_name_len_cde+0xb/0xf
>Mar  7 08:30:01 Blechkasten [<c019836d>] reiser4_max_filename_len+0x1e/0x1f
>Mar  7 08:30:01 Blechkasten [<c01a8842>] is_name_acceptable_common+0x8/0x12
>Mar  7 08:30:01 Blechkasten [<c01a81eb>] reiser4_lookup_name+0x2e/0xf4
>Mar  7 08:30:01 Blechkasten [<c036957f>] skb_copy_and_csum_bits+0x15f/0x29a
>Mar  7 08:30:01 Blechkasten [<c01a89ea>] get_parent_common+0x50/0xbe
>Mar  7 08:30:01 Blechkasten [<c03e38de>] __mutex_lock_slowpath+0x1b7/0x1bf
>Mar  7 08:30:01 Blechkasten [<c036b115>] memcpy_toiovec+0x27/0x4a
>Mar  7 08:30:01 Blechkasten [<c019704f>] reiser4_get_dentry_parent+0x1b/0x=
1d
> =20
>
                                         ^^^^^^^^^^^^^^^^^^^^^^^^^
oh.. the reiser4_context is missed here.
The attached patch will help.

Thanks,
Edward.

--------------030900060704090701020008
Content-Type: text/x-patch;
 name="reiser4-new-export_ops-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-new-export_ops-fix.patch"

The fixup for reiser4-new-export_ops.patch:
Added missed reiser4_{init, exit}_context()
---
 linux-2.6.23-mm1/fs/reiser4/export_ops.c |   19 ++++++++++++++-----
 1 files changed, 14 insertions(+), 5 deletions(-)

--- linux-2.6.23-mm1/fs/reiser4/export_ops.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/export_ops.c
@@ -257,19 +257,28 @@
 {
 	struct inode *dir;
 	dir_plugin *dplug;
+	struct dentry *result;
+	reiser4_context *ctx;
 
 	assert("nikita-3527", child != NULL);
-	/* see comment in reiser4_get_dentry() about following assertion */
-	assert("nikita-3528", is_in_reiser4_context());
 
 	dir = child->d_inode;
 	assert("nikita-3529", dir != NULL);
+
+	ctx = reiser4_init_context(dir->i_sb);
+	if (IS_ERR(ctx))
+		return (void *)ctx;
+
 	dplug = inode_dir_plugin(dir);
 	assert("nikita-3531", ergo(dplug != NULL, dplug->get_parent != NULL));
-	if (dplug != NULL)
-		return dplug->get_parent(dir);
-	else
+
+	if (unlikely(dplug == NULL)) {
+		reiser4_exit_context(ctx);
 		return ERR_PTR(RETERR(-ENOTDIR));
+	}
+	result = dplug->get_parent(dir);
+	reiser4_exit_context(ctx);
+	return result;
 }
 
 /**

--------------030900060704090701020008--
