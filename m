From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsync() Performance Issue
Date: Sat, 04 May 2002 06:05:32 +0400
Message-ID: <3CD341EC.9080906@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049BF9B4@corpusmx1.us.dg.com> <1020463205.3946.252.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10231-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: berthiaume_wayne@emc.com, reiserfs-list@namesys.com, green@namesys.com

Chris Mason wrote:

>On Fri, 2002-05-03 at 16:35, berthiaume_wayne@emc.com wrote:
>  
>
>>	Chris, I have some quick preliminary results for you. I have
>>additional testing to perform and haven't run debugreiserfs() yet. If you
>>have a preference for which tests to run debugreiserfs() let me know.
>>	Base testing was done against 2.4.13 built on RH 7.1 using the
>>test_writes.c code I forwarded to you. The system is a Tyan with single
>>PIII, IDE Promise 20269, Maxtor 160GB drive - write cache disabled. All
>>numbers are with fsync() and 1KB files. As I said, more testing, i.e.
>>filesizes, need to be performed.
>>    
>>
>
>  
>
>>2.4.19-pre7 speedup, data logging, write barrier / no options
>>	=> 47.1ms/file
>>    
>>
>
>Hi Wayne, thanks for sending these along.
>
>I expected a slight improvement over the 2.4.13 code even with the data
>logging turned off.  I'm curious to see how it does with the IDE cache
>turned on.  With scsi, I see 10-15% better without any options than an
>unpatched kernel.
>
>  
>
>>2.4.19-pre7 speedup, data logging, write barrier / data=journal
>>	=> 25.2ms/file
>>2.4.19-pre7 speedup, data logging, write barrier / data=journal,barrier=none
>>	=> 27.8ms/file
>>    
>>
>
>The barrier option doesn't make much difference because the write cache
>is off.  With write cache on, the barrier code should allow you to be
>faster than with the caching off, but without risking the data (Jens and
>I are working on final fsync safety issues though).
>
>Hans, data=journal turns on the data journaling.  The data journaling
>
and the reason it is faster is....

>patches also include optimizations to write metadata back to disk in
>bigger chunks for tiny transactions (the current method is to write one
>transaction's worth back, when a transaction has 3 blocks, this is
>pretty slow).
>
is this a lazy fsync?  If so, then everything makes sense to me, if not, 
I remain uneducated and looking to receive your wisdom;-)

>
>I've put these patches up on:
>
>ftp.suse.com/pub/people/mason/patches/data-logging
>
>  
>
>>	One question is will these patches be going into the 2.4 tree and
>>when?
>>    
>>
>
>The data logging patches are a huge change, but the good news is they
>are based on the nesting patches that have been stable for a long time
>in the quota code.  I'll probably want a month or more of heavy testing
>before I think about submitting them.
>
>-chris
>
>
>
>
>  
>



