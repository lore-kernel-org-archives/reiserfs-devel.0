From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.28
Date: Wed, 07 Jan 2009 01:37:43 +0300
Message-ID: <4963DD37.8060606@gmail.com>
References: <49556E61.4010606@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010709060000060409090601"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49556E61.4010606@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010709060000060409090601
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Edward Shishkin wrote:
> Hello everyone.
>
> Changes since reiser4-for-2.6.27:
>
> . adjust to the new aops;
> . use d_obtain_alias instead of d_alloc_anon (Jeff Chua);
> . remove simple_prepare_write usage (Laurent Riffard).
>
> Find at
> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/
>
>   

I have updated the stuff with the attached patch,
please, refresh your reiser4-for-2.6.28

Thanks,
Edward.

--------------010709060000060409090601
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

--------------010709060000060409090601--
