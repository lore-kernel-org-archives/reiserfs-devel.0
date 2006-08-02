From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: [BUG] nikita-1481, nikita-717 and nikita-373 here and there
Date: Wed, 2 Aug 2006 18:58:39 +0400
Message-ID: <200608021858.40160.zam@namesys.com>
References: <449B2D1D.9000507@iki.fi> <1154464756.8960.55.camel@teratron.lan.etheus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29435-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1154464756.8960.55.camel@teratron.lan.etheus.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Craig Shelley <craig@microtron.org.uk>
Cc: reiserfs-list@namesys.com

Hello,

On Wednesday 02 August 2006 00:39, Craig Shelley wrote:
> On Fri, 2006-06-23 at 02:51 +0300, Jussi Judin wrote:
> > After that I upgraded to Debian patched kernel 2.6.16-14 and to
> > reiser4 patch 2.6.16-4 for that kernel and ran fsck.reiser4. Then I
> > got errors like this in kern.log after a while:
> >
> > WARNING: Error for inode 1731981 (-2)
> > reiser4[nfsd(3817)]: key_warning
> > (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
> > WARNING: Error for inode 1703086 (-2)
> > reiser4[nfsd(3818)]: key_warning
> > (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
> > WARNING: Error for inode 1726433 (-2)
> > reiser4[nfsd(3818)]: key_warning
> > (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
>
> I too am getting these warnings:
>
> Jul 27 06:28:15 prometheus kernel: reiser4[find(10770)]: key_warning
> (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
> Jul 27 06:28:15 prometheus kernel: WARNING: Error for inode 3922698
> (-2) [REPEATED 17 TIMES]
> Jul 27 06:28:15 prometheus kernel: reiser4[find(10770)]: key_warning
> (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
> Jul 27 06:28:15 prometheus kernel: WARNING: Error for inode 3922697
> (-2) [REPEATED 17 TIMES]
> Jul 27 06:28:16 prometheus kernel: reiser4[find(10770)]: key_warning
> (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
> Jul 27 06:28:16 prometheus kernel: WARNING: Error for inode 3922696
> (-2) [REPEATED 17 TIMES]
>
> ...
> ...
>
> Jul 27 06:28:19 prometheus kernel: reiser4[find(10770)]:
> cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
> Jul 27 06:28:19 prometheus kernel: WARNING: Keys are inconsistent.
> Fsck? Jul 27 06:28:19 prometheus kernel: reiser4[find(10770)]:
> key_warning (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
> Jul 27 06:28:19 prometheus kernel: WARNING: Error for inode 3922690
> (-5)
>
>
> System information:
> Kernel: 2.6.16.20
> Patches: reiser4-for-2.6.16-4.patch.gz

please upgrade to 2.6.17 and reiser4-for-2.6.17-3

or apply the following patch:

Index: linux-2.6.16/fs/reiser4/plugin/file/file.c
===================================================================
--- linux-2.6.16.orig/fs/reiser4/plugin/file/file.c
+++ linux-2.6.16/fs/reiser4/plugin/file/file.c
@@ -1633,14 +1633,18 @@ static size_t read_file(hint_t * hint, s
 			/* error happened */
 			break;
 
-		if (coord->between != AT_UNIT)
+		if (coord->between != AT_UNIT) {
 			/* there were no items corresponding to given offset */
+			done_lh(hint->ext_coord.lh);
 			break;
+		}
 
 		loaded = coord->node;
 		result = zload(loaded);
-		if (unlikely(result))
+		if (unlikely(result)) {
+			done_lh(hint->ext_coord.lh);
 			break;
+		}
 
 		if (hint->ext_coord.valid == 0)
 			validate_extended_coord(&hint->ext_coord,
@@ -1725,13 +1729,15 @@ ssize_t read_unix_file(struct file *file
 			left = size - *off;
 
 		/* faultin user page */
-		result = fault_in_pages_writeable(buf, left > PAGE_CACHE_SIZE ? PAGE_CACHE_SIZE : left);
-		if (result) {
+		if(fault_in_pages_writeable(buf, left > PAGE_CACHE_SIZE ? PAGE_CACHE_SIZE : left)) {
 			drop_nonexclusive_access(uf_info);
-			return RETERR(-EFAULT);
+			result = RETERR(-EFAULT);
+			break;
 		}
 
-		read = read_file(hint, file, buf, left, off);
+		read = read_file(hint, file, buf,
+				 left > PAGE_CACHE_SIZE ? PAGE_CACHE_SIZE : left,
+				 off);
 
  		drop_nonexclusive_access(uf_info);
 
@@ -1748,6 +1754,7 @@ ssize_t read_unix_file(struct file *file
 		count += read;
 	}
 	save_file_hint(file, hint);
+	done_lh(&hint->lh);
 	kfree(hint);
 
 	if (count) {
Index: linux-2.6.16/fs/reiser4/as_ops.c
===================================================================
--- linux-2.6.16.orig/fs/reiser4/as_ops.c
+++ linux-2.6.16/fs/reiser4/as_ops.c
@@ -350,6 +350,9 @@ int reiser4_releasepage(struct page *pag
 	if (PageDirty(page))
 		return 0;
 
+	if (page_count(page) > 3)
+		return 0;
+
 	/* releasable() needs jnode lock, because it looks at the jnode fields
 	 * and we need jload_lock here to avoid races with jload(). */
 	spin_lock_jnode(node);

> Reiser4progs: 1.0.5
>
> This machine is used for recording TV using a DVB card, compresses
> the files, and serves them via NFS and Samba.
>
> Until recently, the system ran kernel linux-2.6.11.6, and performed
> flawlessly for over a year. After upgrading the kernel, I upgraded
> reiser4progs, and fscked all reiser4 partitions. No errors were
> found.
>
> The system is run on a UPS, and does not have a history of memory or
> IO trouble.
> I am currently investigating why the samba shares have failed, and
> noticed this in the log.
>
> I believe problem/bug this is related to the kernel upgrade, rather
> than some random corruption because it seem too much of a coincidence
> to happen so soon after upgrading the kernel.
>
> Any help/advice is greatly appreciated.
>
> ...back to the samba investigation.
>
> Many Thanks,

-- 
Alex.

