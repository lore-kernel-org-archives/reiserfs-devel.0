From: Piotr Neuman <sikkh@wp.pl>
Subject: Kernel error messages
Date: Mon, 29 Dec 2003 22:37:05 +0100
Message-ID: <200312292237.05560.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16417-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List@Namesys.COM

Got following kernel messages:
reiser4[ktxnmgrd:run(349)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1167)[nikita-3176]:
WARNING: Flushing like mad: 16384
reiser4[ktxnmgrd:run(349)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1167)[nikita-3176]:
WARNING: Flushing like mad: 32768
reiser4[ktxnmgrd:run(349)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1167)[nikita-3176]:
WARNING: Flushing like mad: 65536
reiser4[ktxnmgrd:run(349)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1167)[nikita-3176]:
WARNING: Flushing like mad: 131072
reiser4[ktxnmgrd:run(349)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1167)[nikita-3176]:
WARNING: Flushing like mad: 262144
reiser4[ktxnmgrd:run(349)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1167)[nikita-3176]:
WARNING: Flushing like mad: 524288
reiser4[ktxnmgrd:run(349)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1167)[nikita-3176]:
WARNING: Flushing like mad: 1048576
reiser4[ktxnmgrd:run(349)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1167)[nikita-3176]:
WARNING: Flushing like mad: 2097152
reiser4[ktxnmgrd:run(349)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1167)[nikita-3176]:
WARNING: Flushing like mad: 4194304
reiser4[ktxnmgrd:run(349)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1167)[nikita-3176]:
WARNING: Flushing like mad: 8388608

Kernel did not crash. Kernel: 2.6.0 + reiser4-2003.12.23.all.diff.

