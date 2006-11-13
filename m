From: Christopher Chan <chrisfz@netvigator.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Mon, 13 Nov 2006 17:34:59 +0800
Message-ID: <45583C43.5070904@netvigator.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>	<454A596F.8070909@namesys.com>	<194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>	<200611081015.14320.biscani@pd.astro.it>	<20061108102136.GS6012@schatzie.adilger.int> <ej4pca$tft$1@sea.gmane.org> <4557E254.5060404@netvigator.com> <45582353.3070709@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45582353.3070709@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com

David Masover wrote:
> Christopher Chan wrote:
>> Danny Milosavljevic wrote:
> 
>>> The only possibility one could still lose mail when having proper
>>> hardware failsafes would be if the kernel had a bug and crashed (and
>>> that's
>>> so bad, it doesn't really warrant any working around it).
>> Ever used DOS with smartdrv? smartdrv gave a performance boost by
>> storing recently touched files in memory and writing to disk later. This
>> is called a disk cache. You would be explicitly told to NOT just turn
>> off the computer each time smartdrv was loaded. You had to first clear
>> the cache and then you could power off the box otherwise you would lose
>> any data sitting in the cache that had not been flushed.
> 
> Which means that, if you have proper hardware failsafes, you will only
> lose data if you don't properly clear the cache before shutting down
> (which Linux shutdown scripts will do for you), or if there's a crash.
> I'm sure many people used smartdrv without problems, and appreciated the
> performance boost.

Which is why data important software use fsync/fsyncdata to minimize 
data loss from crashes.

> 
> Moral of the story: Data loss is a Bad Thing. Those who would give up
> essential data safety for a little temporary performance deserve
> neither. (With apologies to Ben Franklin.)
> 
> And while reading this, it's important to keep in mind that I do not
> practice what I've just preached. I'm addicted to the performance, and I
> could probably argue the other side just as effectively. Besides, at
> least on my experimental/gaming rig, I like a little adrenaline in my
> admin work!
> 

Try arguing why you lost thousands of mails when the box crashed and 
justifying it.
