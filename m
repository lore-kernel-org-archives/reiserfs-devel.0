From: Yiannis Mavroukakis <jander@darthvader.us>
Subject: Re: improving Reiserfs Performance
Date: Wed, 25 May 2005 16:55:11 +0100
Message-ID: <42949FDF.8000406@darthvader.us>
References: <42947589.2020707@hyves.nl> <4294783C.5040001@darthvader.us> <42947BCA.9080702@hyves.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24142-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42947BCA.9080702@hyves.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jos Houtman <jos@hyves.nl>, reiserfs-list@namesys.com

Jos Houtman wrote:

> Yiannis Mavroukakis wrote:
>
>> Jos Houtman wrote:
>>
>>> Hello list,
>>>
>>> First of all, We are a website that provide picture albums to its 
>>> users.
>>> At moment we host almost 2 million, which are served in 5 different 
>>> formats from icons to 700x500.
>>> We store all there files on our NAS server and serve these with 
>>> SQUID proxys.
>>>
>>> But we are having performance problems, and I'am orientating myself 
>>> for possible fields of improvement.
>>>
>> [snip]
>> Have you considered the fact that your bottleneck may be over NFS?
>>
>> Y.
>
>
> I most certainly did, and it is a problem, but iam trying to work my 
> way bottom up.
> It's a bit hard to say anything about NFS performance while the 
> filesystem/disks
> could be causing the majority of the delays.
>
> After i did my best on the this level i intend to look at NFS in more 
> depth, but any hints/tips you allready have are welcome.
>
> jos
>
>
ReiserFS actually performs the best under heavy hammering and thousands 
of files IMHO ;)
Changing to RAID10 will improve performance
Reiser4: again IMHO not yet, although your site would make a nice test 
bed :)
Have you done any localised (i.e. not over a network) testing on the 
filesystem? If not, you'll be stabing in the dark for reasons, at least 
in my book.
Do you have a stock kernel or have you 'custom' compiled yours?


Y

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
