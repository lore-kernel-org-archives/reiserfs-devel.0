From: Christoph Hellwig <hch@infradead.org>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 3 Mar 2004 07:47:56 +0000
Message-ID: <20040303074756.A25861@infradead.org>
References: <4044119D.6050502@andrew.cmu.edu> <4044366B.3000405@namesys.com> <4044B787.7080301@andrew.cmu.edu> <1078266793.8582.24.camel@mentor.gurulabs.com> <20040302224758.GK19111@khan.acc.umu.se> <40453538.8050103@animezone.org> <20040303014115.GP19111@khan.acc.umu.se> <20040303014115.GP19111@khan.acc.umu.se.suse.lists.linux.kernel> <p73ptbu4psx.fsf@brahms.suse.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17029-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <p73ptbu4psx.fsf@brahms.suse.de>; from ak@suse.de on Wed, Mar 03, 2004 at 03:39:26AM +0100
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: David Weinehall <david@southpole.se>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

On Wed, Mar 03, 2004 at 03:39:26AM +0100, Andi Kleen wrote:
> A lot of this is actually optional features the other FS don't have,
> like support for separate realtime volumes and compat code for old 
> revisions, journaled quotas etc. I think you could
> relatively easily do a "mini xfs" that would be a lot smaller. 

And a whole lot of code to stay somewhat in sync with other codebases..

