From: kenny gorman <kgorman@panix.com>
Subject: Re: Reiserfs versions
Date: Mon, 18 Nov 2002 23:46:19 -0800
Message-ID: <3DD9EC4B.70907@panix.com>
References: <3DD97831.4030607@panix.com> <20021119093526.A32026@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

I poked around suse's site, and found the 'certified kernel' with:

2.4.16-64gb smp
reiserfs-3.x.0k_pre10-8

See any reason why this combination is not a good idea?

How do the version numbers work? I am confused about the 3.x notation 
and the 3.6 notation you used below...I upgraded my reiserfsprogs to 
3.6.4 just in case, but the filesystem rpm is still 3.x.0k_pre10-8 right?

Thanks!!!

-kg


Oleg Drokin wrote:
> Hello!
> 
> On Mon, Nov 18, 2002 at 03:30:57PM -0800, kenny gorman wrote:
> 
> 
>>I guess I want to get what would be considered the most stable 
>>combination of code vs. something bleeding edge, but also not old like 
>>what I have now (and thus prone to bugs...).  I really like reiserfs, 
>>but I have heard of (and experienced it now) about corruption problems.
>>Currently, I am running (no laughing..):
>>Suse 2.4.7-64GB-SMP
> 
> 
> Upgrade this to vanilla 2.4.19 or if you prefer SuSE stuff - to
> SuSE's errata 2.4.16 kernel.
> Actually you might try more recent 2.4.20-pre (or rc) stuff if you want, too
> if you do not feel it is too bleeding edge for you.
> 
> 
>>lvm-0.9.1_beta7-10
> 
> 
> Do not know about that.
> 
> 
>>reiserfs-3.x.0j-17
> 
> 
> This should be upgraded to latest reiserfsprogs which is 3.6.4.
> 3.x.0j is way too unstable.
> 
> Bye,
>     Oleg
> 
> .
> 



