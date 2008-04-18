From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-2.6.25
Date: Sat, 19 Apr 2008 03:39:08 +0400
Message-ID: <4809311C.1060707@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Reiser4 for Linux-2.6.25 is available for download:

http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/

This includes the following fixups:

. added missed reiser4_{init, exit}_context() in 
reiser4_get_dentry_parent();
. fixed leak of checkin_mutex in do_write_cryptcompress();
. fixed leak of per-inode exclusive access in write_unix_file();
. fixed leak of per-inode flag REISER4_PART_IN_CONV in tail2extent();
. added missed zload/zrelse in kill_hook_internal().

Thanks,
Edward.
