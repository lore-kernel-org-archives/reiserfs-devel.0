From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 10:41:47 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0309131039450.32678-100000@localhost.localdomain>
References: <3F632446.30004@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15651-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F632446.30004@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Reiser FS mailing list <reiserfs-list@namesys.com>

On Sat, 13 Sep 2003, Hans Reiser wrote:

> did you adjust our headers to be redhat compatible?  If not, please do.

i didn't see anything in the READ.ME about adjusting headers, but would
this also explain why, if i build reiser 4 support directly into the 
kernel, my "make modules_install" works fine, but if i make it modular,
i get

WARNING: /lib/modules/2.6.0-test5-bk3/kernel/fs/reiser4/reiser4.ko needs unknown symbol balance_dirty_pages
WARNING: /lib/modules/2.6.0-test5-bk3/kernel/fs/reiser4/reiser4.ko needs unknown symbol max_sane_readahead
WARNING: /lib/modules/2.6.0-test5-bk3/kernel/fs/reiser4/reiser4.ko needs unknown symbol __remove_from_page_cache
WARNING: /lib/modules/2.6.0-test5-bk3/kernel/fs/reiser4/reiser4.ko needs unknown symbol generic_sync_sb_inodes
WARNING: /lib/modules/2.6.0-test5-bk3/kernel/fs/reiser4/reiser4.ko needs unknown symbol truncate_mapping_pages_range
WARNING: /lib/modules/2.6.0-test5-bk3/kernel/fs/reiser4/reiser4.ko needs unknown symbol balance_dirty_pages_ratelimited
WARNING: /lib/modules/2.6.0-test5-bk3/kernel/fs/reiser4/reiser4.ko needs unknown symbol inodes_stat
WARNING: /lib/modules/2.6.0-test5-bk3/kernel/fs/reiser4/reiser4.ko needs unknown symbol nr_free_pagecache_pages
WARNING: /lib/modules/2.6.0-test5-bk3/kernel/fs/reiser4/reiser4.ko needs unknown symbol destroy_inode


  just curious.  haven't rebooted under the new kernel yet, but i'd like 
to clear up the above before i do that.  thanks.

rday

