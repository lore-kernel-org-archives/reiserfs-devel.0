From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Reiserfs kernel config description outdated
Date: Tue, 16 Nov 2004 13:32:00 +0100
Message-ID: <200411161332.00722.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


I think the sentence "Additional patches are needed
for NFS and quotas, please see <http://www.namesys.com/> for links."
should be dropped in 2.6.

Full message:
========================================================================

Reiserfs support (REISERFS_FS)

Stores not just filenames but the files themselves in a balanced
tree. Uses journaling.

Balanced trees are more efficient than traditional file system
architectural foundations.

In general, ReiserFS is as fast as ext2, but is very efficient with
large directories and small files. Additional patches are needed
for NFS and quotas, please see <http://www.namesys.com/> for links.

It is more easily extended to have features currently found in
database and keyword search systems than block allocation based file
systems are. The next version will be so extended, and will support
plugins consistent with our motto ``It takes more than a license to
make source code open.''

Read <http://www.namesys.com/> to learn more about reiserfs.

Sponsored by Threshold Networks, Emusic.com, and Bigstorage.com.

If you like it, you can pay us to add new features to it that you
need, buy a support contract, or pay us to port it to another OS.

========================================================================

-- 
lg, Chris
