From: Suzuki <suzuki@in.ibm.com>
Subject: [BUG] Reiserfs: reiserfs_panic while running fs stress tests
Date: Fri, 05 May 2006 10:22:21 +0530
Message-ID: <445ADA05.5000801@in.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28560-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-dev@namesys.com, lkml <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com
Cc: akpm@osdl.org, suparna <suparna@in.ibm.com>, amit <amitarora@in.ibm.com>

Hi,


I was working on a reiserfs panic with 2.6.17-rc3, while running fs
stress tests.

The panic message looked like :

" REISERFS: panic (device Null superblock): reiserfs[4248]: assertion
!(truncate && (REISERFS_I(inode)->i_flags & i_link_saved_truncate_mask)
) failed at fs/reiserfs/super.c:328:add_save_link: saved link already re
exists for truncated inode 13b5a "

------ Summary of the problem -----------

Reiserfs uses "safe links" ( directory entries with some special key
value) to keep track of "truncated" or "unlinked" files to ensure
integrity across crashes.

Whenever there is a truncate/unlink on a file, Reiserfs creates a safe
link for the same and deletes the same once the operation is complete.
If the machine crashes before committing the operation, whenever the fs
is mounted next time, the fs will look for the saved links ( easy to
find out, since they have special key) and commit the operation that was
unfinished.


The problem here occurs as follows:

  Whenever there is an extending DIO write operation, the fs would
create a safe link so as to ensure the file size consistent, if there is
crash in between the DIO. This will be deleted once the write operation
finishes.

  If the DIO write happens to go through a "HOLE" region in the file, it
will fall into normal "buffered write", which is done  through the
address space operations prepare_write() & commit_write(). Now, the
prepare_write() might allocate blocks for the file (if needed). So if
there is some error at a later point (say ENOSPC) in prepare_write(), we
need to discard the allocated blocks. This is done by calling
"vmtruncate()" on the file. This call leads to reiserfs specific
truncate, which would try to add a save link for the file.

This addition causes a reiserfs_panic, since there is already a "save
link" stored for the file.


Any thoughts on how to fix this ?


thanks,

Suzuki K P
Linux Technology Centre,
IBM Software Labs.






