From: Omry Yadan <omry_y@inter.net.il>
Subject: Re: does "reiserfsck --rebuild-sb" require free space?
Date: Mon, 06 Dec 2004 18:22:03 +0200
Message-ID: <41B4872B.8050804@inter.net.il>
References: <41B38E30.3060308@inter.net.il> <1102338274.1652.63.camel@tribesman.namesys.com> <200412061817.14671.vitaly@namesys.com> <200412061852.53260.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412061852.53260.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>On Monday 06 December 2004 18:17, Vitaly Fertman wrote:
>  
>
>>Hello
>>
>>On Monday 06 December 2004 16:04, Vladimir Saveliev wrote:
>>    
>>
>>>Hello
>>>
>>>On Mon, 2004-12-06 at 01:39, Omry Yadan wrote:
>>>      
>>>
>>>>I have a partial image of a reiserfs partition which takes up all the
>>>>space on the (reiserfs) parition it sits on.
>>>>there are 0 bytes free on that partition.
>>>>the image was created with dd, and I ran out space when creating it.
>>>>when I try to run
>>>>reiserfsck --rebuild-sb backup.img
>>>>I get the error
>>>>bwrite: write 4096 bytes returned -1 (block=16, dev=3): No space left
>>>>on device
>>>>
>>>>does that make sense?
>>>>        
>>>>
>>>Yes. That means that you have hit reiserfsck bug. Vitaly will contact
>>>with you soon.
>>>      
>>>
>>nothing about reiserfsck here. write to the file asks for some space on
>>the host fs (which is reiserfs also) and there is no any. this looks like
>>the correct behaviour for the fully packed fs as some data needs to be
>>overwritten and access time needs to be updated.
>>    
>>
It should write into the file, I don't see how the host file system is 
relevant here.
what if its a real partition and not an file containing an image?
in that case there is NO host file system at all..
if some data in the file must be overwritten, to make room for the file 
system overhead, so be it, but I don't see how trying to write outside
of the image make sense here. (unless there is a spacial treatment for 
images).



>
>the only thing that is not clear yet is why reiserfs needs some blocks 
>here -- the journal space is reserved and the file data will be overwritten 
>on-place, with no temporary locations. thus this could be a reiserfs bug 
>or just-in-case reservation ... this needs to be checked.
>
>you can free some space on the host reiserfs for now and write to the file
>should succeed then.
>  
>
Easier said than done, that file system has but one file, which is the 
image.
the only wat to 'free' up some space from it is to truncate the end if 
the image somehow.





