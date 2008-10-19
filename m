From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [BUG] reiser4-for-2.6.27
Date: Sun, 19 Oct 2008 22:41:52 +0400
Message-ID: <48FB7F70.9090900@gmail.com>
References: <loom.20081019T090028-392@post.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090406070304000808020102"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <loom.20081019T090028-392@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Mat <jackdachef@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, Brandon Berhent <cheater1034@gmail.com>

This is a multi-part message in MIME format.
--------------090406070304000808020102
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mat wrote:
> Hi Edward,
>
> this one's the kernel-config for the second (posted) error:
>   

Yup, it seems to be a bug: reiser4_set_page_dirty_internal() didn't
take care about disabling preemption, while per-cpu stuff needs this.
I wonder why nobody did report it earlier. It requires CONFIG_PREEMPT=y
and CONFIG_DEBUG_PREEMPT=y though..

A possible fixup is attached.

Thank to everyone.
Edward.

--------------090406070304000808020102
Content-Type: text/x-patch;
 name="reiser4-disable-preemption-in-set-page-dirty.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-disable-preemption-in-set-page-dirty.patch"

---
 linux-2.6.27/fs/reiser4/page_cache.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-2.6.27/fs/reiser4/page_cache.c.orig
+++ linux-2.6.27/fs/reiser4/page_cache.c
@@ -469,10 +469,12 @@ void reiser4_set_page_dirty_internal(str
 	if (!TestSetPageDirty(page)) {
 		WARN_ON_ONCE(!PagePrivate(page) && !PageUptodate(page));
 		if (mapping_cap_account_dirty(mapping)) {
+			preempt_disable();
 			__inc_zone_page_state(page, NR_FILE_DIRTY);
 			__inc_bdi_stat(mapping->backing_dev_info,
 				       BDI_RECLAIMABLE);
 			task_io_account_write(PAGE_CACHE_SIZE);
+			preempt_enable();
 		}
 		assert("edward-1558", mapping->host != NULL);
 		__mark_inode_dirty(mapping->host, I_DIRTY_PAGES);

--------------090406070304000808020102--
