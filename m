From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: reiserfs messages cleanup patch.
Date: Fri, 21 Feb 2003 09:22:16 +0100
Message-ID: <3E55E1B8.1070808@mb.tu-ilmenau.de>
References: <3E4AA902.86F15815@interface-ag.com> <20030214120630.O22930@schatzie.adilger.int> <3E4D4129.8040103@namesys.com> <200302151551.12765.vitaly@namesys.com> <3E513B45.1010001@namesys.com> <3E5171BB.20509@mb.tu-ilmenau.de> <20030218095414.A16803@namesys.com> <3E55D4E4.5020802@mb.tu-ilmenau.de> <20030221103757.B28866@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12852-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 02/21/2003 08:37 AM, Oleg Drokin wrote:
> Hello!
> 
> On Fri, Feb 21, 2003 at 08:27:32AM +0100, Manuel Krause wrote:
> 
> 
>>If you're ready with the patch (again) I would be glad to receive the 
>>preliminary version to use it anyways.
> 
> 
> Our tester is just busy with other stuff, so I probably release
> the patch just for outside testing. If anyone would like to, of course.
> (NOTE, THIS WAS ONLY LIGHTLY TESTED BY ME).
> Patch is against latest 2.4 bitkeeper snapshot.
> Probably should apply fine to 2.4.21-pre4
> 
> Bye,
>     Oleg
> 

Thank you for the quick thing!

It doesn't apply to my kernel setup [-pre4 + data-logging + preempt]
-- too many hunks failing in my eyes.

BTW, the directio-fix fails on the same setup, too [alternatively].

Maybe I've time over the weekend to have a closer look.


Many thanks to you anyways and best regards,

Manuel


 > [PATCH: massage-cleanup.diff]

