From: "E. Gryaznova" <grev@namesys.com>
Subject: Re: mongo benchmark results
Date: Mon, 26 Jul 2004 23:41:00 +0400
Message-ID: <41055E4C.8050402@namesys.com>
References: <20040726173552.20ECA15EBD@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19823-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040726173552.20ECA15EBD@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: 'Alex Zarochentsev' <zam@namesys.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hello,

David Dabbs wrote:

>>-----Original Message-----
>>From: Alex Zarochentsev [mailto:zam@namesys.com]
>>Sent: Monday, July 26, 2004 12:09 PM
>>
>>2 Lena:
>>
>>I have added a cpu utilization stat (ratio of system time for all cpus to
>>total time, in percents) to mongo.pl.
>>
>>Please take new mongo before repeating the benchmark.
>>
>>--
>>Alex.
>>    
>>
>
>For what it's worth, I reproduced the mongo runs with 8k files as Hans
>suggested. Results are at 
>
>http://dabbs.net/reiser4/mongo8kfiles.html
>  
>
I will let you know when my current benchmarks set will be finished.
BTW, was reiserfs mounted default, w/o notail? If yes, would you please 
try notail too?

>The CREATE performance increase seems to have evaporated, though perhaps
>that was what Hans was looking to test with the updated config. I was in a
>hurry this morning and I may have varied the test slightly. I'll use Zam's
>new mongo when I get home this evening. I will as well test copying and
>compiling the kernel. Unless there's another recommended way to do this, I
>I'll substitute the output from "time -c" into a mongo log file so
>mongo_parser can compare the results.
>  
>
would you please reboot before the each  test?
 

>Zam/Elena where should I look for the new mongo tgz? I don't see it at
>http://thebsh.namesys.com/benchmarks/.
>  
>
is updated, try please :
http://thebsh.namesys.com/benchmarks/mongo-2004.07.26.tar.gz

Thanks,
Lena

>dated mongo.
>
>david
>
> 
>
>
>
>  
>


