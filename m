From: Nikita Danilov <Nikita@Namesys.COM>
Subject: [PATCH]: reiser4 [0/8] overview
Date: Thu, 31 Oct 2002 19:02:49 +0300
Message-ID: <15809.21545.509551.601735@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11856-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <Torvalds@Transmeta.COM>
Cc: Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello, Linus,

This message starts set of 8 patches against your current BK tree to
include reiser4.

Changes to the core code are fairly small and trivial: mostly function
exports, plus one patch to share ->journal_info pointer with Ext3.

All patches are available at http://namesys.com/snapshots/2002.10.31/,
they can be applied in any order.

Utilities, including mkfs.reiser4 are available at
http://namesys.com/snapshots/2002.10.31/reiser4progs-0.1.0.tar.gz

Nikita.
