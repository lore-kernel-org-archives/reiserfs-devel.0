From: Joe Feise <jfeise@feise.com>
Subject: Re: Reiser4 crash 2.6.16-mm1
Date: Tue, 28 Mar 2006 12:54:54 -0800
Message-ID: <20060328205454.3976.qmail@pv105234.reshsg.uci.edu>
References: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu>
            <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca>
            <20060327223214.5291.qmail@pv105234.reshsg.uci.edu>
            <200603280439.k2S4dAql011014@turing-police.cc.vt.edu>
            <F01E6B3F-3EBE-4982-9978-C79554F01FDA@smartgames.ca>
            <4429577C.7020105@ics.uci.edu>
            <1143573487.2380.1.camel@localhost>
            <442997D9.7000505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28388-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <442997D9.7000505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, jfeise@ics.uci.edu, Toby Thain <toby@smartgames.ca>, reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>

Hans Reiser writes: 

> Jonathan Briggs wrote: 
> 
>>On Tue, 2006-03-28 at 07:34 -0800, Joachim Feise wrote:
>>[...]
>>   
>>
>>>This is a production machine that I can't take offline for too long.
>>>But yes, I have compiled the kernel on another reiser4 partition over night,
>>>without problems.
>>>If this was a memory problem, it would indeed manifest itself in other areas
>>>with more or less random errors. The fact that it does not indicates to me that
>>>this is a fs problem. So, at this point I am ruling out a memory issue.
>>>     
>>>
>>
>>And if it's a production machine, it is using ECC RAM, I would hope.  If
>>it is, memory problems (unreported ones, anyway) are very, very
>>unlikely.
>>   
>>
> Jonathan, be merciful, ECC ram last I checked is twice the cost of
> regular and the mobs cost more too.  (I am sure the cost to produce is <
> 15% more, which makes it a great pity Intel does not standardize on
> requiring it and force it to be cheap)  Some folks need to save money. 
> Yeah, I know, this time it may have cost him more in cost of his time
> but we are all just assuming it is memory.  Unfortunately, unless he
> checks it or we see an identical error message from another user with
> checked memory, or vs tells me he sees a flaw in the code, we need to
> assume it is memory.

The machine is using ECC memory. Geez, I know what I need for a server...
 From the Dell invoice:
512MB DDR2, 400MHz,2X256MB ECC 1R DIMMs for PowerEdge SC420
Recreating the partition solved the problem. So to me it sure looks like fs 
corruption.
I have sent the dmesg output earlier. 

 -Joe
