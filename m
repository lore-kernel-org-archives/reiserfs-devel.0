From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 snapshot for August 26th.
Date: Wed, 27 Aug 2003 19:54:08 +0400
Message-ID: <3F4CD420.4000603@namesys.com>
References: <20030826102233.GA14647@namesys.com>	 <20030827055204.GA18114@cse.unsw.EDU.AU>	 <1061964211.15513.41.camel@haron.namesys.com> <1061983191.678.1.camel@teapot.felipe-alfaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15461-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1061983191.678.1.camel@teapot.felipe-alfaro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, LKML <linux-kernel@vger.kernel.org>

Felipe Alfaro Solana wrote:

>On Wed, 2003-08-27 at 08:03, Yury Umanets wrote:
>  
>
>>> 
>>>Information: Reiser4 is going to be created on /dev/sda5.
>>>(Yes/No): Yes
>>>Creating reiser4 on /dev/sda5...
>>>mkfs.reiser4(5676): unaligned access to 0x60000000000242f2, ip=0x20000000000f7661
>>>mkfs.reiser4(5676): unaligned access to 0x60000000000242fa, ip=0x20000000000f77a1
>>>mkfs.reiser4(5676): unaligned access to 0x6000000000024302, ip=0x20000000000f78e1
>>>mkfs.reiser4(5676): unaligned access to 0x60000000000242f2, ip=0x20000000000f2671
>>>done
>>>Synchronizing /dev/sda5...done
>>>      
>>>
>>I will fix it soon.
>>    
>>
>
>Will Reiser4 be integrated into 2.6.0-test kernels anytime soon?
>This would reduce time between releases and would open up it to a wider
>audience for testing
>
>
>
>  
>
This is not a Namesys decision, I encourage you to ask Linus and Andrew 
about it though.  I would like to see it go in as an experimental marked 
filesystem....

-- 
Hans


