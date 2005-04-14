From: David Masover <ninja@slaphack.com>
Subject: Re: Less disk space with reiser4?
Date: Wed, 13 Apr 2005 23:35:12 -0500
Message-ID: <425DF300.3020500@slaphack.com>
References: <425A8A1D.9040206@siwnet.net> <20050411195253.GD6211@backtop.namesys.com> <425ADC6C.8090209@namesys.com> <425D15C1.6050107@siwnet.net> <20050413130438.GM6211@backtop.namesys.com> <425D21A6.10001@siwnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23873-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425D21A6.10001@siwnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Andersson <stefan@siwnet.net>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stefan Andersson wrote:
> Alex Zarochentsev wrote:
> 
>> On Wed, Apr 13, 2005 at 02:51:13PM +0200, Stefan Andersson wrote:
>>  
>>
>>> Thanks for all the answers.
>>>
>>> Now would it be possible to change the 5% to something else?
>>>   
>>
>>
>> even if the fs would be unreliable?
>>  
>>
> That is what I want to test, or if someone knows the answer to that.

The only indication I've heard that it would make the FS unreliable is
if you had less space reserved than you had RAM available to stack up
writes which haven't been allocated.  In your case, it's a bug that you
haven't been able to set this on your own.

Note that I said unreliable, not slow.  Everyone keeps telling us that
you'll get slow with <25% space available, so the 5% is really just a
sanity check, but you're probably fine there, too.

My question to the Namesys guys is, have you actually tested situations
like this?

If you want to artificially create that situation, you can probably just
shrink the values down a bunch -- make an fs on a 1 gig drive on a
virtual machine (qemu + accelerator) with only a couple megs of RAM
available for cache/buffer, then try to fill it.  How close can you get
to 100% full before something blows up?

I'd do it, but I've got problems with school and bad RAM.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQl3y/3gHNmZLgCUhAQKoOQ/9GsES1Wvv6doTuM/f+GX5sEA4z92VkR2s
2LGgnGuuRSKyFoR5UWkPrZt7mpnNVHtD1w0sdXdf6H+p5K4R4bkO0qmodlGyrFIx
OSWmFkyFNjbmftXQPYlWCsYNmHTySrbb60Yt03cQJ6wDy3lmVz2LPDAKXnwWxYpu
mCY3js+DteaVSajzvZMxW4dIAGRcjJn8d/MS0tF5Tkj+621/8HvdQvCK8Xijqfqo
Wdt4X3A7A9npewPFC95jWp/f6RRbS73+7pcWRCV6JCJ99yLW3fvXAn23HrExFSo6
9DcISawlDnS6Wg1QGOgDUN1zgbXccupL4DCbs4FbFh54Dq6GvxR2MosFatdNwjSw
3u3EKO711pc/TplYlCjylUN+ORrsOtHfL3Psz4Yez4LWB427YtMflmv7ONF2IUlU
2Gvssvi5Dtv0P0mLISAgxFlT0i8NR8QMxK8zBTJ9p9e0KYKDmdXEGAVcQXfWllUh
3ufVOr/9Yf+5g4SjxDot1TpAGhImaPbSnNRiWK8dGEiqUU1/Ies/7uPZNLgK0XZL
7D5+++Pu6eoYzu1EZyc8CxRtm3xbunXXaRkdqeNL1TGo36uAlcigHdpOE1BUk8gG
wozu3vWeHDwhWocf2sK/pmixejdxqYIO9zTkbOremFn2R3cbOHcCK9UsG7cd2khd
08CrnNc/xng=
=r8e3
-----END PGP SIGNATURE-----
