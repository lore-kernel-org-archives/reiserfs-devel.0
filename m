From: Alexandre Ratti <alex@gabuzomeu.net>
Subject: Re: New error when running script on ReiserFS partition
Date: Mon, 23 Dec 2002 14:07:23 +0100
Message-ID: <4.3.2.7.2.20021223135710.00b52c68@mail.poulpe.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12211-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Oleg Drokin <green@namesys.com>

Hello,


>Date: Thu, 12 Dec 2002 15:27:07 +0100
>From: Alexandre Ratti <alex@gabuzomeu.net>

>At 17:07 12/12/2002 +0300, Oleg Drokin wrote:
>>On Thu, Dec 12, 2002 at 02:54:33PM +0100, Alexandre Ratti wrote:
>> > I got a new error when my backup script ran today. (See [1] for previous
>> > message sent on Tuesday). This script runs on a large ReiserFS partition.
>> > System is Debian Woody with recompiled 2.4.19 kernel.

>>While this is certainly a piece of reiserfs code, the crash address makes no
>>sence at all. Can you please run memtest86 for some time to confirm that 
>>your memory is still ok?
>
>It's running now; I'll let you know what the results are. (I last ran 
>memtest86 in October when I set up this box and the memory was fine at 
>that time.)

I ran tests and watched the system for some time. The memory was fine, but 
I believe now that the problem was due to an old, flaky ISA graphic card.

The backup script has been running fine for more than a week now, so the 
problem looks fixed.


Thanks for your input.

Alexandre


[1] History: http://marc.theaimsgroup.com/?t=103955025600002&r=1&w=2


