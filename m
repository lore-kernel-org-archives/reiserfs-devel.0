From: Christophe Saout <christophe@saout.de>
Subject: reiser4: getattr / 64 bit kdev_t
Date: Tue, 26 Aug 2003 23:12:15 +0200
Message-ID: <1061932335.32241.21.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15443-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi!

I'm just hunting down a bug where reiser4 swallows the major number of
block/char special files when using the 64 bit kdev_t patch in Andrew's
-mm tree (which is going to be included into the mainstream kernel
soon). Apart from that reiser4 is apparently assigning device numbers to
an int somewhere (?) this should not happen because the dev_t is (while
64 bit now) designed to be backward compatible (see at the modified
linux/kdev_t.h).

Apart from that I stumbled over the following line in
fs/reiser4/plugin/object.c:

stat->blocks = (inode_get_bytes(obj) + VFS_BLKSIZE) >> VFS_BLKSIZE_BITS;

Isn't this supposed to be

stat->blocks = (inode_get_bytes(obj) + VFS_BLKSIZE - 1)
               >> VFS_BLKSIZE_BITS;

? (at least the generic implementation suggests this)

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html

