From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Error <-> Partition Correspondance [was Re: Corrupted/unreadable
 journal: reiser vs. ext3]
Date: Fri, 21 Feb 2003 08:27:32 +0100
Message-ID: <3E55D4E4.5020802@mb.tu-ilmenau.de>
References: <3E4AA902.86F15815@interface-ag.com> <20030214120630.O22930@schatzie.adilger.int> <3E4D4129.8040103@namesys.com> <200302151551.12765.vitaly@namesys.com> <3E513B45.1010001@namesys.com> <3E5171BB.20509@mb.tu-ilmenau.de> <20030218095414.A16803@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 02/18/2003 07:54 AM, Oleg Drokin wrote:
> Hello!
> 
> On Tue, Feb 18, 2003 at 12:35:23AM +0100, Manuel Krause wrote:
> 
> 
>>BTW, do the ReiserFS errors nowadays print out a usable partition 
>>identification (like Chris actual data-logging patches perform at mount, 
>>e.g.)?
> 
> 
> Sometimes it does.
> 
> 
>>I mostly always have 2 partitions with ReiserFS mounted, so -- is it 
>>still meaningless to get an error message related to one of them in my logs?
> 
> 
> It depends on what are the messages.
> 
> 
>>I posted this circumstance some 3.6-ReiserFS levels ago and someone of 
>>your team wanted to implement this after his task-list was done, IIRC.
> 
> 
> Yes. I have a patch dated back to May 7th, 2002. But it was never
> accepted for reason I don't remember already.
> I will dig through my email, though. Probably I will give it another try.

Yes. I have the origin dated back to exactly that time, too. :-))

If you're ready with the patch (again) I would be glad to receive the 
preliminary version to use it anyways.


Thanks for your great work
(applies for all the teams, of course!),

Manuel


