From: Christopher Chan <chrisfz@netvigator.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Tue, 14 Nov 2006 14:01:32 +0800
Message-ID: <45595BBC.6000602@netvigator.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>	<454A596F.8070909@namesys.com>	<194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>	<200611081015.14320.biscani@pd.astro.it>	<20061108102136.GS6012@schatzie.adilger.int> <ej4pca$tft$1@sea.gmane.org> <4557E254.5060404@netvigator.com> <45582353.3070709@slaphack.com> <45583C43.5070904@netvigator.com> <45589ECD.4070105@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30158-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45589ECD.4070105@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com


>> Which is why data important software use fsync/fsyncdata to minimize 
>> data loss from crashes.
> 
> If (and only if) you actually read and accepted the paragraph you're 
> quoting there, the point is that using fsync and fdatasync on these is 
> kind of like doing bad block relocation in software, when the hard disk 
> is already doing it for you. There are situations where it's useful, but 
> mostly, it's just a performance drain without a point.

You have no idea what fsync/fsyncdata does. They cannot be compared to 
bad block relocation at all. That is an apples to oranges comparison.

> 
> I don't necessarily agree with this point of view, but there you go.
> 
>>> could probably argue the other side just as effectively. Besides, at
>>> least on my experimental/gaming rig, I like a little adrenaline in my
>>> admin work!
>>>
>>
>> Try arguing why you lost thousands of mails when the box crashed and 
>> justifying it.
> 
> There aren't thousands of mails on my experimental dev/gaming rig. Also, 
> it hasn't crashed in a month or two (I seem to have upgraded/hacked my 
> way out of its last major crasher), and it's running all kinds of 
> experimental stuff. Sure, individual programs crash from time to time 
> (especially my hacks), but that's irrelevant to the fsync discussion.

I was not referring to your gaming rig. Did you say that you don't use 
fsync for your production boxes?

> So, as far as I can tell, this mailserver (that I'm sending this from 
> right now), which is amd64/reiser4/no_fsync, hasn't lost a single 
> message. And I don't even have an APM on it (although that reminds me, I 
> need to buy one now, as in, "tomorrow" now.)

Heh. Just wait till you get a crash shortly after a write with fsync 
disabled.

> 
> Anyway, are we done here? I don't think I disagree with your points, 
> maybe just your absolutism.

Ha! Got tell that to a bank or any body who uses a database to store 
important data. Hans knows what he is doing providing data guarantee 
with fsync. I was very surprised when I heard all those reports about 
zero data loss on reiser4 boxes after a crash. Now I have an idea why.
