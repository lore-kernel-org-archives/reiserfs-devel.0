From: Hans Reiser <reiser@namesys.com>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 03 Mar 2004 12:35:12 +0300
Message-ID: <4045A6D0.6050203@namesys.com>
References: <4044119D.6050502@andrew.cmu.edu> <4044366B.3000405@namesys.com>	 <4044B787.7080301@andrew.cmu.edu>	 <1078266793.8582.24.camel@mentor.gurulabs.com>	 <20040302224758.GK19111@khan.acc.umu.se> <40453538.8050103@animezone.org>	 <20040303014115.GP19111@khan.acc.umu.se>	 <20040303014115.GP19111@khan.acc.umu.se.suse.lists.linux.kernel>	 <p73ptbu4psx.fsf@brahms.suse.de> <20040303074756.A25861@infradead.org>	 <40459159.1090501@namesys.com> <1078301777.4446.5.camel@laptop.fenrus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17035-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078301777.4446.5.camel@laptop.fenrus.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: arjanv@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, Andi Kleen <ak@suse.de>, David Weinehall <david@southpole.se>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

Arjan van de Ven wrote:

>On Wed, 2004-03-03 at 09:03, Hans Reiser wrote:
>  
>
>>  I 
>>think V4 will be our last rewrite from scratch because of our plugins, 
>>and because of how easy we find the code to work on now.
>>    
>>
>
>can we quote you on that 3 years from now ? ;-)
>  
>
Yes, I think so.

We are going to add a nice little optimization for compiles to Reiser4 
as a result of thinking about compile benchmarks.  We are going to sort 
filenames (and their corresponding file bodies) whose penultimate 
character is . by their last character first.  It seems this is optimal, 
and it is simple, and it is without any real world drawbacks.  This is 
easy for us because of our plugin design.

-- 
Hans


