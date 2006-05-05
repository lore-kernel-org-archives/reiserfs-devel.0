From: John <geearf@free.fr>
Subject: Re: REISER4 problem,
Date: Fri, 05 May 2006 08:09:36 +0200
Message-ID: <445AEC20.9080501@free.fr>
References: <445A630B.9050803@free.fr> <20060505024038.GA8054@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28561-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060505024038.GA8054@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sander@humilis.net
Cc: reiserfs-list@namesys.com



Sander wrote:
> John wrote (ao):
>   
>> I think I may have found a bug.
>>
>> I'm using reiser4 for my /home directory on a 2.6.15 (ubuntu) patched 
>> kernel for reiser4.
>>
>> Yesterday I filled my /home once, then emptied it a little, then filled 
>> it again, and so on about 3 or 4 times. I shut it down properly and all 
>> seemed ok.
>> Then today when I started it, the partition was completelty messed up. I 
>> fixed it with fsck but I had a lot of troubles to get it back working 
>> even when fsck said it was ok...
>> I had many different error messages in dmesg, like error input/ouput, 
>> inode error, and sd error.
>>     
>
> That sounds more like a broken disk than a Reiser4 error. Can you post
> the error messages from dmesg?
>
> 	With kind regards, Sander
>
>   
Hello,

I'm sorry but I sent this message after fixing it. Also I could not do 
much when the partition was messed up, even reboot was impossible, but I 
should have written down the messages on a paper..
I'll look if some info is still in /var/log/something.

John
