From: John Gilmore <jgilmore@glycou.com>
Subject: Re: More Slowdown
Date: Thu, 17 Nov 2005 10:34:59 +0000
Message-ID: <200511171035.00148.jgilmore@glycou.com>
References: <200511111359.39715.jgilmore@glycou.com> <437C715A.206@ursynow.2a.pl> <437C7A59.7040008@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26985-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437C7A59.7040008@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 17 November 2005 12:40, Vladimir V. Saveliev wrote:
> Please try whether the attached patch improves anything. It simplifies
> fsync by avoid commiting of transactions which do not modify file being
> fsync-ed.
>
> The patch applied to 2.6.14-mm2 with warnings, but that can be ignored.

I haven't tried this patch yet, but I did try the earlier 'disable fsync 
completely' patch. In fact, I'm using it right now.

It doesn't help. Therefore, your patch probably won't help either.

OK, disabling fsync does help a *little* bit. But I think that the issue (for 
me, anyway) isn't sync per se, it's just flat-out access time. Deleteing lots 
of small files is EXTREMELY slow, but even reading files is slower than it 
should be. It took no less that 10 minutes to delete an old kernel source 
tree, for instance. 

It's related to fragmentation, I think. I didn't really notice any speed 
problems until my hard drive got to about 95% (or so) full. But they haven't 
gone away, even though usage is now down around 54%.

Hrm... I should be able to check that...


About an hour later...

So maybe I was wrong. 6.5% data fragmentation doesn't seem that high. But 
19.8% tree fragmentation does seem a bit high. 

How should this data be interpreted?


#measurefs.reiser4 -T /dev/mapper/e-h -f
measurefs.reiser4 1.0.5
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by 
reiser4progs/COPYING.

Tree fragmentation ... done
0.197747

#measurefs.reiser4 -S -D /dev/mapper/e-h -f
measurefs.reiser4 1.0.5
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by 
reiser4progs/COPYING.

Data fragmentation ... done
0.065593
Tree statistics ... done
Packing statistics:
  Formatted nodes:    3721.29b (90.85%)
  Branch nodes:       1734.57b (42.35%)
  Twig nodes:         2886.97b (70.48%)
  Leaf nodes:         3814.82b (93.14%)

Node statistics:
  Total nodes:        8543553
  Formatted nodes:     146354
  Unformatted nodes:  8397199
  Branch nodes:           292
  Twig nodes:           10542
  Leaf nodes:         8532719

Item statistics:
  Total items:         637352
  Nodeptr items:       146353
  Statdata items:     191218
  Direntry items:       17512
  Tail items:          245018
  Extent items:         36869


#
