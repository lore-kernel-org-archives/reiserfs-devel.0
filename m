From: Clifford Beshers <clifford.beshers@lindows.com>
Subject: Re: 2 Terabyte install
Date: Wed, 12 May 2004 11:30:29 -0700
Message-ID: <40A26D45.2010707@lindows.com>
References: <409AC2FF.7080800@lindows.com> <1083917932.14089.281.camel@tribesman.namesys.com> <409BB690.6030604@namesys.com> <409BBDC9.3030809@lindows.com> <409FB387.8080804@namesys.com> <40A19147.4010703@lindows.com> <40A257DA.2010903@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18633-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40A257DA.2010903@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Vitaly Fertman <vitaly@namesys.com>



Hans Reiser wrote:

> Clifford Beshers wrote:
>
>> Thanks for the help everyone.  In the end, it turned out that sfdisk 
>> is indeed the culprit.  We created a 2.1T partition with fdisk, then 
>> asked sfdisk for the size and it said: -92,xxx,xxx.  Unfortunately, 
>> this means we have to either fix it or find an alternate solution to 
>> creating partitions.
>
>
> We can probably fix it for you if you like....

I'm going to try the alternatives first and at the same time email the 
author and the Debian maintainer of sfdisk and ask them what's up.

>
>> While I'm here, I have some other questions:
>>
>>     * What is the time complexity of mounting a ReiserFS partition? 
>>       It seems to be proportional to the size of the partition?  Is it
>>       different for Reiser4?
>>
> is the time a problem in practice, or just a curiousity point?


Our customers have complained about our boot times, so we've been 
tracking things down and fixing them.  We were doing two passes of 
mounting everything, one pass to figure out what was there, another to 
let the traditional 'mountall' init script do its work.  We were 
assuming that the mount times were constant and small.  But as the disks 
are getting bigger, the second mount is noticeable, so we're fixing 
that.  The first mount is definitely noticeable on the 2T machine, but 
we figure if we do our jobs right, people should rarely be rebooting anyway.

Cliff

