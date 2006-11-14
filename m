From: Christopher Chan <chrisfz@netvigator.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Tue, 14 Nov 2006 18:03:00 +0800
Message-ID: <45599454.1070701@netvigator.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>	<454A596F.8070909@namesys.com>	<194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>	<200611081015.14320.biscani@pd.astro.it>	<20061108102136.GS6012@schatzie.adilger.int> <ej4pca$tft$1@sea.gmane.org> <4557E254.5060404@netvigator.com> <45582353.3070709@slaphack.com> <45583C43.5070904@netvigator.com> <45589ECD.4070105@slaphack.com> <45595BBC.6000602@netvigator.com> <455986CB.6010608@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <455986CB.6010608@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com


> So, you have to have a way to insure data integrity beyond flushing it 
> to disk. Flushing it to disk is just a bit of unneeded integrity, that 
> costs a little bit of performance, and would probably save your ass in 
> one or two edge cases, but those cases shouldn't normally happen, and if 
> you're properly prepared for the hardware failing, you're properly 
> prepared for those edge cases, also.

fsync costs a lot of performance. Disk I/O is orders of magnitude off 
RAM. Anyway I guess you are smarter than Hans then since you obviously 
feel that his use of fsync is a bit of unneeded integrity.

> 
> 
> Anyway, this rant went on longer than I wanted it to, but since I've 
> brought it down to a question of economics, I don't really know the 
> answer. I do think, however, that arguing always for or against fsync is 
> absolutist and ultimately wrong.

Obviously we should take this question of fsync to its creator and all 
those who use it since they are all crippling their software 
implementing this dreadful useless function and actually making use of it.

> 
> 
>>> Anyway, are we done here? I don't think I disagree with your points, 
>>> maybe just your absolutism.
>>
>> Ha! Got tell that to a bank or any body who uses a database to store 
>> important data. Hans knows what he is doing providing data guarantee 
>> with fsync.
> 
> Yes, he's providing warm fuzzies for the banks. What are the banks doing 
> about hard disk failure? Remember, fsync only guarantees the data was 
> successfully written to a physical media -- it doesn't guarantee the 
> data will still be there when you want to go read it.

How could I ever forget that banks use unreliable media?

> 
> I won't speculate on Hans' opinions on whether fsync is really a good 
> design decision -- at least, not without him able to respond.

You don't have to. He did not create fsync and so you don't have to 
worry about whether fsync is a good design decision.
