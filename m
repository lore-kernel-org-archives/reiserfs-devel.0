From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Another panic!
Date: Tue, 23 Nov 2004 14:47:19 +0300
Message-ID: <1101210439.2151.52.camel@tribesman.namesys.com>
References: <20041121163755.GV26192@nysv.org>
	 <20041121172031.GW26192@nysv.org> <41A1FDAD.9040903@namesys.com>
	 <20041122160122.GZ26192@nysv.org> <41A21DF9.7060907@namesys.com>
	 <41A21EE4.9090602@namesys.com> <20041122165902.GA26192@nysv.org>
	 <20041122185228.GB26192@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-O0LXcd2su6Ke3XRbEFXy"
Return-path: <reiserfs-list-return-22529-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041122185228.GB26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: "E.Gryaznova" <grev@namesys.com>, reiserfs-list@namesys.com, Cal <hihone@bigpond.net.au>

--=-O0LXcd2su6Ke3XRbEFXy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello

On Mon, 2004-11-22 at 21:52, Markus TЖrnqvist wrote:
> On Mon, Nov 22, 2004 at 06:59:02PM +0200, Markus Törnqvist wrote:
> >
> >Nov 21 21:45:11 shrike kernel: kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:58!
> >
> 
> http://mjt.nysv.org/reiser/2004.11.22.forensics/

The attached should fix a problem #01.


> 
> The first two files are from something vs sent me.
> 
> As it says on the bottom, I couldn't re-crash 2.6.10-rc2-mm2,
> but I'm still FAIRLY sure I saw it crash earlier-on :)
> Unless I booted the wrong kernel :)
> 
> Well, anyway, -rc2-mm2 seems to work better, but Cal had some issues?
> How did it go with the alchemy?
> 
> Thanks!

--=-O0LXcd2su6Ke3XRbEFXy
Content-Disposition: attachment; filename=1.1765
Content-Type: text/plain; name=1.1765; charset=koi8-r
Content-Transfer-Encoding: 7bit

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2004/11/23 14:07:34+03:00 vs@tribesman.namesys.com 
#   read_unix_file: missing calls to txn_restart() are added
# 
# plugin/file/file.c
#   2004/11/23 14:07:31+03:00 vs@tribesman.namesys.com +4 -1
#   read_unix_file: missing calls to txn_restart() are added
# 
diff -Nru a/plugin/file/file.c b/plugin/file/file.c
--- a/plugin/file/file.c	2004-11-23 14:45:34 +03:00
+++ b/plugin/file/file.c	2004-11-23 14:45:34 +03:00
@@ -1741,6 +1741,8 @@
 	while (left > 0) {
 		size_t to_read;		
 
+		txn_restart_current();
+
 		size = i_size_read(inode);
 		if (*off >= size)
 			/* position to read from is past the end of file */
@@ -1774,7 +1776,6 @@
 		if (user_space)
 			reiser4_put_user_pages(pages, nr_pages);
 		drop_nonexclusive_access(uf_info);
-		txn_restart_current();
 
 		if (read < 0) {
 			result = read;
@@ -1974,6 +1975,8 @@
 
 	drop_nonexclusive_access(unix_file_inode_data(inode));
 	up_read(&reiser4_inode_data(inode)->coc_sem);
+
+	txn_restart_current();
 
 	reiser4_exit_context(&ctx);
 	return page;

--=-O0LXcd2su6Ke3XRbEFXy--

