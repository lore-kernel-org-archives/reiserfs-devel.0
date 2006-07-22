From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 status (correction)
Date: Fri, 21 Jul 2006 21:48:29 -0500
Message-ID: <44C191FD.4010302@slaphack.com>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>	 <44C093D2.1040703@namesys.com>	 <1153514509.6659.41.camel@ipso.snappymail.ca>	 <44C141C4.1030802@slaphack.com>	 <1153517853.6659.56.camel@ipso.snappymail.ca>	 <44C157D2.5060202@slaphack.com> <1153525982.6659.108.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29126-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153525982.6659.108.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Benoit <ipso@snappymail.ca>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

Mike Benoit wrote:
> Your detailed explanation is appreciated David and while I'm far from a
> file system expert, I believe you've overstated the negative effects
> somewhat.
> 
> It sounds to me like you've gotten Reiser4's allocation process in
> regards to wandering logs correct, from what I've read anyways, but I
> think you've overstated its fragmentation disadvantage when compared
> against other file systems.
> 
> I think the thing we need to keep in mind here is that fragmentation
> isn't always a net loss. Depending on the workload, fragmentation (or at
> least not tightly packing data) could actually be a gain. In cases where

defragmented != tightly packed.

> you have files (like log files or database files) that constantly grow
> over a long period of time, packing them tightly at regularly scheduled
> intervals (or at all?) could cause more harm then good. 

This is true...

> Consider this scenario of two MySQL tables having rows inserted to each
> one simultaneously, and lets also assume that the two tables were
> tightly packed before we started the insert process.
> 
> 1 = Data for Table1
> 2 = Data for Table2 
> 
> Tightly packed:
> 
> 111111111111222222222222----------------------------
> 
> Simultaneous inserts start:
> 
> 1111111111112222222222221122112211221122------------
> 

> Allocate on flush alone would probably help this scenario immensely. 

Yes, it would.  You'd end up with

1111111111112222222222221111111122222222------------

assuming they both fit into RAM.  And of course they could later be 
repacked.

By the way, this is the NTFS approach to avoiding fragmentation -- try 
to avoid fragmenting anything below a certain block size.  I, for one, 
would be perfectly happy if my large files were split up every 50 or 100 
megs or so.

The problem is when you get tons of tiny files and metadata stored so 
horribly inefficiently that things like Native Command Queuing is 
actually a huge performance boost.

> The other thing you need to keep in mind is that database files are like
> their own little mini-file system. They have their own fragmentation
> issues to deal with (especially PostgreSQL).

I'd rather not add to that.  This is one reason to hate virtualization, 
by the way -- it's bad enough to have a fragmented NTFS on your Windows 
installation, but worse if the disk itself is a fragmented sparse file 
on Linux.

> So in cases like you
> described where you are overwriting data in the middle of a file,
> Reiser4 may be poor at doing this specific operation compared to other
> file systems, but just because you overwrite a row that appears to be in
> the middle of a table doesn't mean that the data itself is actually in
> the middle of the table. If your original row is 1K, and you try to
> overwrite it with 4K of data, it most likely will be put at the end of
> the file anyways, and the original 1K of data will be marked for
> overwriting later on. Isn't this what myisampack is for?

If what you say is true, isn't myisampack also an issue here?  Surely it 
doesn't write out an entirely separate copy of the file?

Anyway, the most common usage I can see for mysql would be overwriting a 
1K row with another 1K row, or dropping a row, or adding a wholly new 
row.  I may be a bit naive here...

But then, isn't there also some metadata somewhere which says things 
like how many rows you have in a given table?

And it's not just databases.  Consider BitTorrent.  The usual BitTorrent 
way of doing things is to create a sparse file, then fill it in randomly 
as you receive data.  Only if you decide to allocate the whole file 
right away, instead of making it sparse, you gain nothing on Reiser4, 
since writes will be just as fragmented as if it was sparse.

Personally, I'd rather leave it as sparse, but repack everything later.

> So while I think what you described is ultimately correct, I believe
> extreme negative effects from it to be a corner case, and probably not
> representative of the norm. I also believe that other Reiser4
> improvements would outweigh this draw back to wandering logs, again in
> average workloads. 

Depends on your definition of average.  I'm also speaking from 
experience.  On Gentoo, /usr/portage started out being insanely fast on 
Reiser4, because it barely had to seek at all -- despite being about 
145,000 small files.  I think it was maybe half that when I first put it 
on r4, but it's more than twice as slow now, and you can hear it thrashing.

Now, the wandering logs did make the rsync process pretty fast -- the 
entire thing gets rsync'd against one of the Gentoo mirrors.  For anyone 
using Debian, this is the equivalent of "apt-get update".

Only now, this rsync process is not only entirely disk-bound, it's 
something like 10x as slow.  I have a gig of RAM, so at least it's fast 
once it's cached, but it's obviously horrendously fragmented.  I am not 
sure if it's individual files or directories, but it could REALLY use a 
repack.

 From what I remember of v3, it was never quite this bad, but it never 
started out as fast as it did on Reiser4.

This is why I'm curious to see some benchmarks, by the way -- all of 
this is subjective, and from memory.

> Like you mentioned, if Reiser4 performance gets so poor without the
> repacker, and Hans decides to charge for it, I think that will turn away
> a lot potential users as they could feel that this is a type of
> extortion. Get them hooked on something that only performs well for a
> certain amount of time, then charge them money to keep it up. I also
> think the community would write their own repacker pretty quick in
> response. 

Depends.  Unfortunately, it's far more likely that the community would 
go "fsck this" and use XFS instead.  Or JFS.  Or any of the other 
filesystems that Linux has which don't need a repacker.

It would eventually get done by the community, but if it's taking the 
Namesys guys this long, and if they really expect to be able to make 
money off of it, it must not be as trivial as I think it is.

> A much better approach in my opinion would be to have Reiser4 perform
> well in the majority of cases without the repacker, and sell the
> repacker to people who need that extra bit of performance. If I'm not
> mistaken this is actually Hans intent.

Hans?

> If Reiser4 does turn out to
> perform much worse over time, I would expect Hans would consider it a
> bug or design flaw and try to correct the problem however possible. 

Or a design constraint...

> But I guess only time will tell if this is true or not. ;)

I'll tell you now it's true.

To be fair, I'm not entirely up to date, but I've had a Reiser4 root 
partition for over a year now.  It seems pretty decent for most things, 
but I've definitely noticed that anywhere like /usr/portage -- lots of 
files changing, lots staying the same, over time -- ends up pretty badly 
fragmented.  Other examples would be games, especially Steam games and 
MMOs, played using Wine.

And I'd like some benchmarks, but I strongly suspect that this problem 
is pretty bad -- and that the more you'd think a particular workload is 
suited for Reiser4, the better the benchmarks are initially, the worse 
it will degrade if there's any writing going on.
