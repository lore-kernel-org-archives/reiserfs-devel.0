From: Jos Houtman <jos@hyves.nl>
Subject: Re: improving Reiserfs Performance
Date: Wed, 25 May 2005 18:24:15 +0200
Message-ID: <4294A6AF.10502@hyves.nl>
References: <42947589.2020707@hyves.nl> <4294783C.5040001@darthvader.us> <42947BCA.9080702@hyves.nl> <42949FDF.8000406@darthvader.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42949FDF.8000406@darthvader.us>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Yiannis Mavroukakis <jander@darthvader.us>
Cc: reiserfs-list@namesys.com

Yiannis Mavroukakis wrote:

> Jos Houtman wrote:
>
>> Yiannis Mavroukakis wrote:
>>
>>> Jos Houtman wrote:
>>>
>>>> Hello list,
>>>>
>>>> First of all, We are a website that provide picture albums to its 
>>>> users.
>>>> At moment we host almost 2 million, which are served in 5 different 
>>>> formats from icons to 700x500.
>>>> We store all there files on our NAS server and serve these with 
>>>> SQUID proxys.
>>>>
>>>> But we are having performance problems, and I'am orientating myself 
>>>> for possible fields of improvement.
>>>>
>>> [snip]
>>> Have you considered the fact that your bottleneck may be over NFS?
>>>
>>> Y.
>>
>>
>>
>> I most certainly did, and it is a problem, but iam trying to work my 
>> way bottom up.
>> It's a bit hard to say anything about NFS performance while the 
>> filesystem/disks
>> could be causing the majority of the delays.
>>
>> After i did my best on the this level i intend to look at NFS in more 
>> depth, but any hints/tips you allready have are welcome.
>>
>> jos
>>
>>
> ReiserFS actually performs the best under heavy hammering and 
> thousands of files IMHO ;)

This i acknowledge, it proved to be alot better then ext3.

> Changing to RAID10 will improve performance
> Reiser4: again IMHO not yet, although your site would make a nice test 
> bed :)
> Have you done any localised (i.e. not over a network) testing on the 
> filesystem? If not, you'll be stabing in the dark for reasons, at 
> least in my book.

Not yet, we have a spare machine on which i can run some localised 
tests, but iam still copying the backup to it.
I did try some public available performance tests but since I can not 
tailer it enough to our situation i dont consider the results reliable.

Iam thinking about making a perl scripts that does the following:
- forks an x number of times. Where X would represent the number of nfsd 
daemons or maybe the nr of clients.
- each forks requests a number of random images.
I could simply measure the number of files openen, and the data read 
divided by the execution time.

but i haven't gotten around to writing it yet.

something to give an indicator though, currently iam scanning through 
some directory's in a while loop doing a bash file exists test [ -e ] to 
detect which files are missing (we had some trouble yesterday). iam 
doing this on the live system during peak hours.
though vmstat indicates that it reads an avarage 400 blocks per second 
which is quite low i think.
On the other machine to which iam currently copying the backup from a 
usb drive. i get about 14000 blocks per second.


> Do you have a stock kernel or have you 'custom' compiled yours?

I have a custom kernel with the latest 3ware drivers.
not necessarily truly optimized, iam no expert (yet).

Another thing i though of was trying another IO scheduling technique.
I remember reading in the kernel documentation that the deadlock 
scheduling could give a better performance when using read 10.

does anybody have experience with this? or seem some performance testing 
with it?



> ______________________________________________________________________
> This email has been scanned by the MessageLabs Email Security System.
> For more information please visit http://www.messagelabs.com/email 
> ______________________________________________________________________


