From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiserfs bug in 2.6.17-rc3-mm1
Date: Mon, 08 May 2006 16:23:54 +0400
Message-ID: <1147091034.7221.41.camel@tribesman.namesys.com>
References: <445E4C1E.2090908@feise.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-mhzc+H31daw3ksk8EfrH"
Return-path: <reiserfs-list-return-28586-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <445E4C1E.2090908@feise.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: jfeise@feise.com
Cc: reiserfs-list@namesys.com

--=-mhzc+H31daw3ksk8EfrH
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Sun, 2006-05-07 at 12:35 -0700, Joe Feise wrote:
> rc3-mm1 plus the reiser4-radix-tree-direct-data-fix.patch
> 

first version of this patch is insufficient. Please unapply it and try
new version.

> -Joe
> 
> dmesg output:
> kernel BUG at fs/reiser4/flush.c:1038!
> invalid opcode: 0000 [#1]
> PREEMPT
> last sysfs file: /class/net/eth2/ifindex
> Modules linked in: pl2303 usbserial softdog cisco_ipsec snd_pcm_oss
> snd_mixer_oss snd_cs46xx gameport snd_rawmidi snd_seq_device snd_ac97_codec
> snd_ac97_bus snd_pcm snd_timer snd soundcore snd_page_alloc zoran i2c_algo_bit
> videodev saa7111 i2c_corepegasus arc4 ppp_mppe ppp_deflate ppp_generic slhc usblp
> CPU:    0
> EIP:    0060:[<c01cb0d4>]    Tainted: P      VLI
> EFLAGS: 00010287   (2.6.17-rc3-mm1 #4)
> EIP is at flush_current_atom+0x1cf/0x247
> eax: e0efc080   ebx: f4b45e00   ecx: f4b45e00   edx: f5c2e000
> esi: f5dabe4c   edi: f5daa000   ebp: 00000001   esp: f5dabe0c
> ds: 007b   es: 007b   ss: 0068
> Process ent:sdb2! (pid: 1832, threadinfo=f5daa000 task=f5d89ab0)
> Stack: <0>f5dabe18 00000001 f5dabe90 00000000 c5db8a40 e0efc080 f5daa000 f5c21cd8
>        00000000 c01c84b8 f5dabe4c 00000000 f5dabeec f5dabea8 f7e57dcc f5dabe90
>        e0efc080 f7e57d80 00000000 f7e57dcc f58d7c00 c01d6b60 00000001 d75ba3ac
> Call Trace:
>  <c01c84b8> flush_some_atom+0x245/0x367   <c01d6b60> writeout+0xc8/0x1e7
>  <c0175f27> generic_sync_sb_inodes+0x211/0x2a8   <c01d857d> entd_flush+0x9f/0xbc
>  <c01d8257> entd+0xd5/0x2a3   <c0128bdc> autoremove_wake_function+0x0/0x43
>  <c0128bdc> autoremove_wake_function+0x0/0x43   <c01d8182> entd+0x0/0x2a3
>  <c01286f4> kthread+0x9c/0xa1   <c0128658> kthread+0x0/0xa1
>  <c0100f1d> kernel_thread_helper+0x5/0xb
> Code: 87 c7 04 24 20 72 47 c0 e8 b8 b4 f4 ff e8 ae 84 f3 ff e9 5c ff ff ff e8 59
> c2 27 00 e9 28 ff ff ff e8 4f c2 27 00 e9 0f ff ff ff <0f> 0b 0e 04 e5 bd 47 c0
> e9 f3 fe ff ff 8b 54 24 0c 85 d2 74 09
> EIP: [<c01cb0d4>] flush_current_atom+0x1cf/0x247 SS:ESP 0068:f5dabe0c
>  <6>note: ent:sdb2![1832] exited with preempt_count 2
> 
> 

--=-mhzc+H31daw3ksk8EfrH
Content-Disposition: attachment; filename=reiser4-radix-tree-direct-data-fix.patch
Content-Type: text/x-patch; name=reiser4-radix-tree-direct-data-fix.patch; charset=utf-8
Content-Transfer-Encoding: 7bit



Reiser4 used to check radix tree emptiness by comparing tree height against 0.
With radix-tree-direct-data.patch not empty tree can have zero height.
This patch makes reiser4 to check tree emptiness using tree root.

Signed-off-by: Vladimir V. Saveliev <vs@namesys.com>

diff -puN fs/reiser4/jnode.c~reiser4-radix-tree-direct-data-fix fs/reiser4/jnode.c


 fs/reiser4/jnode.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff -puN fs/reiser4/jnode.c~reiser4-radix-tree-direct-data-fix fs/reiser4/jnode.c
--- linux-2.6.17-rc3-mm1/fs/reiser4/jnode.c~reiser4-radix-tree-direct-data-fix	2006-05-08 12:54:12.000000000 +0400
+++ linux-2.6.17-rc3-mm1-vs/fs/reiser4/jnode.c	2006-05-08 12:54:57.000000000 +0400
@@ -432,7 +432,7 @@ static void inode_attach_jnode(jnode * n
 	inode = node->key.j.mapping->host;
 	info = reiser4_inode_data(inode);
 	rtree = jnode_tree_by_reiser4_inode(info);
-	if (rtree->height == 0) {
+	if (rtree->rnode == NULL) {
 		/* prevent inode from being pruned when it has jnodes attached
 		   to it */
 		write_lock_irq(&inode->i_data.tree_lock);
@@ -464,7 +464,7 @@ static void inode_detach_jnode(jnode * n
 
 	/* delete jnode from inode's radix tree of jnodes */
 	check_me("zam-1046", radix_tree_delete(rtree, node->key.j.index));
-	if (rtree->height == 0) {
+	if (rtree->rnode == NULL) {
 		/* inode can be pruned now */
 		write_lock_irq(&inode->i_data.tree_lock);
 		inode->i_data.nrpages--;

_

--=-mhzc+H31daw3ksk8EfrH--

