From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Tue, 21 Jun 2005 19:47:13 -0700
Message-ID: <42B8D131.6060502@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>	<42B831B4.9020603@pobox.com.suse.lists.linux.kernel>	<42B87318.80607@namesys.com.suse.lists.linux.kernel>	<20050621202448.GB30182@infradead.org.suse.lists.linux.kernel>	<42B8B9EE.7020002@namesys.com.suse.lists.linux.kernel>	<42B8BB5E.8090008@pobox.com.suse.lists.linux.kernel> <p73fyvbb2rh.fsf@verdi.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24439-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <p73fyvbb2rh.fsf@verdi.suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: Jeff Garzik <jgarzik@pobox.com>, hch@infradead.org, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Andi Kleen wrote:

> Christoph does a lot of reviewing 
>
and he is notorious for making needed linux contributors go away and not
come back, and I won't say which famous person on this mailing list told
me that....

>and your child definitely
>is in serious need of that to be mergeable. I'm sure Christoph is able
>to review inpartially even when he is involved with other FS.
>  
>
As impartial as a puppy on PCP....

Christoph is aggressive about things he does not take the time to
understand or ask about first.  I hate that.   I wish he would go away
please.  He is not exactly an Ousterhout, Rob Pike, Granger, Mazieres,
Frans Kaashoek, etc.,  in his accomplishments, so why is he reviewing
other people's filesystems?  Reviews are great, how about finding
persons who have created filesystem innovations (and thus are less
likely to reject innovations without understanding them) to do them? 

How about review by benchmark instead?

It works, it runs faster than the competition, users like it, we
addressed the core kernel patch complaints, it should go in and receive
the exposure that will result in lots of useful improvements and
suggestions.   It seems like we are getting an unusual review process. 

I used a bunch of algorithms for which there was a consensus among those
consulted that the algorithms were a bad idea, only the fact that I paid
for the code to be written and required that it be done my way (ignoring
the "you just use me as a typewriter" remarks as best I could)  caused
the algorithms to get implemented at all, and the benchmarks then proved
the algorithms were a good idea.  V3 performance sucks in major part
because I listened to the consensus when I knew better.   I don't really
care for consensus on my FS anymore.   If you guys want to understand
what I am doing I am happy to talk about it extensively, but please
don't require that I groupthink.  I frankly think that with my
benchmarks, I should be allowed to tinker on my own. 

Hans The Mad
