From: Oleg Drokin <green@namesys.com>
Subject: Re: rebuild-tree segfault
Date: Wed, 3 Jul 2002 11:49:44 +0400
Message-ID: <20020703114944.A12737@namesys.com>
References: <200207021515.31185.vitaly@namesys.com> <Pine.GSO.4.31.0207021724450.13166-100000@ux10.cso.uiuc.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10907-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.31.0207021724450.13166-100000@ux10.cso.uiuc.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Savchenko <savchenk@students.uiuc.edu>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Hello!

   Looks like somebody have overwritten your data with something,
   note warnings about incorrect bitmaps.
   36Mb of metadata you have (uncompressed?) is a copy of journal, superblock
   and bitmaps. How many leaves reported to be saved by debugreiserfs
   at the end of process?

Bye, 
    Oleg
On Tue, Jul 02, 2002 at 05:35:19PM -0500, Michael Savchenko wrote:
> Using reiserfsprogs-3.x.1c-pre7, reiserfsck --rebuild-tree:
> 
> ...
> ...
> ...
> init_source_bitmap: bitmap 740 (of 32768 bits) is wrong - make all blocks
> [24248
> 320 - 24281088] as used
> init_source_bitmap: bitmap 742 (of 32768 bits) is wrong - make all blocks
> [24313
> 856 - 24346624] as used
> init_source_bitmap: bitmap 743 (of 32768 bits) is wrong - make all blocks
> [24346
> 624 - 24379392] as used
> init_source_bitmap: bitmap 744 (of 32768 bits) is wrong - make all blocks
> [24379
> 392 - 24412160] as used
> init_source_bitmap: bitmap 745 (of 9286 bits) is wrong - make all blocks
> [244121
> 60 - 24421446] as used
> Skipping 8956 blocks (super block, journal, bitmaps) 18197265 blocks will
> be rea
> d
> 0%....20%....40%....60%....80%....100%                         left 0, 662
> /sec
> Could not find hash in use. Using "r5"
> 	"r5" hash is selected
> Flushing..done
> 	Read blocks (but not data blocks) 18197265
> 		Leaves among those 0
> 		Objectids found 2
> 
> Pass 1 (will try to insert 0 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. ok
> 
> Flushing..done
> 	0 leaves read
> 		0 inserted
> ####### Pass 2 #######
> Flushing..done
> 
> 
> 
> No reiserfs metadata found
> 
> 
> Aborted
> 
> 
> 
> Still can't mount, and reiserfsck has the same problem as before.
> What does it mean? debugreiserfs -p gives only 36M of metadata. Is my data
> gone?
> 
> 
> 
> On Tue, 2 Jul 2002, Vitaly Fertman wrote:
> >
> > Hi,
> >
> > It seems to be fixed in last reiserfsprogs. So you can
> > try the latest 3.x.1c-pre7 pre-release. If you want to
> > know for sure that it will work for you I can test it
> > when get your metadata.
> >
> > > Naturally, reiserfsck --check gives:
> > >
> > >   ###########
> > >   reiserfsck --check started at Tue Jul  2 05:42:40 2002
> > >   ###########
> > >   Replaying journal..
> > >   0 transactions replayed
> > >   Checking S+tree..
> > >
> > >   Bad root block 4294967295. (--rebuild-tree did not complete)
> > >
> > >   Aborted
> > >
> > >
> > > A filesystem definitely exists, as shown by debugreiserfs:
> >
> > This is OK, because we do not want somebody gets his partition
> > mounted after rebuild-tree failed.
> >
> > --
> >
> > Thanks,
> > Vitaly Fertman
> >
> >
> 
