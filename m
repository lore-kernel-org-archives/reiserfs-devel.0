From: Andi Kleen <ak@suse.de>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: 03 Mar 2004 03:39:26 +0100
Sender: ak@suse.de
Message-ID: <p73ptbu4psx.fsf@brahms.suse.de>
References: <4044119D.6050502@andrew.cmu.edu>
	<4044366B.3000405@namesys.com>
	<4044B787.7080301@andrew.cmu.edu>
	<1078266793.8582.24.camel@mentor.gurulabs.com>
	<20040302224758.GK19111@khan.acc.umu.se>
	<40453538.8050103@animezone.org>
	<20040303014115.GP19111@khan.acc.umu.se>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040303014115.GP19111@khan.acc.umu.se.suse.lists.linux.kernel>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Weinehall <david@southpole.se>
Cc: Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

David Weinehall <david@southpole.se> writes:

> On Tue, Mar 02, 2004 at 08:30:32PM -0500, Andrew Ho wrote:
> > XFS is the best filesystem.
> 
> Well it'd better be, it's 10 times the size of ext3, 5 times the size of
> ReiserFS and 3.5 times the size of JFS.

I think your ext3 numbers are off, most likely you didn't include JBD. 

> And people say size doesn't matter.

A lot of this is actually optional features the other FS don't have,
like support for separate realtime volumes and compat code for old 
revisions, journaled quotas etc. I think you could
relatively easily do a "mini xfs" that would be a lot smaller. 

But on today's machines it's not really an issue anymore.

-Andi
