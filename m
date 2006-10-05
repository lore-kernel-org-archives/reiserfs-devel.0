From: Eric Sesterhenn <snakebyte@gmx.de>
Subject: Dereference in fs/reiserfs/bitmap.c
Date: Thu, 05 Oct 2006 12:50:02 +0200
Message-ID: <1160045402.6153.6.camel@alice>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30000-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

hi,

coverity spotted another dereference in the reiser code,
which i am able to verify, but not sure how to fix:


1305 		bh = sb_bread(sb, block);
1306 		if (bh == NULL)
1307 			reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%lu) "
1308 			                 "reading failed", __FUNCTION__, bh->b_blocknr);

if bh is NULL, we dereference it in the warning as bh->b_blocknr.
Maybe one of you guys knows what warning is useful to print in this
case and can cook up a patch for this.

Thanks, Eric

