From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Comparison of notail and notail,iicache(14) 2.4.19-pre7
Date: Fri, 26 Apr 2002 03:09:18 +0200
Message-ID: <3CC8A8BE.9040103@mb.tu-ilmenau.de>
References: <3CC730DC.1000602@mb.tu-ilmenau.de> <3CC736DC.3060300@mb.tu-ilmenau.de> <3CC7DC69.4060302@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 04/25/2002 12:37 PM, Hans Reiser wrote:

> Manuel Krause wrote:
> 
>> On 04/25/2002 12:25 AM, Manuel Krause wrote:
>>
>>> Hi all!
>>>
>>> I tried the patch linux-2.4.19p6-iicache-new-14.patch on 2.4.19-pre7 
>>> in addition to Olegs first speedup patches, some AA and AKPM ones and 
>>> made a comparison of my backup timings:
>>>
>>> /dev/hda11             5550248   4804584    745664  87% /mnt/beta
>>>
>>> noatime,notail:
>>> ---------------
[...]
>>>     noatime,notail,iicache (new-14):
>>> --------------------------------
[...]
>>
>>
>> Sorry, I just see I've always forgotten to mention I use RMLs preempt 
>> + lock-break patches, too. More info upon a stable configuration on 
>> this setup for dd backups and VMware sessions - just mail. (Just in 
>> case someone faced same problems I did.)
>>
>> Thanks
>> and best wishes, again,
>>
>> Manuel
>>
> Manuel, when you combine this many patches, and compare them all 
> combined to no patches, it becomes hard to say exactly which patches are 
> worth accepting into the main line even if all combined they are faster.
> 
> Hans
> 


Hi!

I thought it was readable I compared no-iicache to iicache-applied-and- 
mounted.

Except for my mistake to get a cp timing of a used FS first when I timed 
the copies of unused FSs in the other cases -- I don't know in which 
statement I was unclear. What's really unclear is the problem with my 
failing Netscape files on the living iicache-mounted FS...

...and in this line, of course, you're right: The number of applied 
patches on-here exceeds my limit, too. It's ridiculous. I don't know how 
much time I'd save if I didn't like to test and configure this own setup 
to be stable. Mainline? Please, don't comment.
My most liked/useful patches are RML.preempt+lock-break, 
AKPM.read-latency, the recent AA.vm-patches, AA.low-latency and 
ReiserFS.speedup+pending!

Manuel

