From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 17:22:57 -0700
Message-ID: <4330A7E1.7080502@namesys.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <200509202328.28501.rik@osrc.info> <20050920213728.GA1945@elf.ucw.cz> <200509210133.41710.rik@osrc.info> <20050920221037.GB1945@elf.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050920221037.GB1945@elf.ucw.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Roman I Khimov <rik@osrc.info>, reiserfs-list@namesys.com, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>

Pavel Machek wrote:

>Hi!
>
>  
>
>>>>Second check...
>>>>e2fsck 1.34 (25-Jul-2003)
>>>>        
>>>>
>>>I have 1.38 here, so yours is too old.
>>>      
>>>
>>I'll compile something new tomorrow and try to retest it.
>> 
>>    
>>
>>>OTOH if reiser4 survives that for 80 cycles... that's pretty good.
>>>      
>>>
>>Actually 125 before I've got completely tired of HDD noise. :)
>>    
>>
>
>At tytso's request... could you put some reiser3 and reiser4
>filesystem images inside test data?
>								Pavel
>  
>
For V3 they will break things.  For V4, sure, let's test it, I'd like to
confirm that we fixed things.
