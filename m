From: Frank Baumgart <frank.baumgart@esc-electronics.de>
Subject: reiserfsprogs-3.x.1b severe installation bug
Date: Thu, 11 Apr 2002 15:40:32 +0200
Sender: frank
Message-ID: <3CB59250.943A3487@esc-electronics.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

To test some own modifications to the reiserfs tools I
unpacked reiserfsprogs-3.x.1b.tar.gz and configured it
with "--prefix=/opt/reiserfs".

After "make install", indeed the man pages are installed
correctly into /opt/reiserfs/man but my SYSTEM BINARIES
in /sbin are overwritten!

The bug did not appear in around 3.0 where binaries were
installed into what --prefix told.

Regards,

Frank
