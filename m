From: "Nicholas S. Wourms" <nwourms@netscape.net>
Subject: Re: Reiser4's status of this week.
Date: Sat, 19 Jun 2004 19:42:07 -0400
Message-ID: <40D4CF4F.7040904@netscape.net>
References: <7794555.1087651158684.JavaMail.postfix@mx20.mail.sohu.com> <40D45B6C.7000002@namesys.com> <40D482CB.1080303@netscape.net> <40D4C301.1090406@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40D4C301.1090406@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiser@namesys.com
Cc: reiserfs-list@namesys.com, Alexander Lyamin aka FLX <flx@namesys.com>, Vladimir Saveliev <vs@namesys.com>

Hans Reiser wrote:
> Nicholas S. Wourms wrote:
> 
>> Hans Reiser wrote:
>>
>>> stone_wang@sohu.com wrote:
>>>
>>>> Hi,Hans:
>>>>
>>>> Your website are saying "Reiser4 is in final testing, and will ship 
>>>> soon!"  It has been saying that for a long time :(
>>>>
>>>>
>>>> When could Reiser4 be finaly released? We are eager to try it.
>>>>
>>>> Regards.
>>>>
>>>> Stone.
>>>>
>>>>
>>>>  
>>>>
>>> next week.  or so we hope.
>>
>>
>>
>> Hans,
>>
>> I've noticed that there seems to be a problem with your 
>> reiser4-linux-2.6 bitkeeper repository.  Unlike the 2.5 version I used 
>> awhile back, this one seems to just be an old copy of the stock 
>> linux-2.6.5 kernel with the 2.6.5-mm2 patches added.  None of the 
>> reiser4 base or extra patches seem to have been added (excluding the 
>> ones for fs/reiser4).  Would someone mind fixing this?  Don't you have 
>> an internal repository with all the modifications in the base and 
>> extra series applied?  If your internal tree can't be exported, can 
>> you provide a snapshot BK-style(not gnu) patch against linus-current?
>>
>> I've also noticed, as has been noted in the past, that bk pulls are 
>> still broken.  Someone mentioned that it is a problem with the new bk. 
>> If this is true, why not contact Larry for support?  Not that it 
>> matters now, since the reiser4-linux-2.6 isn't usable, but it might be 
>> helpful for future syncs.
>>
>> Cheers,
>> Nicholas
>>
>>
>>
> this is for flx and vs to answer....

Thanks, I'm eager to test the new features of reiser4 now that it has 
stabilized a bit since 2.5.  I might also experiment with trying to port 
the x86-specific bits to sparc64 and then try to port the lilo patch to 
silo.  I know the webpage says it is for x86 only, still I would like to 
give it a try on my sparc64 box with a spare disk I have lying around. 
IIRC, the actual infrastructure seemed fairly portable and arch-independant.

Cheers,
Nicholas

