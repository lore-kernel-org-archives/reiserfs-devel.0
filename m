From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4: Compilation Error on 2.6.28.1_[Scanned]
Date: Sun, 25 Jan 2009 20:32:37 +0300
Message-ID: <497CA235.9030504@gmail.com>
References: <200901251815.08030.volkerarmin@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200901251815.08030.volkerarmin@googlemail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Volker Armin Hemmann <volkerarmin@googlemail.com>
Cc: reiserfs-devel@vger.kernel.org

Volker Armin Hemmann wrote:
> On Montag 19 Januar 2009, Edward Shishkin wrote:
>   
>> Ingo Bormuth wrote:
>>     
>>> Reiser4-for-2.6.28 does apply but fails to compile on
>>> vanilla-2.6.28.1 due to the following commit:
>>>
>>> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit
>>> diff;h=54566b2c1594c2326a645a3551f9d989f7ba3c5e
>>>
>>> Attached is a tiny fix which works fine here.
>>>       
>> yeah, with your patch it will act as earlier,
>> however, -mm guys decided to get rig of __GFP_FS flag:
>> http://userweb.kernel.org/~akpm/mmotm/broken-out/fs-symlink-write_begin-all
>> ocation-context-fix-reiser4-fix.patch it seems they found it deadlocky..
>>     
>
> so without Ingo Bormuth's patch you can't use r4 with 2.6.28.1

Ingo's patch is against -rc

>  and later and 
> with his patch there is a risk of deadlocks?
>   

Not sure.
Nobody complained so far..

Edward.
