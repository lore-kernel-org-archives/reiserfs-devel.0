From: John Richard Moser <nigelenki@comcast.net>
Subject: Interesting deletion idea
Date: Fri, 08 Oct 2004 01:55:19 -0400
Message-ID: <41662BC7.80309@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I'm not subscribed, CC me replies please.

It would be interesting to add an erasure hook into ReiserFS or Reiser4,
and add erasure algorithms to the kernel to apply to memory mapped
lengths of disk.  For example:


{
~  void *p;
~  p = mmap_disk_segment(start, length);
~  kernel_erase(&alg, p, length);
~  munmap_segment(p);
}

Yeah, really cheap block of pseudocode >:P

Anyway, the idea is that to erase things off the disk (deleted files,
moved data, journal transactions, etc), the following logic could be
applied:

~ - Segment of disk becomes invalid
~ - mmap() segment of disk into memory
~ - pass segment and length to erasure function
~ - Unmap segment

It'd be fun to be able to mount -o remount,erase=gutman / and have the
gutman algorithm erase everything.  It may be interesting to get the
journal to work around parts of the journal being erased, and to do
other things in an attempt to allow heavy erasure algorithms (Gutman is
a 34 pass alg IIRC) to function without slowing operations down visibly.

The most important part of this would be to add hooks inside and outside
of ReiserFS.  The kernel should supply the erasure mechanisms so that
all filesystems can take advantage of them.  Because erasure is . . .
well, erasure. . . this would not be filesystem dependent.

The erasure should probably only apply to relavent parts of disk.  Inode
information, for example, would be pointless; journal transactions, file
data, and directory entries, on the other hand, are all possible
sensitive information; the filename may be sensitive data (directory entry).

The downside to such erasure is that it would place areas containing
meta-data at risk.  For example, erasing directory entries places the
directory at risk, as there may be junk left in that area if the system
goes down.

To avoid damage, transactions storing meta-data should erase the target
area just before being flushed.  This way, if the system goes down, it
will come back up and allow the transaction to erase the area and then
flush, creating no risk for an inconsistent state.  The flush MUST be
done when the system comes back up to give a 100% guarantee that the
data was properly destroyed.

Transactions are marked as "finished" when completed.  After marking
them as finished, they should be erased with the erasure hooks.  If
there is a failure at this point, then the journal replay will see a
"finished" transaction and repeat the erasure, again to ensure that the
data is actually destroyed.

Buffering multiple overwrites of the same area and applying them in a
sane and orderly manner may allow you to catch rapid, repeted overwrites
of disk areas and wait until several have gone by before actually
applying them.  This would allow you to avoid some of the overhead of
attempting to destroy overwritten data.

It should also be considered that when files are deleted, the file data
should be erased.  The transaction should note *all* disk areas
containing that file's data so that they can be appropriately erased.
The transaction should not be marked as finished until the system has
completed an erasure pass on the file data.  Multiple transactions may
be used to incrimentally destroy pieces of large files upon deletion.

That's probably not everything, but that's all I can think of.  All
design problems and architectural issues are beyond me.


- --
All content of all messages exchanged herein are left in the
Public Domain, unless otherwise explicitly stated.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBZivGhDd4aOud5P8RAvvHAJ9iBGswntJPxnbop0iWzuePnm1nSgCffufU
e6YLURiMM2fOta2SGQmRCd4=
=jQuG
-----END PGP SIGNATURE-----
