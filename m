From: Mats Hulten <mahu@ffs.gu.se>
Subject: How do I recover lost data?
Date: Sun, 23 Nov 2003 23:59:01 +0100
Message-ID: <3FC13BB5.108@ffs.gu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16149-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

My system froze up, and it turned out to be my reiserfs file system that 
had gone bad.
I reebooted with the install disks and ran fsck and then reiserfsck 
--rebuild-tree.
Everything seemed to have worked out just fine, and I could again mount 
the partition, but all data seems to be gone.

All thats left is the /lost+found directory.
df prints that the hdd is 75% full wich is correct.

What can I do to recover the data?

-Mats

