From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)
Date: Mon, 21 Aug 2006 18:44:23 -0400
Message-ID: <200608211844.24443.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Reply-To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29642-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


This one hasn't recurred, so I don't have a stack trace. I haven't
looked into it.
(2.6.18-rc4-mm1)

reiser4 panicked cowardly: reiser4[patch(9302)]: reiser4_set_page_dirty_internal
 (fs/reiser4/page_cache.c:475)[]:
assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)
Kernel panic - not syncing: reiser4[patch(9302)]: reiser4_set_page_dirty_interna
l (fs/reiser4/page_cache.c:475)[]:
assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)

Andrew Wade
