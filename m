From: Dirk Schenkewitz <Dirk.Schenkewitz@interface-ag.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 12:54:17 +0100
Message-ID: <3E4A35E9.1585BB5@interface-ag.com>
References: <93F527C91A6ED411AFE10050040665D0049C06D5@corpusmx1.us.dg.com> <3E4A266E.2A258472@interface-ag.com> <3E4A28F8.2030506@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12710-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>

Hi Hans,

Hans Reiser schrieb:
> 
> Dirk Schenkewitz wrote:
> 
> >Wayne,
> >
> >berthiaume_wayne@emc.com schrieb:
> >
> >
> >>     Dirk, I'd be interested in hearing from you your performance
> >>experience with ext3 when it reaches 96% full.
> >>
> >>
> >
> >Well (*shrug*), there seems to be nothing special about it. I did
> >not do any timing test when such a fileysytem went full. In fact,
> >becoming 100% full is not "mormal", it happens when I put stuff
> >on it just to have it out of the way for some time. The filesystem
> >is then used as some kind of "storage cellar".
> >
> >Aside from that - speed becomes noticeable (I believe, at least)
> >when using 'xv' on a directory with lots of pictures, say, between
> >2000 and 3000, and the thumbnails are loaded during the first access.
> >This takes more than a minute (estimated, I did not look at the
> >clock).
> >
> >Another thing is when 'xv' creates the thumbnails. A few times it
> >happened that a filesystem which was rather full ran out of space
> >when creating the thumbnails. (That's not critical, all you "loose"
> >are some of the thumbnails, which can be recreated any time later.)
> >But I don't know how/when 'xv' stores the thumbnails, I only know
> >that they are kept in memory as long as they are in use. Then linux
> >itself does some buffering, so only the first access on a directory
> >can make a testimony. That said, I can can only talk of my subjec-
> >tive impressions, and I have not noticed any slowdown until there
> >are 0 bytes left. But it is hard to tell, because the difference
> >between 96% and 100% are only 320 MB on a 8 GB partition, and that
> >space fills up rather fast.
> >
> >While you ask - what are the "amounts" of slowdown if a reiserfs
> >gets more than 96% full?
> > - Less than 4% percent? (I might not notice that.)
> > - between 4% and 8%? (I might notice, but I can live with that
> >   easily. Then again, ext3 doesn't seem to have such problems.)
> > - more than 8%, maybe much more? (That might become annoying.
> >   In that case I believe that ext3 is better for my purposes.)
> >
> >You see, I'm not an expert, I'm "just using filesystems". Please
> >take the mentioned percentages as guesses - depending on the
> >situation, I might not even notice 10% slowdown...
> >
> >Hope that answers your question - does it?
> >
> >Happy coding
> >       dirk
> >
> >
> and if you can fit more data onto reiserfs partitions than onto 
> ext3 partitions?

That's what I'm looking for!

> Is it a fair comparison to compare at equal percents full?

Considered that way: No. Comparison should be between absolute
bytes I can put on a reiser-filesystem against an ext3-filesystem
while the partition sizes are equal. Hm. Please excuse me if this
is a FAQ: Can you give me a hint where to find such a comparison?
To put it in other words: How much more bytes can I put on a
reiser-fs compared to an ext3-fs when the partition sizes are
equal?
But even then: If I have more space available, I will happily
use it, so even if I can put 500 MB more on it, I will manage
to fill it up - what will happen then?

Thanks for reading & answering (also in advance :-))
	dirk

-- 
Dirk Schenkewitz 

InterFace AG                 fon: +49 (0)89 / 610 49 - 126
Leipziger Str. 16            fax: +49 (0)89 / 610 49 - 83
D-82008 Unterhaching         
http://www.interface-ag.de   mailto:dirk.schenkewitz@interface-ag.de
