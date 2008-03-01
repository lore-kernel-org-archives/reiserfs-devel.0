From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: No space left on rfs4
Date: Sun, 02 Mar 2008 01:54:02 +0300
Message-ID: <47C9DE8A.5010207@gmail.com>
References: <47C9CA45.5010704@gmail.com> <2626921455ab4ea86e2481f9488eb700@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <2626921455ab4ea86e2481f9488eb700@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: geearf@free.fr
Cc: reiserfs-devel@vger.kernel.org

John wrote:

>Hello,
>
>Last time, it happened 2 days ago.
>  
>

So it was with 2.6.24, right?

>What would be a full bugreport? 
>

What exactly happens when you get no space left on device?
Is it a kernel oops, or just a system a freeze?
Are there any related kernel messages?
What kind of workload do you use to exhaust disk space?
What exactly happens when you try to delete files on the
device with no space left?
Is your device formatted with reg40 (default), or ccreg40 (I am
a bit confused: reiser4progs-1.0.5 are not aware of ccreg40).

Thanks,
Edward.

>I do not really know what you mean by that. Do you want me to do it again and to send you the error message or something?
>
>As for the live-cd yes I know, but this computer does not have a CD any-more so my only way out is my other /. But yes there is always a way to fix it, it is just bothersome...
>
>
>Thinking about it those partitions were created with reiser4progs-1.0.5 if I remember correctly. Maybe that would make a difference?
>
>Thank you,
>
>John
>
>On Sun, 02 Mar 2008 00:27:33 +0300, Edward Shishkin <edward.shishkin@gmail.com> wrote:
>  
>
>>Hello.
>>
>>How long ago did it happen?
>>I can not reproduce such problems, so let's start with full bugreport.
>>Root partition can be checked after booting with gentoo-based live
>>CD which contains  reiser4progs-1.0.6
>>
>>Thanks,
>>Edward.
>>
>>John wrote:
>>
>>    
>>
>>>Hello people,
>>>
>>>I've been following this list for some time but this is my first e-mail
>>>      
>>>
>>here since at least 2 years.
>>    
>>
>>>(thank you Edwards for your work, you've fixed many of my issues lately)
>>>
>>>
>>>Today I am mailing you about an issue that you probably know about, but
>>>      
>>>
>>that I still believe needs to be fixed: filling the FS till it corrupts
>>itself.
>>    
>>
>>>How many times have I almost killed by computer by filling my rfs4,
>>>      
>>>
>>copying data on the wrong partition or doing something else...
>>    
>>
>>>The FS needs to be able to handle that, but instead some files get
>>>      
>>>
>>corrupted and when I try to delete them my computer is kind of dead and
>>needs to reboot.  Of course, I cannot reboot and have to shut it down
>>myself which might corrupt even more data... If I tried to delete some
>>files after filling the partition, at the reboot they're back and so I'm
>>again with a couple of Kb free. Usually a fsck fixes this problem, but when
>>I do that on / the fsck may not be usable anymore...
>>    
>>
>>>Don't we have like 5% of space blocked for this case like on other FS? or
>>>      
>>>
>>something else that would prevent this problem from happening?
>>    
>>
>>>I am using the latest rfs4 patch from here with a 2.6.24 kernel and a
>>>      
>>>
>>ccreg40 partition, but this issue has been here for years so nothing new I
>>believe.
>>    
>>
>>>Thank you,
>>>
>>>John
>>>
>>>--
>>>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
>>>      
>>>
>>in
>>    
>>
>>>the body of a message to majordomo@vger.kernel.org
>>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>>
>>>      
>>>
>>--
>>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
>>in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>    
>>
>
>
>  
>

