From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-2.6.36
Date: Sun, 21 Nov 2010 02:31:32 +0100
Message-ID: <4CE87674.4090909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Changes since 2.6.35:

. Fixed ->write_end() method: the old one didn't update i_size, and this
  resulted in empty files and "orphan" items. The problem took place only
  for splice users (loop devices, pipe2, etc).

. Implemented ->sync_fs() method of super operations. Since introducing a
  new per-bdi flushing stuff reiser4 wasn't able to perform sync on umount.
  Now such sync is performed by reiser4_sync_fs().

. Fixed an old bug which led to non-deletable directories.

. Fixed an old bug in tail conversion, which led to data corruption when
  running in disk space pressure situations.

Please, find at
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/

Thanks,
Edward.
