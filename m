From: Kristian =?iso-8859-15?q?K=F6hntopp?= <kris@koehntopp.de>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Thu, 4 Mar 2004 10:28:07 +0100
Message-ID: <200403041028.07235.kris@koehntopp.de>
References: <4044119D.6050502@andrew.cmu.edu> <200403031059.26483.robin.rosenberg.lists@dewire.com> <1078309141.863.3.camel@teapot.felipe-alfaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078309141.863.3.camel@teapot.felipe-alfaro.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>, Robin Rosenberg <robin.rosenberg.lists@dewire.com>
Cc: David Weinehall <david@southpole.se>, Andrew Ho <andrewho@animezone.org>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

On Wednesday 03 March 2004 11:19, Felipe Alfaro Solana wrote:
> The problem is that I couldn't save anything: the XFS volume refused to
> mount and the XFS recovery tools refused to fix anything. It was just a
> single disk bad block. For example in ext2/3 critical parts are
> replicated several times over the volume, so there's minimal chance of
> being unable to mount the volume and recover important files.

That is a misconception. What is being replicated multiple times in ext2 is 
the superblock and the block group descriptors. But these are not really 
needed for recovery (as long as they have default values, which is the case 
in the vast majority of installations).

What is not being replicated is the block allocation bitmap, inode allocation 
bitmap and the inodes themselves.

By running "mke2fs -S" on a ext2 file system, you will rewrite all 
superblocks, all block group descriptors, and all allocation bitmaps, but 
leave the inodes themselves intact. You can recreate the filesystem from that 
with e2fsck, proving that the information from the replicated parts of the 
file systems is not really necessary. All that e2fsck needs to recover the 
system is the information from the inodes. If they are damaged (and they are 
not replicated), the files having inodes in damaged blocks cannot be 
recovered.

Kristian

