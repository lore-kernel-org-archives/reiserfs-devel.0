From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: newbie help needed?
Date: Fri, 04 Dec 2009 20:34:45 +0100
Message-ID: <4B196455.6060308@gmail.com>
References: <20091202192143.48ece851.buchner.johannes@gmx.at>	<4B16318E.7010504@gmail.com> <20091204092527.a5117191.buchner.johannes@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20091204092527.a5117191.buchner.johannes@gmx.at>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Johannes Buchner <buchner.johannes@gmx.at>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Johannes Buchner wrote:
> On Wed, 02 Dec 2009 10:21:18 +0100
> Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
>   
>> Johannes Buchner wrote:
>>     

Hello.

>>>  I took a look at the TODO lists, are there any simple tasks to
>>> do for newbies?
>>>       
>> If you mean the "todo for inclusion", then no.
>>
>> Reiser4 has only one technical issue. It can
>> be resolved only by very experienced people.
>>     
>
> Thanks for replying. I did not have to the inclusion of
> reiser4 in mind specifically.
>
>   
>>> I also believe that on 'sync', reiser4 currently does absolutely
>>> nothing.
>>>       
>> this is not good: a file system should respond on sync (1).
>>
>>     
>>>  The comment in reiser4_sync_inodes says reiser4 does its own
>>> flush elsewhere. Should this be different?
>>>   
>>>       
>> you might want to ask such question _before_ sending patches to akpm. 
>>     
>
> I was under the believe that I did not change the behaviour. I see my
> mistake now, I was looking at the wrong if-branch. 
>   

Nop. You've lost the whole point of using of ->sync_inodes(), which is
responsible for reiser4 background (and non-background) writeback,
and now it is not involved by any path.

Here is a good explanation why we need this additional super operation:
http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.21-rc3/2.6.21-rc3-mm1/broken-out/reiser4-sb_sync_inodes.patch

> I tried now to come up with a correct version for some hours, but I keep
> having NULL problems. Maybe a writeback_control object has to be
> created, possibly even in fs/fs-writeback.c:sync_inodes_sb, as
> write_inode_now does below. I tried that too, but it gave me a
> recursion.

It may happens because of missed checks that a process is of pdflush-style.
Perhaps, we need to rename the current_is_pdflush() and get it back.

Thanks,
Edward.

>  I'm not sure what the rationale was for introducing a call
> with NULL here. Sorry I can't correct this.
>
> Looking forward to your review.
>
> Best wishes,
> Johannes
>
>   

