From: <mail@viliar.net.ru>
Subject: 2.6.16+reiser4+openvz patches = error.
Date: Tue, 11 Jul 2006 22:18:21 +0400
Message-ID: <web-9729233@inc.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28950-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@namesys.com>

Hello All!


I'm trying to compile 2.6.16 kernel with this openvz patch:
(http://download.openvz.org/kernel/devel/026test015.1/patches/patch-026test015-combined.gz) 
(changes: http://openvz.org/news/updates/devel-kernel-026test015.1)

and with reiser4-for-2.6.16-4.patch.gz.

Patching is finished without errors, but in process of compilation (reiser4 - module) I get those
errors:
 
 CC [M]  fs/reiser4/plugin/object.o
fs/reiser4/plugin/object.c:96: warning: initialization from incompatible pointer type
fs/reiser4/plugin/object.c:208: warning: initialization from incompatible pointer type
fs/reiser4/plugin/object.c:254: warning: initialization from incompatible pointer type
fs/reiser4/plugin/object.c:300: warning: initialization from incompatible pointer type
fs/reiser4/plugin/object.c:392: warning: initialization from incompatible pointer type
fs/reiser4/plugin/object.c:452: warning: initialization from incompatible pointer type
  CC [M]  fs/reiser4/plugin/cluster.o
  CC [M]  fs/reiser4/plugin/inode_ops.o
fs/reiser4/plugin/inode_ops.c: In function 'permission_common':
fs/reiser4/plugin/inode_ops.c:416: error: too few arguments to function 'generic_permission'
make[2]: *** [fs/reiser4/plugin/inode_ops.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

Is where any ideas, why it could be?


Thank you.




A.

-------------

"Hic Jacet Ego"
