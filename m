From: Joachim Feise <jfeise@ics.uci.edu>
Subject: Re: Reiser4 crash 2.6.16-mm1
Date: Tue, 28 Mar 2006 07:34:20 -0800
Message-ID: <4429577C.7020105@ics.uci.edu>
References: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu> <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca> <20060327223214.5291.qmail@pv105234.reshsg.uci.edu> <200603280439.k2S4dAql011014@turing-police.cc.vt.edu> <F01E6B3F-3EBE-4982-9978-C79554F01FDA@smartgames.ca>
Reply-To: jfeise@ics.uci.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28378-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <F01E6B3F-3EBE-4982-9978-C79554F01FDA@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Toby Thain <toby@smartgames.ca>
Cc: reiserfs-list@namesys.com

Toby Thain wrote on 03/27/06 22:34:

> On 27-Mar-06, at 11:39 PM, Valdis.Kletnieks@vt.edu wrote:
> 
>> On Mon, 27 Mar 2006 14:32:14 PST, Joe Feise said:
>>
>>> Thanks for the suggestion. I haven't run a memtest, but I don't  
>>> really think
>>> that the memory is bad. The machine most likely would have had  
>>> other issues
>>> if that was the case.
>> You'd be *amazed*.  Intermittently weak memory (especially if it's  
>> just one bad
>> bit) can manifest in the most odd ways.
> 
> 
> I tend to agree. I spent weeks/months chasing down what I thought was  
> a chipset bug, when it was bad RAM. Disk reads (and probably writes)  
> were being corrupted and the kernel did not know about it. Was very  
> frustrating ... until I figured out the real problem.
> 
> Joe, did you soak the test at least overnight? Have you done any  
> heavy compiles (like building X11, or gcc) lately? Compilers are  
> often the canaries in the mine, when it comes to RAM. I'm not saying  
> this is your problem but it would be good to rule out first.


This is a production machine that I can't take offline for too long.
But yes, I have compiled the kernel on another reiser4 partition over night,
without problems.
If this was a memory problem, it would indeed manifest itself in other areas
with more or less random errors. The fact that it does not indicates to me that
this is a fs problem. So, at this point I am ruling out a memory issue.

-Joe
