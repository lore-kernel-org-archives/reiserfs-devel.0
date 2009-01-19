From: "Ingo Bormuth" <ibormuth@efil.de>
Subject: Reiser4: Compilation Error on 2.6.28.1_[Scanned]
Date: Mon, 19 Jan 2009 01:53:27 +0100
Message-ID: <1232326407.2948.7.camel@localhost>
Reply-To: <ibormuth@efil.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=-miie6TzP7P0sP6R7QaiC"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs devel <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.

--=-miie6TzP7P0sP6R7QaiC
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

Reiser4-for-2.6.28 does apply but fails to compile on
vanilla-2.6.28.1 due to the following commit:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=54566b2c1594c2326a645a3551f9d989f7ba3c5e

Attached is a tiny fix which works fine here.


-- 
Ingo Bormuth,  voicebox & telefax:  +49-(0)-12125-10226517
PGP public key 86326EC9 at http://ibormuth.efil.de/contact

--=-miie6TzP7P0sP6R7QaiC
Content-Disposition: attachment;
	filename="reiser4-for-2.6.28.1-grab_cache_page_write_begin.patch"
Content-Type: text/x-patch;
	charset="UTF-8";
	name="reiser4-for-2.6.28.1-grab_cache_page_write_begin.patch"
Content-Transfer-Encoding: 7bit

--- /tmp/reiser4/plugin/file/file_conversion.c	2009-01-19 00:39:04.548008815 +0100
+++ fs/reiser4/plugin/file/file_conversion.c	2009-01-19 00:41:10.956013107 +0100
@@ -686,7 +686,7 @@
 	start = pos & (PAGE_CACHE_SIZE - 1);
 	end = start + len;
 
-	page = __grab_cache_page(mapping, index);
+	page = grab_cache_page_write_begin(mapping, index, flags);
 	*pagep = page;
 	if (!page)
 		return -ENOMEM;

--=-miie6TzP7P0sP6R7QaiC--
