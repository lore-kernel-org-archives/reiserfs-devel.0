From: Steven Pratt <slpratt@austin.ibm.com>
Subject: Re: dbench regression in 2.6
Date: Fri, 05 Sep 2003 10:24:46 -0500
Message-ID: <3F58AABE.5050800@austin.ibm.com>
References: <3F5636F5.4060000@austin.ibm.com> <3F563B3B.6060406@namesys.com> <200309041138.40795.vs@namesys.com> <3F574AEE.7080402@austin.ibm.com> <20030904175853.GB13676@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030904175853.GB13676@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

Mike Fedyk wrote:

>On Thu, Sep 04, 2003 at 09:23:42AM -0500, Steven Pratt wrote:
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
>>>>Steven Pratt wrote:
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
>>>please, remind what is the problem?
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
>>>>>
>>The problem showed up in 2.6.0-test1, and every kernel since.  The 
>>problem is that from 2.5.65 (earliest data I have) to 2.5.69 dbench on 
>>reiserfs with 16 clients got a throughput of ~200MB/sec.  In 2.5.70 
>>through 2.5.75 the score went up to ~280MB/sec, a good thing.  But in 
>>2.6.0-test1 the throughput dropped to below 50 MB/sec.  Since then it 
>>has risen slightly but still at only around 60MB/sec.  Single client 
>>dbench showed similar, although much less dramatic changes.  No other 
>>file system exhibited a change in the 2.6.0-test1 kernel so this seems 
>>to be unique to reiserfs.
>>    
>>
>
>Did anything change in the testing at all?  Can you try again with your
>current software versions on 2.5.75, and reproduce the higher speeds?
>  
>
No, nothing changed in the test setup.  Same dbench, same disk, same 
distro, just different kernel. 

>Check the diffstat for the test1 release and see if there are any reiserfs
>changes...
>
I believe that Oleg already said there were no changes that look like 
they would have caused this.  More likely the behavior of something 
reiser is using changed which is having a bad effect on resierfs.

Steve

