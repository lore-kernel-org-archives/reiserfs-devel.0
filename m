From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: OT: Swapfile to RAM relation with 2.4.2X+
Date: Sat, 08 Feb 2003 02:50:02 +0100
Message-ID: <3E44624A.4010102@mb.tu-ilmenau.de>
References: <3E43103A.5010106@mb.tu-ilmenau.de> <200302071209.51547.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12674-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Thank you for your reply, Russell!

On 02/07/2003 12:09 PM, Russell Coker wrote:
> On Fri, 7 Feb 2003 02:47, Manuel Krause wrote:
> 
>>In the beginning of 2.4.0+ a relation of swapfile-to-RAM of 2-to-1 was
>>recommended. Due to my several system changes to come in those times I
> 
> Such recommendations are only generalisations.  Ignore them and look at what 
> your system is doing.  If your swap space never runs out and you don't expect 

So far, I followed these thoughts as I always seemed to have enough swap 
space in this way of interpretation of swap usage. It never ran out.
(Except for buggy applications, e.g Netscape 6 betas, that sometimes 
first filled RAM to max and then the swap ... the system finally stalling.)

> your usage patterns to require more (including cron jobs and periods of 
> unexpected load) then you have enough.  If you run out of swap space then you 
> need more, also you should have some swap even if you have a lot of memory.  
> There's always data that isn't used much and can be paged out to make room 
> for more disk cache.

Seldom things happened on here this afternoon. Trying an "unexpected" 
load: Me changing an image with  Gimp, opening some large chart in 
OpenOffice, a VMware doing disk defragmentation, running KDE2, and some 
other programs ... and Netscape 7.01 with several plugins also via 
crossover in separate plugin servers for some hours. Finally I had ~75% 
of the new huge swapfile filled.
 From time to time I had this _rate_ before, so far, but not more. 
Today, closing the applications step-by-step revealed Netscape and 
plugins had about 256MB swap in use! (Of course I know NS6++ have always 
been "memory hogs".) It was an acoustical and visual experience 
listening to 2 disks activity and watching KSysguard to show the actions.

I just want to report back and now find it quite funny having had a max 
75% filled swap so far, then repartitioning to have a doubled Linux 
swap, and having applications that use it up that excessively... still 
having a max 75% filled swap.

;-))

Best regards,

Manuel


> BTW  Anything that is worth saying in a .sig can be said in 4 lines. 

Yes. It should. But it was not intended as .sig.

