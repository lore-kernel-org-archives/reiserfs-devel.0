From: Toby Thain <toby@smartgames.ca>
Subject: Re: Reiser4 crash 2.6.16-mm1
Date: Tue, 28 Mar 2006 01:34:36 -0500
Message-ID: <F01E6B3F-3EBE-4982-9978-C79554F01FDA@smartgames.ca>
References: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu> <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca> <20060327223214.5291.qmail@pv105234.reshsg.uci.edu> <200603280439.k2S4dAql011014@turing-police.cc.vt.edu>
Mime-Version: 1.0 (Apple Message framework v746.3)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28370-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603280439.k2S4dAql011014@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: reiserfs-list@namesys.com


On 27-Mar-06, at 11:39 PM, Valdis.Kletnieks@vt.edu wrote:

> On Mon, 27 Mar 2006 14:32:14 PST, Joe Feise said:
>
>> Thanks for the suggestion. I haven't run a memtest, but I don't  
>> really think
>> that the memory is bad. The machine most likely would have had  
>> other issues
>> if that was the case.
>
> You'd be *amazed*.  Intermittently weak memory (especially if it's  
> just one bad
> bit) can manifest in the most odd ways.


I tend to agree. I spent weeks/months chasing down what I thought was  
a chipset bug, when it was bad RAM. Disk reads (and probably writes)  
were being corrupted and the kernel did not know about it. Was very  
frustrating ... until I figured out the real problem.

Joe, did you soak the test at least overnight? Have you done any  
heavy compiles (like building X11, or gcc) lately? Compilers are  
often the canaries in the mine, when it comes to RAM. I'm not saying  
this is your problem but it would be good to rule out first.

--Toby

>
> In fact, if you think about it, if it's bad memory, your trashed  
> reiser4
> partition could very well *be* that "would have had other issues"  
> that you
> said you'd see if it was bad memory. ;)

