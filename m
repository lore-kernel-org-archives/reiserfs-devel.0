From: Phil Howard <phil-reiserfs@ipal.net>
Subject: remounting r/o with mapped and deleted files
Date: Sat, 25 May 2002 14:37:34 -0500
Message-ID: <20020525193734.GB16919@vega.ipal.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10416-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

When a file is memory mapped into a process space (e.g. executable,
library, data, etc), and deleted, the data blocks for that file
must still remain reserved so they can be swapped in as needed.
If the filesystem is then remounted r/o, there is a conflict.  In
ext2, this is resolved by disallowing the remount r/o in much the
same way as disallowing an unmount when anything is mapped or open.

I find this doesn't happen with reiserfs.  So I am concerned.  What
I'd like to know is whether or not reiserfs is really doing this
because it can handle the situation correctly, or if this is a bug.

Consider the sequence of events:
1.  A program maps in a dynamic library from a reiserfs filesystem
2.  The filesystem is remounted read/only
3.  The program exits leaving no more references to the deleted file
4.  The filesystem remounted read/write
Is the space for the deleted file now available?

Consider a slightly different sequence of events:
4.  The system is gracefully shutdown while that filesystem is read/only

Or consider even this slightly different sequence of events:
4.  The system is hard reset while that filesystem is read/only

At some point, the data blocks for that deleted file must be recovered.
In the third sequence, the most difficult, the only opportunity I see
for this to happen is that during the original unlink when the on-disk
reference count (not including in-kernel-only references, such as a
process mapping), the fact of this delete was written into a special
journal that would NOT be played out yet (because it's not yet time to
actually clean out the blocks), but finally had to be played out later
when the system comes back up and the filesystem is remounted.

So how does reiserfs do this?

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://phil.ipal.org/     |
-----------------------------------------------------------------
