From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4 panic in do_readpage_extent
Date: Fri, 09 Mar 2007 23:36:15 +0300
Message-ID: <45F1C53F.2060502@namesys.com>
References: <45E888F0.7070604@free.fr> <45E88AAB.90701@free.fr> <45EC5141.6090807@stransky.cx> <45EC89D4.70505@free.fr> <45ED981E.501@namesys.com> <45EFFEF4.1030003@aon.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070007030702050704010300"
Return-path: <reiserfs-list-return-30594-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45EFFEF4.1030003@aon.at>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Devils-Hawk <devilshawk@aon.at>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

--------------070007030702050704010300
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Devils-Hawk wrote:

> Recently tried switching from 2.6.18 + reiser4-for-2.6.18-r3.patch.gz, 
> which works perfectly fine to 2.6.19 + reiser4-for-2.6.19-r3.patch.gz
> I also tried 2.6.20 laurent riffard's reiser4-for-2.6.20. The last 
> both die somewhere during init when one of the 2 following asserts fails:
> extent_file_ops, Line 1160: assert("nikita-2688"),j)
> extent_file_ops, Line 1161: assert("vs-1426"),jnode_page(j) == NULL )
>
> fs was fsck'ed with reiser4progs-1.0.5
>
> regards DevH
>
>

Would you please try the attached patch over reiser4-for-2.6.[19, 20]

Thanks,
Edward.

--------------070007030702050704010300
Content-Type: text/x-patch;
 name="reiser4-handle-race-in-readpages-filler.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-handle-race-in-readpages-filler.patch"

Handle possible race:
do not proceed uf_readpages_filler if page is already uptodate.

Signed-off-by: Edward Shishkin <edward@namesys.com>
---
 linux-2.6.20-mm2/fs/reiser4/plugin/file/file.c |    4 ++++
 1 files changed, 4 insertions(+)

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

--------------070007030702050704010300--
