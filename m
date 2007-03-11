From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4 panic in do_readpage_extent
Date: Sun, 11 Mar 2007 16:49:38 +0300
Message-ID: <45F408F2.5030003@namesys.com>
References: <45E888F0.7070604@free.fr> <45E88AAB.90701@free.fr> <45EC5141.6090807@stransky.cx> <45EC89D4.70505@free.fr> <45ED981E.501@namesys.com> <45EFFEF4.1030003@aon.at> <45F1C53F.2060502@namesys.com> <45F1CE6E.7070506@aon.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090204040703010102070904"
Return-path: <reiserfs-list-return-30598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45F1CE6E.7070506@aon.at>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Devils-Hawk <devilshawk@aon.at>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

--------------090204040703010102070904
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Devils-Hawk wrote:

> The problem still persists also trying to boot multiple times it 
> sometimes triggers much earlier in the boot process than it did before.
>

Hmm.. can not reproduce it..
The attached patch (against reiser4-for-2.6[19, 20]) allows to dump stack
and some useful info noted as edward-200X among other boot messages.
Would you please send it.

Thanks,
Edward.

> regards devh
>
> Edward Shishkin wrote:
>
>>
>> Would you please try the attached patch over reiser4-for-2.6.[19, 20]
>>
>> Thanks,
>> Edward.
>>
>
>
>


--------------090204040703010102070904
Content-Type: text/x-patch;
 name="dump_stack.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dump_stack.patch"

Handle possible race:
do not proceed uf_readpages_filler if page is already uptodate.
Print debugging info.

Signed-off-by: Edward Shishkin <edward@namesys.com>
---
 linux-2.6.20-mm2/fs/reiser4/plugin/file/file.c            |    4 +++
 linux-2.6.20-mm2/fs/reiser4/plugin/item/extent_file_ops.c |   17 ++++++++++++++
 2 files changed, 21 insertions(+)

--- linux-2.6.20-mm2/fs/reiser4/plugin/file/file.c.orig
+++ linux-2.6.20-mm2/fs/reiser4/plugin/file/file.c
@@ -1619,6 +1619,10 @@
 		lock_page(page);
 		cbk_done = 1;
 	}
+	if (PageUptodate(page)) {
+		unlock_page(page);
+		return 0;
+	}
 	ret = zload(rc->coord.node);
 	if (ret) {
 		unlock_page(page);
--- linux-2.6.20-mm2/fs/reiser4/plugin/item/extent_file_ops.c.orig
+++ linux-2.6.20-mm2/fs/reiser4/plugin/item/extent_file_ops.c
@@ -1157,7 +1157,24 @@
 
 	case UNALLOCATED_EXTENT:
 		j = jfind(mapping, index);
+		if (j == NULL) {
+			dump_stack();
+			printk("edward-2000: oid = %llu\n",
+			       (unsigned long long)oid);
+			printk("edward-2001: Jnode not found\n");
+		}
 		assert("nikita-2688", j);
+		if (jnode_page(j) != NULL) {
+			dump_stack();
+			printk("edward-2002: oid = %llu\n",
+			       (unsigned long long)oid);
+			printk("edward-2003: read page  %p of idx %lu\n",
+			       page, page->index);
+			printk("edward-2004: jnode page %p of idx %lu\n",
+			       jnode_page(j), jnode_page(j)->index);
+			printk("edward-2005: jnode blknr =  %llu\n",
+			       (unsigned long long)(*jnode_get_block(j)));
+		}
 		assert("vs-1426", jnode_page(j) == NULL);
 
 		spin_lock_jnode(j);

--------------090204040703010102070904--
