From: Steven Pratt <slpratt@austin.ibm.com>
Subject: Re: dbench regression in 2.6
Date: Thu, 04 Sep 2003 09:23:42 -0500
Message-ID: <3F574AEE.7080402@austin.ibm.com>
References: <3F5636F5.4060000@austin.ibm.com> <3F563B3B.6060406@namesys.com> <200309041138.40795.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15549-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200309041138.40795.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Vladimir Saveliev wrote:

>Hi
>
>On Wednesday 03 September 2003 23:04, Hans Reiser wrote:
>  
>
>>Steven Pratt wrote:
>>
>>    
>>
>>>Is anyone looking into the dbench multitheaded regression in 2.6 that I 
>>>reported here a couple of weeks ago? 
>>>      
>>>
>
>Sorry, I was unable to find your report in mail archives. Could you, please, 
>remind what is the problem?
>
> I don't see any change in the 
>  
>
>>>latest trees.
>>>
>>>      
>>>
The problem showed up in 2.6.0-test1, and every kernel since.  The 
problem is that from 2.5.65 (earliest data I have) to 2.5.69 dbench on 
reiserfs with 16 clients got a throughput of ~200MB/sec.  In 2.5.70 
through 2.5.75 the score went up to ~280MB/sec, a good thing.  But in 
2.6.0-test1 the throughput dropped to below 50 MB/sec.  Since then it 
has risen slightly but still at only around 60MB/sec.  Single client 
dbench showed similar, although much less dramatic changes.  No other 
file system exhibited a change in the 2.6.0-test1 kernel so this seems 
to be unique to reiserfs.


>>>      
>>>
>http://ausgsa.ibm.com/projects/l/ltcperformance/2003benchmarks/regression/results/history-graphs/dbench.reiser.throughput.plot.16.png
>  
>
>
>Is this address right?
>
No, my bad.  Right address is 
http://ltcperf.ncsa.uiuc.edu/data/history-graphs/dbench.reiser.throughput.plot.16.png
see also
http://ltcperf.ncsa.uiuc.edu/data/history-graphs/dbench.reiser.throughput.plot.1.png

Also if you go to
http://ltcperf.ncsa.uiuc.edu/data/2.6.0-test1/2.5.75-vs-2.6.0-test1/index.html
and select the results links related to dbench resierfs you can find 
kernel profile, sar data and lots of other system information which may 
help in isolating the problem.

Steve


