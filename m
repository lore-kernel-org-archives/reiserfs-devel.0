From: David Masover <ninja@slaphack.com>
Subject: Re: some testing questions
Date: Tue, 15 Aug 2006 16:52:47 -0500
Message-ID: <44E2422F.8090708@slaphack.com>
References: <44DCC20C.7020400@email.si> <200608141615.58185.vs@namesys.com> <20060815142140.GA4247@kruemel> <44E228B7.10505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29601-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44E228B7.10505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Ingo Bormuth <ibormuth@efil.de>, reiserfs-list@namesys.com

Hans Reiser wrote:
> Ingo Bormuth wrote:
>>
>> #df:
>> /dev/hda8              6357768   3478716   2879052  55% /cache
>>  
>> Before doing so, the partition was >90% full. 
> The performance difference between >90% full and 55% full will be large
> on every filesystem.  When we ship a repacker, that will be less true,
> because we will have large chunks of unused space after the repacker runs.

Not always true.  For one, doesn't Reiser4 arbitrarily reserve 5%?  For 
another, look at his results -- unless I'm wrong, that's 3-7% 
fragmentation.  If I'm wrong, it's more like .03-.07%.

And lastly, at a certain point, percentages aren't really that accurate. 
  I've got a 350 or 400 gig partition which is 95% full, according to df 
(which if I was right about that 5%, it's more like 90% full) and that 
still leaves a solid 10-20 gigs free.

I mean, yes, performance will eventually start to suffer, but how much 
time and activity will it take to fragment 20 gigs of free space, 
especially with lazy allocation?
