From: David Greaves <david@dgreaves.com>
Subject: Re: support for Reiserfs 3.6 failed on ~1Tb lvm2 lv on 2.6.6?
Date: Tue, 08 Jun 2004 21:55:19 +0100
Message-ID: <40C627B7.9000803@dgreaves.com>
References: <3DF9165145FACB4C96977FF650C1E9040C46A03F@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C46A03F@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Burnes, James" <james.burnes@gwl.com>
Cc: bernd-schubert@web.de, reiserfs-list@namesys.com

Thanks - I'll try both :)

I'm talking to namesys too.

I am wondering if the resync corrupted the data.

I'm pretty happy that I didn't do anything 'wrong' - something is either 
broken in hw (mem) or buggy.

David

Burnes, James wrote:

>Rather than running memtest86 for two days you might find it easier to
>simply re-seat your memory modules and try again.
>
>If that doesn't fix it, then run memtest.
>
>
>
>jim burnes
>security engineer
>great-west, denver
> 
>
>  
>
>>-----Original Message-----
>>From: bernd-schubert@web.de [mailto:bernd-schubert@web.de]
>>Sent: Tuesday, June 08, 2004 1:18 PM
>>To: reiserfs-list@namesys.com
>>Cc: David Greaves
>>Subject: Re: support for Reiserfs 3.6 failed on ~1Tb lvm2 lv on 2.6.6?
>>
>>Did you already run memtest86 for at least a couple of ours, but
>>    
>>
>better
>  
>
>>several days (all tests have to be enabled)? I also had problems like
>>    
>>
>this
>  
>
>>several times and usually it simply had been memory problems. On my
>>notebook
>>even the shared memory graphics card could cause this...
>>
>>Cheers,
>>	Bernd
>>
>
>
>  
>

