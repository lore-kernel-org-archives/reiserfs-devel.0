From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Re6: Reiserfs3 is crashing - where/whom to report?
Date: Tue, 20 Jan 2009 21:54:38 +0300
Message-ID: <49761DEE.2000204@gmail.com>
References: <49750FC1.23700.2C929@JaFojtik.seznam.cz>, <49760EC3.25886.AFADA@JaFojtik.seznam.cz>, <49761597.1060305@gmail.com> <49761CA5.613.41328D@JaFojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49761CA5.613.41328D@JaFojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jaroslav Fojtik <JaFojtik@seznam.cz>
Cc: Jeff Mahoney <jeffm@suse.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Jaroslav Fojtik wrote:
> Dear Edward,
>
>   
>>> I do not know why these block sizes has been disabled - stability? speed?
>>> Overflowing block count?
>>>   
>>>       
>> http://bugzilla.kernel.org/show_bug.cgi?id=9108
>>
>> Reiserfs has never worked properly with small blocksizes, and it was
>> unpleasant surprise when I saw that it is enabled again in
>> reiserfsprogs-3.6.19.
>>     
>
>   
>> IMHO there is no chances to make reiserfs work with 512K blocks.
>>     
> Never mind.
>
>   
>> Other cases should be carefully debugged. Put in longterm todo.
>>     
> OK.
>
> And make it sense for you to make a test on my HDD with blocksize 1024 
>   

"HDD with blocksize" is a poor phrase. HDD has a property "sector size".
Blocksize is a property of filesystem.

> and report you a problem? At least one known crash could be avoided.
>   

No, it doesn't, if you mean to reproduce a crash with reiserfs
formatted by "mkreiserfs -b 1024": I know how to reproduce it.

Thanks.
Edward.
