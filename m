From: Brian Tinsley <btinsley@emageon.com>
Subject: Filesystem Corruption
Date: Thu, 05 Sep 2002 10:57:09 -0500
Message-ID: <3D777ED5.6050806@emageon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11377-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

We had problems on a production filesystem, apparently from a machine 
crash. I ran reiserfsck (vers. 3.6.3) on this filesystem and received a 
message that one corruption can only be fixed during --rebuild-tree. My 
question is if I do this, is there any chance of data loss or will the 
filesystem be safely repaired? I've never had to do anything but a 
simple --fix-fixable before (without any problems).


-- 
Brian Tinsley
Chief Systems Engineer
Emageon


