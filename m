From: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Subject: disk damage test
Date: Sat, 6 Apr 2002 10:36:32 +0300 (EEST)
Message-ID: <Pine.LNX.4.44.0204061014210.571-100000@idi.vamo.orbitel.bg>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I made a simple test to compare how reiserfs and ext3 survive disk damage.
The test was on loop device. To simulate disk bad blocks I wrote "0" in
random positions in the file that was used for loop.

Reiserfs is very sensitive to disk damage. Several bad blocks on disk can
make the entire file system unusable and all data to be lost:
'reiserfsck --fix-fixable' tells that I must use --rebuild-tree but it
doesn't help.

On the contrary ext3 survives major disk damages. After running fsck
two times much of the broken files and dirs are placed in lost+found
and almost all data is recovered.

Regards
Ivan


