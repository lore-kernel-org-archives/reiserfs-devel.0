From: Steven Pratt <slpratt@austin.ibm.com>
Subject: Re: dbench regression in 2.6
Date: Mon, 08 Sep 2003 13:02:53 -0500
Message-ID: <3F5CC44D.7030803@austin.ibm.com>
References: <3F5636F5.4060000@austin.ibm.com> <200309041138.40795.vs@namesys.com> <3F574AEE.7080402@austin.ibm.com> <200309082105.37309.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200309082105.37309.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Vladimir Saveliev wrote:

>Hi
>
>On Thursday 04 September 2003 18:23, Steven Pratt wrote:
>  
>
>>Vladimir Saveliev wrote:
>>
>>    
>>
>>>Hi
>>>
>>>On Wednesday 03 September 2003 23:04, Hans Reiser wrote:
>>> 
>>>
>>>      
>>>
>>>>Steven Pratt wrote:
>>>>
>>>>   
>>>>
>>>>        
>>>>
>>>>>Is anyone looking into the dbench multitheaded regression in 2.6 that I 
>>>>>reported here a couple of weeks ago? 
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>Sorry, I was unable to find your report in mail archives. Could you, 
>>>      
>>>
>please, 
>  
>
>>>remind what is the problem?
>>>
>>>I don't see any change in the 
>>> 
>>>      
>>>
>>>>>latest trees.
>>>>>
>>>>>     
>>>>>          
>>>>>
>>The problem showed up in 2.6.0-test1, and every kernel since.  The 
>>problem is that from 2.5.65 (earliest data I have) to 2.5.69 dbench on 
>>reiserfs with 16 clients got a throughput of ~200MB/sec.  In 2.5.70 
>>through 2.5.75 the score went up to ~280MB/sec, a good thing.  But in 
>>2.6.0-test1 the throughput dropped to below 50 MB/sec.  Since then it 
>>has risen slightly but still at only around 60MB/sec.  Single client 
>>dbench showed similar, although much less dramatic changes.  No other 
>>file system exhibited a change in the 2.6.0-test1 kernel so this seems 
>>to be unique to reiserfs
>>
>>http://ausgsa.ibm.com/projects/l/ltcperformance/2003benchmarks/regression/results/history-graphs/dbench.reiser.throughput.plot.16.png
>>    
>>
>>> 
>>>
>http://ltcperf.ncsa.uiuc.edu/data/history-graphs/dbench.reiser.throughput.plot.16.png
>  
>
>>see also
>>
>>    
>>
>http://ltcperf.ncsa.uiuc.edu/data/history-graphs/dbench.reiser.throughput.plot.1.png
>  
>
>>Also if you go to
>>
>>    
>>
>http://ltcperf.ncsa.uiuc.edu/data/2.6.0-test1/2.5.75-vs-2.6.0-test1/index.html
>  
>
>>and select the results links related to dbench resierfs you can find 
>>kernel profile, sar data and lots of other system information which may 
>>help in isolating the problem.
>>
>>Steve
>>
>>    
>>
>
>Unfortunately, I was unable to reproduce your result. On our test machine (4 
>Xeons 1gb ram) results shown by reiserfs on 2.5.75 and 2.6.0-test1 are 
>comparable.
>
>So, would be you so kind to help us to track this issue? If yes, could you , 
>please, describe your test in more details.
>
Sure.

>0. what is version of dbench you used: 1.2, 1.3 or 2.0?
>
2.0

>1. how many time did you run dbench 16?
>
4 (for each client count, results are averaged)

>2. when did you mkfs, etc, did you reboot after mkfs?
>
No, but the fs is mkfsed between each run.

>3. how much ram does machine which was running dbench have?
>
8GB

>4. could you please try to rerun benchmark with SMP=off, and with 2 and 4 
>cpus?
>5. could you also run dbench 64 and dbench 128 for reiserfs 2.5.75 and 
>2.6.0-test1?
>  
>
Yes, but the machine is tied up at the moment, may take me a day or so 
to get more time on it.

>Thanks,
>vs
>
>  
>
Steve

