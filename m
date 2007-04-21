From: Nick Piggin <npiggin@suse.de>
Subject: 2.6.21-rc7 new aops patchset
Date: Sat, 21 Apr 2007 16:32:04 +0200
Message-ID: <20070421143200.GA23326@wotan.suse.de>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Filesystems <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Fasheh <mark.fasheh@oracle.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com

http://www.kernel.org/pub/linux/kernel/people/npiggin/patches/new-aops/

2.6.21-rc7-new-aops*

New aops patchset against 2.6.21-rc7. I was going to rebase against
-mm and submit the patchset, but I ended up doing quite a lot of new
filesystem conversions and fixes so I stay with mainline so as to
not introduce so much churn.

The plan is to next rebase against rc6-mm1 and submit all 47 patches
to linux-fsdevel and Andrew Morton to be merged. OK? Should each fs
conversion also go to the filesystem specific maintainer/list?

I have done some testing, but I would like testing and revuew abd acks
from filesystem maintainers.  Lots of filesystems I can't or don't know
how to mount and test. Well that is a copout, but it is a hassle for me
to do so many when presumably maintainers will have a test setup ready
to go. And I have tried to minimise the load on maintainers by doing most
conversions myself.

cc'ed reiserfs lists: could somebody volunteer to do the resierfs
conversion? It's too complex for me to do a reasonable job, and reiserfs
prepare_write also does weird things with generic_cont_expand which is
hard to follow (this could be made much simpler by using the
AOP_FLAG_CONT_EXPAND I added there -- can you also look at using that, or
let me know why it doesn't work).

Changes:
- Cut perform_write batch AOP out of this series. It will be back, in
  a future discussion. Kept the iov_iter stuff because it's nice anyway.

- Added patch to inject short or zero length pagecache writes to better
  exercise filesystems. Another one to poision new and !uptodate buffers.

- Kept the old ocfs2 patch from Mark, so I don't have to suck up
  git-ocfs2.patch which keeps patch size down. I'll use Mark's new patch
  when rebasing to -mm.

- ext4 patch from Badari.

- Fixed ext3 data=journal (and the copied code in ext4).

- Converted cifs + fixed information leak.

- Converted udf seem to have fixed pagecache corruption(?) -- page was marked
  uptodate when it is not. Also, fixed the silly setup where prepare_write
  was doing a kmap to be used in commit_write: just do kmap_atomic in
  write_end.

- Fixed some earlier problems with my ext2 multi-page directory handling.

- Had a crack at converting all the others. reiserfs is the only one left
  unconverted!

- Tested (under UML, loopback, PAGE_SIZE=4096) with fsx-linux the following:
  ext2 (bs=1024,4096)
  ext3 (bs=1024,4096; data=writeback,ordered,journal)
  minix (v2,3)
  xfs (bs=1024,4096)
  fuse (with ssh,passthough fs -- note fsx-linux fails as expected)
  jfs
  reiserfs (bs=1024,4096) (unconverted)
  vfat (bs=1024,4096)
  tmpfs
  rd (with ext2)
  hostfs (it now survives much longer than with the old code!)
  nfs

Nick
