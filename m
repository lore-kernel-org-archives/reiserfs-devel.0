From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Mon, 19 Aug 2002 12:38:54 +0400
Message-ID: <3D60AE9E.3090803@namesys.com>
References: <200208152007.42370.degerrit@web.de>	<200208152253.40413.vitaly@namesys.com>	<200208152329.40707.degerrit@web.de>	<200208161205.00550.vitaly@namesys.com> <3D5CBF08.4010308@web.de>	<m3ptwjw00q.fsf@merlin.emma.line.org> <3D5CFA0B.3030107@web.de> <m3wuqqq4dg.fsf@merlin.emma.line.org> <3D5D0B24.2030806@namesys.com> <3D600CCC.9010007@emageon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Tinsley <btinsley@emageon.com>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

Brian Tinsley wrote:

> Although it could take quite some time to do this with large RAID 
> devices like we use, I believe this option definitely has some value. 
> I would make this part of our standard build process if it were 
> available.
>
>
> Hans Reiser wrote:
>
>> A colleague of mine back when I was part of a sysadmin department 
>> used to write to every block on the drive before installing the OS on 
>> it. I think he was right to do so. I have considered having 
>> mkreiserfs ask the user if he wants to do that.
>>
>
(You can use dd for now, or badblocks.)

Ok, Vitaly, look into adding this to mkreiser4. It is not that users 
cannot do it themselves, it is that they deserve a prompting reminder.

Tell users:

"Would you like us to write to every block on the partition before 
installing the filesystem on it? This will take a very long time, and is 
appropriate for persons willing to wait a day before proceeding. It is 
useful because it will cause the disk drive to remap bad sectors it 
finds, and cautious sysadmins not in a particular hurry sometimes like 
to do this."

Then take a look at the badblocks program, and decide whether we should 
use that or dd for this purpose, and whether we should read as well as 
write.

Hans


