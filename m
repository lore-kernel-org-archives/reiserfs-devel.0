From: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 03 Mar 2004 10:43:53 +0100
Message-ID: <1078307033.904.1.camel@teapot.felipe-alfaro.com>
References: <4044119D.6050502@andrew.cmu.edu>
	 <40453538.8050103@animezone.org> <20040303014115.GP19111@khan.acc.umu.se>
	 <200403030700.57164.robin.rosenberg.lists@dewire.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403030700.57164.robin.rosenberg.lists@dewire.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robin Rosenberg <robin.rosenberg.lists@dewire.com>
Cc: David Weinehall <david@southpole.se>, Andrew Ho <andrewho@animezone.org>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

On Wed, 2004-03-03 at 07:00, Robin Rosenberg wrote:
> On Wednesday 03 March 2004 02:41, David Weinehall wrote:
> > On Tue, Mar 02, 2004 at 08:30:32PM -0500, Andrew Ho wrote:
> > > XFS is the best filesystem.
> > 
> > Well it'd better be, it's 10 times the size of ext3, 5 times the size of
> > ReiserFS and 3.5 times the size of JFS.
> > 
> > And people say size doesn't matter.
> 
> Recoverability matters to me. The driver could be 10 megabyte and
> *I* would not care. XFS seems to stand no matter how rudely the OS
> is knocked down.

But XFS easily breaks down due to media defects. Once ago I used XFS,
but I lost all data on one of my volumes due to a bad block on my hard
disk. XFS was unable to recover from the error, and the XFS recovery
tools were unable to deal with the error.

