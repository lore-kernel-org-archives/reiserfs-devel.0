From: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 03 Mar 2004 11:19:01 +0100
Message-ID: <1078309141.863.3.camel@teapot.felipe-alfaro.com>
References: <4044119D.6050502@andrew.cmu.edu>
	 <200403030700.57164.robin.rosenberg.lists@dewire.com>
	 <1078307033.904.1.camel@teapot.felipe-alfaro.com>
	 <200403031059.26483.robin.rosenberg.lists@dewire.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17039-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403031059.26483.robin.rosenberg.lists@dewire.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robin Rosenberg <robin.rosenberg.lists@dewire.com>
Cc: David Weinehall <david@southpole.se>, Andrew Ho <andrewho@animezone.org>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

On Wed, 2004-03-03 at 10:59, Robin Rosenberg wrote:
> On Wednesday 03 March 2004 10:43, Felipe Alfaro Solana wrote:
> > But XFS easily breaks down due to media defects. Once ago I used XFS,
> > but I lost all data on one of my volumes due to a bad block on my hard
> > disk. XFS was unable to recover from the error, and the XFS recovery
> > tools were unable to deal with the error.
> 
> What file systems work on defect media? 

It's not a matter of working: it's a matter of recovering. A bad disk
block could potentially destroy a file or a directory, but shouldn't
make a filesystem not mountable nor recoverable.

> As for crashed disks I rarely bothered trying to "fix" them anymore. I save
> what I can and restore what's backed up and recovery tools (other than
> the undo-delete ones) usually destroy what's left, but that's not unique to
> XFS. Depending on how good my backups are I sometimes try the recovery
> tools just to see, but that has never helped so far.

The problem is that I couldn't save anything: the XFS volume refused to
mount and the XFS recovery tools refused to fix anything. It was just a
single disk bad block. For example in ext2/3 critical parts are
replicated several times over the volume, so there's minimal chance of
being unable to mount the volume and recover important files.

