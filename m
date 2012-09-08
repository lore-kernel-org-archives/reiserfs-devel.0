From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-3.5
Date: Sat, 08 Sep 2012 22:51:26 +0200
Message-ID: <504BAFCE.7@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, =?UTF-8?B?TWFyY2luIEJhY3p5xYRz?= =?UTF-8?B?a2k=?= <marbacz@gmail.com>

Hello everyone.

Please, find at
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/

Changes since 2.6.39:

Marcin Baczy=C5=84ski :

=2E Port reiser4-for-2.6.39 to 3.2

Ivan Shapovalov :

=2E Adjust reiser4-for-3.2 to 3.5;
=2E Use umode_t as file mode type;
=2E show_options() takes dentry;
=2E Use d_make_root() instead of d_alloc_root();
=2E Use clear_inode() instead of end_writeback();
=2E Adjust to changes in encode_fh() API;
=2E lock ->i_mutex in reiser4_sync_file_common();
=2E Introduce INODE_{INC,DROP,CLEAR,SET}_NLINK macros,
   which use library function for i_nlink manipulations;
=2E Do not make reiser4_permission_common() bail out on
   rcu-walk;
=2E Don't clear nlink in reiser4's do_create_vfs_child().

Edward Shishkin :

=2E Reserve space in reiser4_write_begin() properly.
   Fix deadlock (reiser4 lock ordering violation):
   release page lock in reiser4_dirty_inode() before
   acquiring a longterm lock;


                  Current status


The bug in the balancing primitive INSERT_FLOW (which
led to inconsistent key ordering) is not yet fixed.
So the following features can lead to data corruption:

=2E tail packing in the default file plugin;
=2E transparent compression.

=46sck will fix everything, however, it can be rather
annoying to check production systems frequently..

Thanks,
Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
