From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Forked reiserfsprogs
Date: Sun, 20 Apr 2008 23:22:11 +0400
Message-ID: <480B97E3.7080008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <Vladimir.Saveliev@sun.com>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>
Cc: Ric Wheeler <ric@emc.com>

This is a recap of current situation with reiserfsprogs (from my
standpoint):

          -- 3.6.19.1
        /
3.6.19    ---- 3.6.20 --- 3.6.20.1

Descriptions:

Reiserfsprogs-3.6.19
Status: stable
Comments: This is a standard package which is used in most distros
with the ReiserFS support.

Reiserfsprogs-3.6.20
Status: stable
Comments: This contains massive cleanups and an --rebuild-tree
optimization (made by Vitaly Fertman) for specific filesystem
corruption which made reiserfsck to work extremely slow (including
the fixup for a problem which caused reiserfsck to consume to 100%
of CPU on phase 2).

Reiserfsprogs-3.6.19.1
Status: stable
Comments: This contains changes made by Jeff Mahoney (everything
got testing as a part of latest SuSE distros).

Reiserfsprogs-3.6.20.1
Status: beta???
Comments: This contains the work about improving of overall
reiserfsck performance. This work was done by Vladimir Saveliev
for EMC. NOTE: despite Vladimir forked 3.6.19, I consider it as
an update of 3.6.20 (because his improvements includes the fixups
from 3.6.20).

I am about to put the forked stuff above for wide public needs
(at kernel.org). All brunches are supposed to be merged at 3.6.21
after Vladimir's branch gets more testing.

Problems:

1. The status of Reiserfsprogs-3.6.20.1 should be clarified.
   Did the Vladimir's branch get testing?
2. I don't have Reiserfsprogs-3.6.20.1. Are there any snapshot
   on this mirror that can be put for public needs:
   ftp://ftp.icm.edu.pl/packages/linux-reiserfs ?
3. Perhaps, I will need help in addressing possible bugreports
   and the final merge of all branches.

Any comments, updates, suggestions?

Thanks,
Edward.
