From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging
 (was:Compatibility of  current 2.4.19.pending ...)
Date: Sat, 14 Sep 2002 01:07:37 +0200
Message-ID: <3D826FB9.7030909@mb.tu-ilmenau.de>
References: <3D7FDEA5.7040806@mb.tu-ilmenau.de> <3D81076E.6090408@mb.tu-ilmenau.de> <20020913113735.A6022@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11441-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 09/13/2002 09:37 AM, Oleg Drokin wrote:
> Hello!
> 
> On Thu, Sep 12, 2002 at 11:30:22PM +0200, Manuel Krause wrote:
> 
>>>When I see the discussion about the new block-allocator, the testing 
>>>directory etc. I assume a definite "No." (Please, please, correct me, if 
>>
>>;-) You really didn't correct me so far. Mmh. :-(
> 
> Datalogging is incompatible with stuff in testing directory. It won't apply
> cleanly to new block allocatior, but that's can be easily fixed.
> 
>>>So, for the overnight change to pre-kernel 7, where are the new 
>>>data-logging patches Hans even announced to lkml?

??? Hello, Chris!

>>So I really got a 2.4.20-pre6 compiled with the 
>>preempt-kernel-rml-2.4.20-pre5-1.patch and Olegs fix he sent to the list 
>>yesterday. BTW, have the testing patches from -pre5 gone into -pre6? It 
>>isn't clear to me.
> 
> Testing patches were merged into -pre6 by Marcelo's mistake and -pre7
> have these patches removed already.

Yes. I pre-read this @ lkml.

>>Application startup timings of NS-7.0 and OOo-1.0.1 didn't increase. :-))
> 
> 
> Sure, read code path did not changed at all.

Seems so, even AntiVir takes the same time as with data-logging 
ordered-mode... :-)

>>I hope I don't need to comment on the values...
> 
> Sure. datalogging and new file_write code are not solutions to same problem.
> These are solutions for different problems and can be used together (after
> merging of course) for even better performance, I hope ;)


Thanks a lot for your informative reply, Oleg!

Did I follow the thread "Re: [reiserfs-list] [BK] ReiserFS file write 
bug fix for 2.4" correctly that going to 2.4.20-pre7 that is without 
file_write (+) code should speed up (in my case copy actions) in 
comparison to 2.4.20-pre6?

I retested my backup session (see last mail) with 2.4.20-pre7 but have 
_NO_ ( <0,2% !!!) difference at all.

Have I missed something?

Thanks,

Manuel

