From: Oleg Drokin <green@linuxhacker.ru>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty before marking them writeback.
Date: Sat, 10 Oct 2015 12:51:23 -0400
Message-ID: <A0E9999A-A36E-43C2-A2D9-D68B39BD032B@linuxhacker.ru>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>		 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>		 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>		 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>	 <56182257.7060304@gmail.com> <1444473863.4257.10.camel@gmail.com> <561928CF.9030903@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <561928CF.9030903@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org, =?utf-8?Q?Du=C5=A1an_=C4=8Coli=C4=87?= <dusanc@gmail.com>


On Oct 10, 2015, at 11:03 AM, Edward Shishkin wrote:
>>> 
>>> For formatted nodes we can continue to narrow down the problem
>>> (see the attached patch).
>> Having applied the patch, I saw loads and loads of warnings (in ~10
>> distinct stacktraces), but no panics or oopses in the initial location.
>> The false positives are possible, right?
> 
> 
> Yes, a lot of ones and nothing interesting.
> The same for Dushan's logs. Sorry for bad idea..

Actually the idea might not be as bad as you think.

This is because not every page that you forgot to call page_dirty on
will cause a crash.
Only the pages that had never ever had been set dirty.
So in a lot of cases the crash does not happen because the page got
dirtied by a normal path somewhere else and then cleared by normal
means, but i_wb remains with that page forever until it's fully torn down
from the pagecache.

Bye,
    Oleg
