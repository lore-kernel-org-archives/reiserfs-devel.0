From: <doiggl@velocitynet.com.au>
Subject: help wanted to repair and so mount command be done to use a reiser4 volume ? [located on /dev/sdb]
Date: Sun, 18 Oct 2015 23:41:55 +1100
Message-ID: <a513052ee63b7f1e42c9d2fc9e6627c3@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

Some reiser4 metdadata problems which I need help with [located /dev/sdb].
see: http://www.spinics.net/lists/reiserfs-devel/msg04899.html

Some questions I have are these:

- help wanted to repair and so mount command be done to use a reiser4
volume ? [located on /dev/sdb]

Its a large amount of metadata.

I have a seperate 4TB hdd with its space unused.
I can format that and unpack metadata on that hdd if needed.
I can use that, to run commands against the  metadata.

Question:
--------
- What commands would get the information that would be useful to resolve
problem listed as follows ?
See http://www.spinics.net/lists/reiserfs-devel/msg04899.html

I have packed reiser4 metadata via command
# debugfs.reiser4 -P /dev/sdb  | gzip -9 > r4meta-sdb.gz

# split up to smaller chunks
# split --bytes=1800m r4meta-sdb.gz r4meta-sdb.gz-part-

Files:
1,887,436,800 r4meta-sdb.gz-part-aa
1,196,849,440 r4meta-sdb.gz-part-ab

-To join it up for use:
#cat r4meta-sdb.gz-part-aa r4meta-sdb.gz-part-ab > r4meta-sdb.gz

History
-------
http://www.spinics.net/lists/reiserfs-devel/msg03094.html

I know files and data are on disk but just cannot get to it.
Thank you for any help on accessing this volume.
Cheers Glenn
