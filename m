From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 12:45:46 +0300
Message-ID: <3E4A17CA.4080804@namesys.com>
References: <20030211144144.A5A9.MIKE@mystica.cx> <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au> <20030211171139.A5B3.MIKE@mystica.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12699-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030211171139.A5B3.MIKE@mystica.cx>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Hodson <mike@mystica.cx>
Cc: Adam Goryachev <mailinglists@websitemanagers.com.au>, reiserfs-list@namesys.com

Mike Hodson wrote:

> At
>that time I thought it was a reiserfs inconstancy, and I fscked. at that
>point I noticed a few {DriveReady -SeekComplete} errors and then most of
>the data on the drive nulled itself out.
>
It is only to be expected that using fsck on a bad hard drive is going 
to lead to complete disaster.

Maybe we should ask the user if he'd like us to verify the media first.  
Though if they follow the instructions to use dd_rescue first, then 
they'll know if it has bad sectors.....  Probably a lot of users aren't 
going to use dd_rescue first even if told to, and we should expect that.....

>  
>
>>Hmmm, so apart from finding a number of errors and doing it's best to fix
>>them (putting them into lost+found) and recovering all of your other files
>>even with hardware issues present, you recovered all of your data? The
>>problem here is?
>>    
>>
>The fact that the filesystem got so many errors in the first place. And
>as ive said, hardware issues are AFAIK not the cause.
>
>  
>
>I may use it at some point, when its as well proven as the second
>extended filesystem is currently. Its interesting to see how many people
>have errors, and when that number gets lower and more people start
>posting good things I may reevaluate it at some point :)
>
>Mike
>
>  
>
I think you'll find that it is a lot more stable now. 

-- 
Hans


