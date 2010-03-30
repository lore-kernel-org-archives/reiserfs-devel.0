From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Segfault in fsck.reiser4
Date: Tue, 30 Mar 2010 02:59:17 +0200
Message-ID: <4BB14CE5.1040304@gmail.com>
References: <7880.2170.3389-28898-1298266740-1269420891@seznam.cz> <4BAA0F42.90308@gmail.com> <op.u97wx6qfhogzsi@g17b>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040005060300060105000708"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type;
        bh=/y7xkqJ0+gv3pCj1tHPKiVvxAyOQ6fgDLBjIsQ/NI98=;
        b=smsNN8Xkv172tD+KMAU4FDBK2bjvc35Rg+Q7gfcOuRvWw6Q8yHELzIU38laINry7vq
         ZJOuYTU5XbddyPSwiGw2+M4Sr7y9tB+7svk3hiXpULqgbvFOhH58zXZOEQKsse3FrBMK
         sCEoBdhRRrucau2pyMTxQuf1p9DTMB6sIoMAo=
In-Reply-To: <op.u97wx6qfhogzsi@g17b>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------040005060300060105000708
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Jonáš Vidra wrote:

[...]
>
>
> The oops is probably not very useful, but here you are anyway:

This is very useful. The attached patch should fix this oops.
However, your partition remains inconsistent. I'll fix up fsck
a bit later..

Thanks,
Edward.

>
> Mar 27 01:55:01 [kernel] Kernel BUG at c10e0681 [verbose debug info
> unavailable]
[..]
> Mar 27 01:55:01 [kernel]  [<c10e0890>] ?
> ctail_readpages_filler+0x149/0x195
> Mar 27 01:55:01 [kernel]  [<c105d02f>] ? read_cache_pages+0x6d/0xca
> Mar 27 01:55:01 [kernel]  [<c10e0747>] ? ctail_readpages_filler+0x0/0x195
> Mar 27 01:55:01 [kernel]  [<c10e03d7>] ? readpages_ctail+0x29f/0x2a8
> Mar 27 01:55:01 [kernel]  [<c10d4030>] ?
> readpages_cryptcompress+0x36/0x5b
> Mar 27 01:55:01 [kernel]  [<c10c82d3>] ? reiser4_readpages+0x26/0x2e
> Mar 27 01:55:01 [kernel]  [<c10c82ad>] ? reiser4_readpages+0x0/0x2e
> Mar 27 01:55:01 [kernel]  [<c105cc54>] ?
> __do_page_cache_readahead+0xeb/0x160
> Mar 27 01:55:01 [kernel]  [<c105cce0>] ? ra_submit+0x17/0x1c
> Mar 27 01:55:01 [kernel]  [<c105cef6>] ? ondemand_readahead+0x161/0x16d
> Mar 27 01:55:01 [kernel]  [<c105cf7a>] ?
> page_cache_sync_readahead+0x16/0x1b
> Mar 27 01:55:01 [kernel]  [<c10580c7>] ?
> generic_file_aio_read+0x1fe/0x550
> Mar 27 01:55:01 [kernel]  [<c107857b>] ? do_sync_read+0xab/0xe9
> Mar 27 01:55:01 [kernel]  [<c10385c3>] ?
> autoremove_wake_function+0x0/0x33
> Mar 27 01:55:01 [kernel]  [<c10d3d37>] ? read_cryptcompress+0x5f/0x7e
> Mar 27 01:55:01 [kernel]  [<c10d2335>] ? reiser4_read_careful+0xa9/0xf1
> Mar 27 01:55:01 [kernel]  [<c10d228c>] ? reiser4_read_careful+0x0/0xf1
> Mar 27 01:55:01 [kernel]  [<c1078fa7>] ? vfs_read+0x87/0x118
> Mar 27 01:55:01 [kernel]  [<c10790d1>] ? sys_read+0x3b/0x60
> Mar 27 01:55:01 [kernel]  [<c1002b0f>] ? sysenter_do_call+0x12/0x26
> Mar 27 01:55:01 [kernel] ---[ end trace 26ea3afca4e81c3e ]---
>
>


--------------040005060300060105000708
Content-Type: text/x-patch;
 name="reiser4-do_readpage_ctail-fixup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-do_readpage_ctail-fixup.patch"

Hanle the case of orphan unprepped disk cluster:
return EIO and suggest fsck the partition instead of BUG_ON(1).

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/item/ctail.c |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

--- linux-2.6.33-reiser4.orig/fs/reiser4/plugin/item/ctail.c
+++ linux-2.6.33-reiser4/fs/reiser4/plugin/item/ctail.c
@@ -649,9 +649,11 @@ int do_readpage_ctail(struct inode * ino
 		ret = ctail_read_disk_cluster(clust, inode, page, mode);
 
 		assert("edward-212", PageLocked(page));
-		if (ret)
+		if (ret) {
+			ClearPageUptodate(page);
+			SetPageError(page);
 			return ret;
-
+		}
 		/* refresh bytes */
 		to_page = pbytes(page_index(page), inode);
 		if (to_page == 0) {
@@ -669,7 +671,13 @@ int do_readpage_ctail(struct inode * ino
 
 	switch (clust->dstat) {
 	case UNPR_DISK_CLUSTER:
-		BUG_ON(1);
+		warning("edward-1563",
+			"orphan unprepped cluster %lu (inode %lli). Fsck?",
+			clust->index,
+			(unsigned long long)get_inode_oid(inode));
+		ClearPageUptodate(page);
+		SetPageError(page);
+		return -EIO;
 	case TRNC_DISK_CLUSTER:
 		/*
 		 * Race with truncate!

--------------040005060300060105000708--
