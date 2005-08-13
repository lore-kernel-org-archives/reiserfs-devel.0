From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 on 2.6.13-rc6-realtime-preempt
Date: Sat, 13 Aug 2005 14:13:18 +0400
Message-ID: <42FDC7BE.7000006@namesys.com>
References: <20050811224503.7dbd67dd@SiRiUS.home> <42FC665D.4030802@namesys.com> <42FCF097.9090205@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25440-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FCF097.9090205@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: gimpel <gimpel@sonnenkinder.org>, reiserfs-list@namesys.com

Hello

David Masover wrote:
> Vladimir V. Saveliev wrote:
> 
>>>Hello
> 
> 
>>>reiser4 depends on several core kernel patches. I think you did not
>>>apply them.
> 
> 
> What kind of symptoms would not applying them cause?  

I assumed that Gimpel did not apply core patches because he had compiling error:
fs/built-in.o(.text+0x92999): In function `reiser4_put_super': undefined reference to `rcu_barrier'.

However, the problem is that some changes are to be done to get reiser4 to work in new realtime/preempt kernels.

> I grab patches
> from -mm, but only the ones with "reiser4" in the name.  They seem to
> work with minimal tweaking on my part, and no one said anything when I
> mentioned this before.  They do seem solid...
> 

You go right way.

> 
>>>You might want to try to apply this patch
>>>ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/reiser4-for-2.6.12-realtime-preempt-2.6.12-final-V0.7.51-29.patch.gz
> 
> 
> Should I get patches from there, instead of -mm, in the future?  Which
> is more likely to be current for a given *stable* kernel,
> reiser4-for-2.6 or -mm?

reiser4-for-2.6 contains code which did not get enough stability yet.

> 
