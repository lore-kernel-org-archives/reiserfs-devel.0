From: "Mike Gigante" <mg@sgi.com>
Subject: RE: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 3 Mar 2004 21:24:10 +1100
Sender: linux-xfs-bounce@oss.sgi.com
Message-ID: <KHEHKKKAAILFJGJCHDCAAEFFEKAA.mg@sgi.com>
References: <200403031059.26483.robin.rosenberg.lists@dewire.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-xfs-bounce@oss.sgi.com>
In-Reply-To: <200403031059.26483.robin.rosenberg.lists@dewire.com>
Errors-to: linux-xfs-bounce@oss.sgi.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robin Rosenberg <robin.rosenberg.lists@dewire.com>, Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Cc: David Weinehall <david@southpole.se>, Andrew Ho <andrewho@animezone.org>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com


On Wednesday 03 March 2004 10:43, Felipe Alfaro Solana wrote:
> But XFS easily breaks down due to media defects. Once ago I used XFS,
> but I lost all data on one of my volumes due to a bad block on my hard
> disk. XFS was unable to recover from the error, and the XFS recovery
> tools were unable to deal with the error.

A single bad-block rendered the entire filesystem non-recoverable 
for XFS? Sounds difficult to believe since there is redundancy such
as multiple copies of the superblock etc.

I can believe you lost *some* data, but "lost all my data"??? -- I 
believe that you'd have to had had *considerably* more than 
"a bad block" :-)

Mike


