From: Alexy Khrabrov <list+reiserfs@setup.org>
Subject: dd/rebuild of a small used part of a huge reiserfs on lvm?
Date: Fri, 28 May 2004 02:28:08 -0400
Message-ID: <20040528062808.GA604%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18883-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


I'd like to recover some files from a huge reiserfs file system.  It is
created above an LVM volume, which in its turn sits on a RAID.  The LVM
volume is the only one in a group which consists of the sole RAID device.
I just deleted two files in a directory I know by name, the directory is
still there.  No writing was done after the rm, except all files copied
elsewhere and diff -r'ed checked, hope that does not alter the originals.

Now I'd like to play with the dd copying of the whole reiserfs (I'm
avoiding the word partition since it covers the whole logical volume
which spans the whole RAID device).  I simply do not have space to copy
the whole RAID, but the size of the used space on this reiserfs volume was
under about 9 GB.  I wonder how can I copy just about that -- I assume it
fills the logical volume contiguously, so I can dd the first 9 GB and then
try the loopback mount/rebuild.  Now that I'm running it, it scrolls lines

pass0: reading block 20626210 failed

like crazy, perhaps up to the whole 150 GB original size declared
somewhere...

Can I use resize_reiserfs on the loopback before running rebuild?
Are there LVM methods to shrink it/copy just the used blocks in
conjunction with reiserfs?

Just curious...

-- 
Cheers,
Alexy Khrabrov :: www.setup.org :: Age Quod Agis
