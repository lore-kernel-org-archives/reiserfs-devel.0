From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 15:03:11 -0500
Message-ID: <44F49D7F.3010403@slaphack.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>	 <20060828173721.GA11332@hello-penguin.com>	 <44F332D6.6040209@namesys.com>	 <1156801705.2969.6.camel@nigel.suspend2.net>	 <20060829045937.GA9181@localhost.hsdv.com>	 <op.te1sixuycigqcu@apollo13>	 <20060829143814.GA21868@hello-penguin.com>	 <op.te1yjbp7cigqcu@apollo13> <44F47FEB.9060005@namesys.com>	 <44F4880C.3050507@slaphack.com> <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com> <44F4914A.1010005@slaphack.com> <44F4979E.9020101@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29745-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44F4979E.9020101@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Gregory Maxwell <gmaxwell@gmail.com>, PFC <lists@peufeu.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Hans Reiser wrote:
> David Masover wrote:
>>   John Carmack is pretty much the only superstar programmer in video
>> games, and after his first fairly massive attempt to make Quake 3 have
>> two threads (since he'd just gotten a dual-core machine to play with)
>> actually resulted in the game running some 30-40% slower than it did
>> with a single thread.
> Do the two processors have separate caches, and thus being overly fined
> grained makes you memory transfer bound or?

It wasn't anything that intelligent.  Let me see if I can find it...

Taken from
http://techreport.com/etc/2005q3/carmack-quakecon/index.x?pg=1

"Graphics accelerators are a great example of parallelism working well, 
he noted, but game code is not similarly parallelizable. Carmack cited 
his Quake III Arena engine, whose renderer was multithreaded and 
achieved up to 40% performance increases on multiprocessor systems, as a 
good example of where games would have to go. (Q3A's SMP mode was 
notoriously crash-prone and fragile, working only with certain graphics 
driver revisions and the like.) Initial returns on multithreading, he 
projected, will be disappointing."

Basically, it's hard enough to split what we currently do onto even 2 
CPUs, and it definitely seems like we're about to hit a wall in CPU 
frequency just as multicore becomes a practical reality, so future CPUs 
may be measured in how many cores they have, not how fast each core is.

There's also a question of what to use the extra power for.  From the 
same presentation:

"Part of the problem with multithreading, argued Carmack, is knowing how 
to use the power of additional CPU cores to enhance the game experience. 
A.I., can be effective when very simple, as some of the first Doom logic 
was. It was less than a page of code, but players ascribed complex 
behaviors and motivations to the bad guys. However, more complex A.I. 
seems hard to improve to the point where it really changes the game. 
More physics detail, meanwhile, threatens to make games too fragile as 
interactions in the game world become more complex."

So, I humbly predict that Physics cards (so-called PPUs) will fail, and 
be replaced by ever-increasing numbers of cores, which will, for awhile, 
be one step ahead of what we can think of to fill them with.  Thus, 
anything useful (like compression) that can be split off into a separate 
thread is going to be useful for games, and won't hurt performance on 
future mega-multicore monstrosities.

The downside is, most game developers are working on Windows, for which 
FS compression has always sucked.  Thus, they most often implement their 
own compression, often something horrible, like storing the whole game 
in CAB or ZIP files, and loading the entire level into RAM before play 
starts, making load times less relevant for gameplay.  Reiser4's 
cryptocompress would be a marked improvement over that, but it would 
also not be used in many games.
