From: Andreas Happe <andreashappe@gmx.net>
Subject: [reiser4] sub_from_sb_unallocated - error [zam528]
Date: Wed, 6 Nov 2002 19:16:04 +0100
Sender: news <news@main.gmane.org>
Message-ID: <slrnasin32.45l.andreashappe@marvin.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11934-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

my computer crashed while copying a kernel tree from a reiserfs to a
reiser4 partition with the following message:

| Kernel panic: reiser4 panicked cowardly: <0> reiser4 [(pdflush(7)]:
| sub_from_sb_unallocated (fs/reiser4/block_alloc.c:161) [zam-528]

there are no new files on the reiser4 partition.

i'm using debian unstable, kernel 2.5.46 with reiser4 patch from
5.11.2002.

Andreas


