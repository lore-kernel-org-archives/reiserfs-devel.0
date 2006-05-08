From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser4 2.6.16.2 / 2.6.17-rc3-mm1 WARNING: out of memory?
Date: Mon, 08 May 2006 16:26:04 +0400
Message-ID: <1147091164.7221.44.camel@tribesman.namesys.com>
References: <BAY23-F20FBA411B5A04A1F6588E0A7AA0@phx.gbl>
	 <2c259a8f0605071505nedaf73fpa3f69463d77aa867@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-CvFw2REnNVC+p1mZ6HM5"
Return-path: <reiserfs-list-return-28587-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2c259a8f0605071505nedaf73fpa3f69463d77aa867@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Yien Zheng <esprout@gmail.com>
Cc: Joseph Landers <josephlanders@hotmail.com>, reiserfs-list@namesys.com, laurent.riffard@free.fr

--=-CvFw2REnNVC+p1mZ6HM5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello

On Sun, 2006-05-07 at 17:05 -0500, Yien Zheng wrote:
> I thought the patch might have fixed it for me, but it happened again.

Sorry, first version of patch is not correct. Please unapply it and try
the attached one.

>  I think I'm getting the same error you were too but let me paste mine
> in case it adds any additional info:
> 
> kernel BUG at fs/inode.c:251!
> invalid opcode: 0000 [#1]
> PREEMPT
> last sysfs file: /block/sdj/size
> Modules linked in: smbfs usbcore dm_mod
> CPU:    0
> EIP:    0060:[<c015c277>]    Not tainted VLI
> EFLAGS: 00010286   (2.6.17-rc3-mm1 #8)
> EIP is at clear_inode+0x16/0xa5
> eax: c08fb8ac   ebx: c08fb8ac   ecx: c08fb8ac   edx: c08fb8ac
> esi: c9cf9c80   edi: c08c941c   ebp: c08fb8ac   esp: c9862f1c
> ds: 007b   es: 007b   ss: 0068
> Process emerge (pid: 8062, threadinfo=c9862000 task=cba5c590)
> Stack: <0>c08fb8ac c9cf9c80 c018dc4b c08fb8ac c08fb8ac c018dbba
> c015cf0d c08fb8ac
>        00000000 c86a7000 c0154c22 c08fb8ac c19c53c0 cc2e3a20 390b39cc 0000000d
>        c86a7041 00000010 00000000 00000000 00000296 ca037d20 ca3ab2a0 00000001
> Call Trace:
>  <c018dc4b> reiser4_delete_inode+0x91/0x9d   <c018dbba>
> reiser4_delete_inode+0x0/0x9d
>  <c015cf0d> generic_delete_inode+0x6c/0xea   <c0154c22> do_unlinkat+0xb7/0xfc
>  <c0155510> sys_renameat+0x58/0x60   <c0154ca2> sys_unlink+0xb/0xe
>  <c02be48f> syscall_call+0x7/0xb
> Code: c7 42 04 a8 03 31 c0 89 15 a8 03 31 c0 ff 0d 48 d8 39 c0 5b c3
> 56 53 8b 5c 24 0c 53 e8 ae cb fe ff 83 bb c4 00 00 00 00 58 74 08 <0f>
> 0b fb 00 f5 2a 2d c0 8b 83 1c 01 00 00 a8 10 75 08 0f 0b fc
> EIP: [<c015c277>] clear_inode+0x16/0xa5 SS:ESP 0068:c9862f1c
>  <4><4>reiser4[emerge(8062)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> WARNING: out of memory?
> <4>reiser4[emerge(8062)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> WARNING: out of memory?
> 
> On 5/6/06, Joseph Landers <josephlanders@hotmail.com> wrote:
> > Thanks for the patch, I still get the same (first post) error message, as
> > before, only when  booting into the reiser4 partition, although now the
> > system stays up a bit longer before dying, I am able to execute commands and
> > run programs for a few minutes before the system halting/becoming
> > unresponsive
> >
> > booting on ext3 and mounting the reiser4 wseems to be fine, it's just
> > peculiar, or maybe I am not using the reiser4 partition enough to make the
> > memory problem significant?
> >
> > I have tried 2.6.16 to check if any bugs were introduced since then and that
> > has the same problem, so I will just have to wait for a patch to fix this
> > now
> >
> > I think the problem is in /fs/inode.c which is the kernel inode file, not
> > reiser4s inode file, maybe reiser4 is sending the wrong delete inode command
> > to it?
> >
> > It only seems to segfault once which is peculiar too?
> >
> > _________________________________________________________________
> > FREE pop-up blocking with the new MSN Toolbar – get it now!
> > http://toolbar.msn.click-url.com/go/onm00200415ave/direct/01/
> >
> >
> 

--=-CvFw2REnNVC+p1mZ6HM5
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

--=-CvFw2REnNVC+p1mZ6HM5--

