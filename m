From: Asheesh Laroia <asheesh@asheesh.org>
Subject: Broken ReiserFS v. 3.5 on bad-block disk
Date: Sun, 08 Sep 2002 02:04:32 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0209080149430.1865-100000@res194-239-140>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11401-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I had a ReiserFS system, installed by SuSE 6.4, now running on Linux
2.4.4.  It's a version 3.5 filesystem.

I noticed that the system began to experience frequent crashes and I/O
errors, so I shut it down and tried to analyze it from another computer.
I followed the instructions at http://namesys.com/bad-block-handling.html,
but I had problems recovering the data.  Because there was already a
filesystem on the disk, I wanted to use that filesystem instead of making
a new one as recommended.

I tried to mount the filesystem on a kernel 2.4.18 system; it failed with
the following kernel messages:

	reiserfs: checking transaction log (device 03:43) ...
	Warning, log replay starting on readonly filesystem
	hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
	hdb: dma_intr: error=0x40 { UncorrectableError }, LBAsect=352371, sector=47128
	end_request: I/O error, dev 03:43 (hdb), sector 47128
	journal-1212: REPLAY FAILURE fsck required! buffer write failed
	Replay Failure, unable to mount
	reiserfs_read_super: unable to initialize journal space
	hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
	hdb: dma_intr: error=0x40 { UncorrectableError }, LBAsect=352371, sector=47136
	end_request: I/O error, dev 03:43 (hdb), sector 47136

I found that an older series of reiserfscks had the option to replay the
journal in userspace, so I downloaded an older version to get this output:

	<-----------REISERFSCK, 2000----------->
	ReiserFS version 3.5.26
	Will read-only check consistency of the partition
	Will replay just like mounting would
	Will stop after journal replay
	Do you want to run this program?[N/Yes] (note need to type Yes):Yes
	Replaying journal..ok
	Checking S+tree../  1 (of  17)/ 36 (of 119)/160 (of 163)
	left keys don't match [12669 775196 1545048960(0) 500], [12669 775196 1593014528(0) 500]
	Run reiserfsck with --rebuild-tree

I would simply rebuild the tree, but the filesystem does not know about
the bad blocks.  I cannot mount the filesystem and assign the blocks as
used because mounting requires the journal to be replayed, which fails
because of the bad blocks.

There are not many bad blocks, as can be seen in the badblocks output
below.  These blocks are, however, interfering with the journal replay.

So, is there a mount option to skip the journal replay, and would that be
a good idea?  Is there some debugreiserfs output I can provide that would
be of use?  What is the appropriate course of action to take here to step
around this Catch 22?

Thanks for taking the time to read this message.

-- Asheesh Laroia.

Appendix: badblocks output from
	/sbin/badblocks -b 4096 /dev/hdb3 > hdb3_badblocks

<BEGIN>
5880
5881
5882
5883
5884
5885
5886
5887
5888
5889
5890
5891
5892
<END>


