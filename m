From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: Re: [nikita-3002]: assertion failed: carry_level_invariant(doing, CARRY_DOING)
Date: Sun, 6 Aug 2006 22:24:43 -0400
Message-ID: <200608062224.43728.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200608021749.30205.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608030851.30457.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608031928.25155.zam@namesys.com>
Reply-To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29522-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608031928.25155.zam@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alexander Zarochentsev <zam@namesys.com>

Hello,

I have had another assertion fail. This one is with 2.6.18-rc2-mm1 +
the fix in reiser4_releasepage. This was on a filesystem that had not
been unmounted cleanly. (2.6.18-rc3-mm1 crashed on me). 

reiser4 panicked cowardly: reiser4[ktxnmgrd:hdb1:r(1977)]: sibling_list_remove (fs/reiser4/tree_walk.c:813)[zam-32245]:
assertion failed: keyeq(znode_get_rd_key(node), znode_get_ld_key(node->right))
Kernel panic - not syncing: reiser4[ktxnmgrd:hdb1:r(1977)]: sibling_list_remove (fs/reiser4/tree_walk.c:813)[zam-32245]:
assertion failed: keyeq(znode_get_rd_key(node), znode_get_ld_key(node->right))

The next boot had this diagnostic:
reiser4[kde-config(3707)]: present_lw_sd (fs/reiser4/plugin/item/static_stat.c:276)[]:
WARNING: partially converted file is encountered
and is continuing to work fine. I have not yet fscked the filesystem.

I hope this helps,
Andrew Wade
