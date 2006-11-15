From: Christopher Chan <chrisfz@netvigator.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Wed, 15 Nov 2006 11:21:52 +0800
Message-ID: <455A87D0.7030404@netvigator.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>	<454A596F.8070909@namesys.com>	<194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>	<200611081015.14320.biscani@pd.astro.it>	<20061108102136.GS6012@schatzie.adilger.int> <ej4pca$tft$1@sea.gmane.org> <4557E254.5060404@netvigator.com> <45582353.3070709@slaphack.com> <45583C43.5070904@netvigator.com> <45589ECD.4070105@slaphack.com> <45595BBC.6000602@netvigator.com> <455986CB.6010608@slaphack.com> <45599454.1070701@netvigator.com> <455A0E5A.9060404@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <455A0E5A.9060404@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com

David Masover wrote:
> Christopher Chan wrote:
>> Anyway I guess you are smarter than Hans then since you obviously
>> feel that his use of fsync is a bit of unneeded integrity.
> 
> I'm not going to respond to this until you phrase it in a way which
> doesn't gossip about Hans. Unless something has changed, Hans is still
> unable to communicate on this list, so it's entirely unfair for either
> of us to put words in his mouth as long as he isn't here to defend himself.

Look, the reason why reiser4 uses fsync is to guarantee data and 
filesystem integrity which from what I have heard is far better than 
that of ext3 which is at the moment the leader in this regard.

> 
>>> Anyway, this rant went on longer than I wanted it to, but since I've
>>> brought it down to a question of economics, I don't really know the
>>> answer. I do think, however, that arguing always for or against fsync
>>> is absolutist and ultimately wrong.
>> Obviously we should take this question of fsync to its creator and all
>> those who use it since they are all crippling their software
>> implementing this dreadful useless function and actually making use of it.
> 
> I'm sorry, did I say it was useless?  And I quote:
> 
> "arguing always for OR AGAINST fsync is absolutist and ultimately wrong."
> 
> I'm not saying fsync is always the wrong choice, either. I'm simply
> saying it isn't always the right one.

When ANY piece of software be it a database, mta or a filesystem wants 
to know that what was written is safe on disk, it uses fsync, end of 
story. NO filesystem worth its salt will not not use fsync or fsyncdata 
when its come to the part of wanting a guarantee that data/metadata has 
been written to disk.

> 
> And no, I'm not impressed by what the majority thinks. On a larger
> scale, the majority thinks Windows is their only real option, and that
> computers are inherently unstable and insecure, and that software
> engineers will never listen to them and always make it their fault.

The majority really have no choice. Most of the software they need are 
on Windows. If Linux had come out earlier or GNU had a viable working 
solution earlier or they had got more exposure, Unix might have been the 
dominant desktop OS instead of DOS/Windows/M$. I do not believe the 
majority chose to think Windows is their only real option. You can put 
in something else and they will happily use it until they find out they 
cannot use 'necessary software that runs on Windows only' and then they 
switch back. If you look at how Apple has been rather successful with 
their desktops/laptops you can see that some people are prepared to dump 
Windows for what it is, a piece of unstable and insecure crap.

Open source too has to share part of the blame when it comes to the desktop.

> 
> If you're going to debate this, please try to debate it with just you
> and me. You shouldn't need to invoke Hans-who-isn't-here, or every
> software engineer in the past 20 years. If your point is really that
> solid, it should stand on its own, without you having to intimidate me
> about how stupid I am for questioning established practices.

If you had brought up a solid point against fsync instead of completely 
irrelevant comparisons and sticking to your faulty points then I won't 
have bothered pointing out that you are being stupid for questioning 
established practices without grounds.

> 
> I'd rather drop the debate, because, as I said, we mostly agree.

I am not sure we do. Until you drop the fsync is unnecessary for data 
integrity part, we don't.

> 
>> How could I ever forget that banks use unreliable media?
> 
> So how do they deal with that issue? (Or are you being sarcastic?)
> 
> Obviously, fsync won't save them, so how do they deal with it?

Come on, David, stop acting like some ignorant admin. Media problems are 
migitated by having redundant failovers available.

> 
>>> I won't speculate on Hans' opinions on whether fsync is really a good
>>> design decision -- at least, not without him able to respond.
>> You don't have to. He did not create fsync and so you don't have to
>> worry about whether fsync is a good design decision.
> 
> He could have as easily removed it, the way I patched it out. Pretended
> to implement it, but simply have a stub that always returns success.

Heh. Did you know that there was a time that Linux pretended to sync 
when it did not actually do it? The result? fsck, fsck, fsck

> 
> He certainly has opinions about whether fsync is a good idea, why he
> wants reiser4 to have better fsync performance, and many other things
> that we should not discuss in his absence.

The only way you can get better fsync performance is to use RAID under 
the filesystem or do full journaling on a NVRAM block device. Get this 
through your head. fsync is not written/created by Hans. fsync was 
already part of the Unix 98, Unix 95, 4.3BSD and SVID 3 APIs. (see 
http://www.unix.org/apis/1.r.html) I doubt very much that Hans has any 
opinions whatsoever on a standard API call. So you can stop the Hans is 
not here nonsense.

> 
> Until Hans is back on the list, any email which says anything about
> Hans' opinions or intelligence is no better than teenage gossip. Please,
> stop acting like a high-school girl.
> 
> 

Ooh, where did I say anything about Hans' opinions or intelligence?
