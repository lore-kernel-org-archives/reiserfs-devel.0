From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 23:14:35 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <413022CB.8020308@namesys.com>
References: <20040824202521.GA26705@lst.de>	<412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com> <412E10A2.1020801@pobox.com> <412EEC07.30707@namesys.com> <412F7B6D.6010305@pobox.com> <412F7FB8.4010609@blue-labs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <412F7FB8.4010609@blue-labs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Ford <david+challenge-response@blue-labs.org>
Cc: Will Dyson <will_dyson@pobox.com>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

David Ford wrote:

> Will Dyson wrote:
>
>> Hans Reiser wrote:
>>
>>> Will Dyson wrote:
>>>
>>
>>
>> String parsing bloats the kernel with code that will be called 
>> rarely, and doing it inside the filesystem module makes for duplicate 
>> code if more than one filesystem does it. But a good common parser 
>> routine (or a kernel api that takes a pre-compiled parse tree) would 
>> reduce the bad taste.
>
>
>
> Like say.. printk() ?  :)
>
or namei()....;-)

Seriously, what we are doing is making namei() more powerful.  That is 
all.  Currently namei() is very simple.  Evolution happens.

Hans
