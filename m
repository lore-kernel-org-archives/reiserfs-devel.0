From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: No space left on rfs4
Date: Sun, 02 Mar 2008 13:17:12 +0300
Message-ID: <47CA7EA8.8070802@gmail.com>
References: <47C9DE8A.5010207@gmail.com> <f0eb0c7b9eeefc6f2b19a7bdbdbce087@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <f0eb0c7b9eeefc6f2b19a7bdbdbce087@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: geearf@free.fr
Cc: reiserfs-devel@vger.kernel.org

Hello.

Yeah, indeed, I have reproduced it for reg40 (default plugin):
tar process is in permanent "+D" state. After reboot all files
were successfully deleted, although there is some leak of free
disk space there.

Ok, I'll take a look at this more carefully (I guess -ENOSPC
error is handled incorrectly somewhere).

If you have a problems with deleting files on reg40 partition,
then please pack your metadata by
debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
and let me download the file meta.gz

I don' t see such problems with ccreg40 (compression plugin).
Please, let me know, if something goes wrong here..

Thanks!
Edward.

John wrote:

>On Sun, 02 Mar 2008 01:54:02 +0300, Edward Shishkin <edward.shishkin@gmail.com> wrote:
>  
>
>>John wrote:
>>
>>    
>>
>>>Hello,
>>>
>>>Last time, it happened 2 days ago.
>>>
>>>
>>>      
>>>
>>So it was with 2.6.24, right?
>>    
>>
>Yep.
>Also happened with 2.6.23 a few weeks ago.
>  
>
>>>What would be a full bugreport?
>>>
>>>      
>>>
>>What exactly happens when you get no space left on device?
>>Is it a kernel oops, or just a system a freeze?
>>Are there any related kernel messages?
>>    
>>
>I'm getting an error message about it, and that is about all.
>The system can still be used if it is not the / partition.
>
>  
>
>>What kind of workload do you use to exhaust disk space?
>>    
>>
>Just extracting files from a tar.bz2 to the wrong partition.
>
>  
>
>>What exactly happens when you try to delete files on the
>>device with no space left?
>>    
>>
>The issue starts when I try to remove the files that caused that problem.
>I'm guessing that the files freezing my shell when I try to delete them are the ones that could not be fully copied: some files can be removed without any issue, and others just freeze my shell (not my system).
>Once my shell has been frozen rebooting will not be possible. Probably the partition cannot be unmounted or something like that.
>
>  
>
>>Is your device formatted with reg40 (default), or ccreg40 (I am
>>a bit confused: reiser4progs-1.0.5 are not aware of ccreg40).
>>    
>>
>Right, last time it happened with a reg40 partition.
>Before that I thought it was with a ccreg40 but maybe not. I ain't sure anymore.
>For now my / is ccreg40 and my /home is reg40. The issue this week came with /home being full.
>
>
>Would you like me to recreate that partition with 1.0.6?
>Actually I have another partition created this week with 1.0.6 in ccreg40, I can easily fill it and see what happens then.
>
>
>
>Thank you,
>
>John
>
>
>  
>

