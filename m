From: Matt Stegman <matts@ksu.edu>
Subject: reiser4 metas/bmap problem
Date: Wed, 28 Jul 2004 18:26:01 -0500 (CDT)
Message-ID: <Pine.GSO.4.44L.0407281754290.11129-100000@unix2.cc.ksu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19847-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

I'm finally taking the time to start testing reiser4, and I'm running into
something odd.  Some of the time, reiser4 doesn't report a file's blocks
until I run 'sync'.  This shows up in metas/bmap as many blocks are
reported as 0.

# dd if=/dev/zero of=/mnt/reiser4/file bs=1M count=50
50+0 records in
50+0 records out
# chmod +x /mnt/reiser4/file
# grep '^0$' /mnt/reiser4/file/metas/bmap | wc -l
1792
# sleep 100
# grep '^0$' /mnt/reiser4/file/metas/bmap | wc -l
1792
# sync
# grep '^0$' /mnt/reiser4/file/metas/bmap | wc -l
0

I tried waiting to see if it gets written out in the background
asynchronously.  As you can see, it still shows up after a couple minutes,
so it doesn't appear to get written until an actual 'sync' command is run.
But it shows up inconsistently - many files don't show this.

The filefrag utility from e2fsprogs 1.35 also has problems with these
files, I believe it uses FIBMAP ioctl to get a blockmap of the file.

-- 
Matt Stegman


