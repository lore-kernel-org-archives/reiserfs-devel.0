From: Dirk Schenkewitz <Dirk.Schenkewitz@interface-ag.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 14:25:44 +0100
Message-ID: <3E4A4B58.8504BAB3@interface-ag.com>
References: <93F527C91A6ED411AFE10050040665D0049C06D5@corpusmx1.us.dg.com> <3E4A266E.2A258472@interface-ag.com> <3E4A28F8.2030506@namesys.com> <3E4A35E9.1585BB5@interface-ag.com> <3E4A413A.9090609@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Hi Hans,

I should be more careful about what I optimize out from an email...

Hans Reiser schrieb:
> 
>Dirk Schenkewitz wrote:
> 
> >Hans Reiser schrieb:
> > >
> > >and if you can fit more data onto reiserfs partitions than onto
> > >ext3 partitions?
> > >
> >
> >That's what I'm looking for!
> >
> > >Is it a fair comparison to compare at equal percents full?
> >
> >Considered that way: No. Comparison should be between absolute
> >bytes I can put on a reiser-filesystem against an ext3-filesystem
> >while the partition sizes are equal. Hm. Please excuse me if this
> >is a FAQ: Can you give me a hint where to find such a comparison?
> >To put it in other words: How much more bytes can I put on a
> >reiser-fs compared to an ext3-fs when the partition sizes are
> >equal?
> >
> That depends on your file size distribution, and on whether you
> use the tails mount option.  Probably ~10% more.

~10%! Not bad!!

> Forgive me, it has been a while since it was measured. 
> Elena, can you copy the kernel source code onto a partition until 
> it fills up, make it a large partition please, and compare ext3 
> to reiserfs V3/V4?

Uhh - I didn't want to disturb something, even less to cause extra
work - now I feel guilty...

> >But even then: If I have more space available, I will happily
> >use it, so even if I can put 500 MB more on it, I will manage
> >to fill it up - what will happen then?
>
> I am not answering this because jeff improved things a lot, 
> and I don't know how good/bad they are currently....

I see. Thank you VERRRY MUCH - I stay tuned 8-)

Happy coding & best wishes
	dirk
-- 
Dirk Schenkewitz 

InterFace AG                 fon: +49 (0)89 / 610 49 - 126
Leipziger Str. 16            fax: +49 (0)89 / 610 49 - 83
D-82008 Unterhaching         
http://www.interface-ag.de   mailto:dirk.schenkewitz@interface-ag.de
