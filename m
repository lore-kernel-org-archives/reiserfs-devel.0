From: Hans Reiser <reiser@namesys.com>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 03 Mar 2004 11:03:37 +0300
Message-ID: <40459159.1090501@namesys.com>
References: <4044119D.6050502@andrew.cmu.edu> <4044366B.3000405@namesys.com> <4044B787.7080301@andrew.cmu.edu> <1078266793.8582.24.camel@mentor.gurulabs.com> <20040302224758.GK19111@khan.acc.umu.se> <40453538.8050103@animezone.org> <20040303014115.GP19111@khan.acc.umu.se> <20040303014115.GP19111@khan.acc.umu.se.suse.lists.linux.kernel> <p73ptbu4psx.fsf@brahms.suse.de> <20040303074756.A25861@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040303074756.A25861@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@infradead.org>
Cc: Andi Kleen <ak@suse.de>, David Weinehall <david@southpole.se>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

Christoph Hellwig wrote:

>On Wed, Mar 03, 2004 at 03:39:26AM +0100, Andi Kleen wrote:
>  
>
>>A lot of this is actually optional features the other FS don't have,
>>like support for separate realtime volumes and compat code for old 
>>revisions, journaled quotas etc. I think you could
>>relatively easily do a "mini xfs" that would be a lot smaller. 
>>    
>>
>
>And a whole lot of code to stay somewhat in sync with other codebases..
>
>
>
>  
>
What is significant is not the affect of code size on modern 
architectures, code size hurts developers as the code becomes very hard 
to make deep changes to.  It is very important to carefully design your 
code to be easy to change.  This is why we tossed the V3 code and wrote 
V4 from scratch using plugins at every conceivable abstraction layer.  I 
think V4 will be our last rewrite from scratch because of our plugins, 
and because of how easy we find the code to work on now.

I think XFS is going to stagnate over time based on the former 
developers who have told me how hard it is to work on the code.  
Christoph probably disagrees, and he knows the XFS code far better than 
I.;-)

-- 
Hans


