From: Oleg Drokin <green@namesys.com>
Subject: Re: journal-2018 trouble?
Date: Tue, 25 Mar 2003 17:24:48 +0300
Message-ID: <20030325172448.A8645@namesys.com>
References: <200303242255.48998.gustavo@zacarias.com.ar> <20030325093230.A32093@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13381-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030325093230.A32093@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: reiserfs-list@namesys.com, grev@namesys.com

Hello!

On Tue, Mar 25, 2003 at 09:32:30AM +0300, Oleg Drokin wrote:

> Please either do not apply this patch or follow the rebuild-sb advance (it will ask you
> if you want to update journal paremreters and you should agree).
> I will come up with the fix shortly.

Ok, here's supposed fix.
If you have not did rebuild-sb, you might want to try it.

(for those using data-logging patches, you do not need this patch as it does correct thing already).

Bye,
    Oleg

===== fs/reiserfs/journal.c 1.26 vs edited =====
--- 1.26/fs/reiserfs/journal.c	Thu Mar 13 14:52:15 2003
+++ edited/fs/reiserfs/journal.c	Tue Mar 25 16:38:55 2003
@@ -1401,7 +1401,7 @@
 		     *newest_mount_id) ;
       return -1 ;
     }
-    if ( le32_to_cpu(desc->j_len) > sb_journal_trans_max(SB_DISK_SUPER_BLOCK(p_s_sb)) ) {
+    if ( le32_to_cpu(desc->j_len) > JOURNAL_TRANS_MAX ) {
       reiserfs_warning("journal-2018: Bad transaction length %d encountered, ignoring transaction\n", le32_to_cpu(desc->j_len));
       return -1 ;
     }
