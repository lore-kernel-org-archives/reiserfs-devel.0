From: Joe Feise <jfeise@feise.com>
Subject: Re: Reiser4 crash 2.6.16-mm1
Date: Tue, 28 Mar 2006 12:50:21 -0800
Message-ID: <20060328205021.3873.qmail@pv105234.reshsg.uci.edu>
References: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu>
            <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca>
            <20060327223214.5291.qmail@pv105234.reshsg.uci.edu>
            <200603280439.k2S4dAql011014@turing-police.cc.vt.edu>
            <F01E6B3F-3EBE-4982-9978-C79554F01FDA@smartgames.ca>
            <4429577C.7020105@ics.uci.edu>
            <1143573487.2380.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28387-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1143573487.2380.1.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: reiserfs-list@namesys.com

Jonathan Briggs writes: 

> On Tue, 2006-03-28 at 07:34 -0800, Joachim Feise wrote:
> [...]
>> This is a production machine that I can't take offline for too long.
>> But yes, I have compiled the kernel on another reiser4 partition over night,
>> without problems.
>> If this was a memory problem, it would indeed manifest itself in other areas
>> with more or less random errors. The fact that it does not indicates to me that
>> this is a fs problem. So, at this point I am ruling out a memory issue.
> 
> And if it's a production machine, it is using ECC RAM, I would hope.  If

Indeed, it does. Dell gets that right on server machines, at least... 

I have now recreated the fs on that partition, and played the data back from 
backup, and it works fine. I have made a copy of the old partition with dd, 
to be able to run some more tests when I have time. 

 -Joe
