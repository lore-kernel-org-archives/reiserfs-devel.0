From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Wed, 27 Nov 2002 15:46:47 +0300
Message-ID: <200211271546.47417.vitaly@namesys.com>
References: <20021125143634.GC9006@mail.cekit.cz> <20021126225625.GB16567@mail.cekit.cz> <20021127103315.A3712@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12053-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021127103315.A3712@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, Mira Tempir <mira-list@cekit.cz>
Cc: reiserfs-list@namesys.com

>
> > I'm not sure, if this is what you wanted and how this can help:
> > (gdb) bt
> > #0  0x40078fc5 in memmove () at ../sysdeps/generic/memmove.c:108
> > #1  0x805881f in __mark_objectid_really_used (map=0x8110b20, id=413432,
> > pos=27804) at uobjectid.c:203
> > #2  0x80588e4 in mark_objectid_really_used (map=0x8110b20, id=413432)
> > 	at uobjectid.c:240
> > #3  0x804e5ed in pass0_correct_leaf (fs=0x808a9d8, bh=0x80fc0c4)
> > 	at pass0.c:1254
> > #4  0x804ed93 in do_pass_0 (fs=0x808a9d8) at pass0.c:1498
> > #5  0x804fda2 in pass_0 (fs=0x808a9d8) at pass0.c:1893
> > #6  0x804a851 in rebuild_tree (fs=0x808a9d8) at main.c:737
> > #7  0x804b7bf in main (argc=3, argv=0xbffffcd4) at main.c:1102
> >
> > (gdb) bt
> > #0  0x40078fc5 in memmove () at ../sysdeps/generic/memmove.c:108
> > #1  0x805881f in __mark_objectid_really_used (map=0x8110b20, id=4210980,
> > pos=139062) at uobjectid.c:203
> > #2  0x80588e4 in mark_objectid_really_used (map=0x8110b20, id=4210980)
> > 	 at uobjectid.c:240
> > #3  0x804e5a6 in pass0_correct_leaf (fs=0x808a9d8, bh=0x808ab18) at
> > pass0.c:1251 #4  0x804ed93 in do_pass_0 (fs=0x808a9d8) at pass0.c:1498
> > #5  0x804fda2 in pass_0 (fs=0x808a9d8) at pass0.c:1893
> > #6  0x804a851 in rebuild_tree (fs=0x808a9d8) at main.c:737
> > #7  0x804b7bf in main (argc=3, argv=0xbffffcd4) at main.c:1102
> > Maybe more interesting could be output from profiler:
> >
> > Flat profile:
> >
> > Each sample counts as 0.01 seconds.
> >   %   cumulative   self              self     total
> >  time   seconds   seconds    calls  ms/call  ms/call  name
> >  80.52    118.11   118.11   174768     0.68     0.68  memmove
> >   8.69    130.86    12.75                             __mcount_internal
> >   2.07    133.89     3.03    94972     0.03     0.03  read
> >   1.55    136.16     2.27                             mcount
> >   1.35    138.14     1.98    96611     0.02     0.02  memset
> >   1.21    139.92     1.78 64747384     0.00     0.00 
> > reiserfs_bitmap_test_bit 0.68    140.92     1.00        1  1000.00 
> > 2809.34  reiserfs_fetch_ondisk_bitmap 0.52    141.68     0.76 24852879   
> >  0.00     0.00  comp_ids
> >   0.50    142.42     0.74    72662     0.01     1.69  pass0_correct_leaf
> >   0.28    142.83     0.41 13535446     0.00     0.00  get_type
> >   0.26    143.21     0.38  1510128     0.00     0.00  reiserfs_bin_search
> >   0.20    143.50     0.29    94971     0.00     0.00  llseek
> >   0.16    143.73     0.23  2254456     0.00     0.00  block_of_bitmap
> >   0.15    143.95     0.22   351991     0.00     0.00  _IO_vfscanf
> >   0.12    144.12     0.17   354988     0.00     0.00  vfprintf
> >   0.10    144.26     0.14  2235113     0.00     0.00 
> > reiserfs_bitmap_set_bit 0.09    144.39     0.13   704574     0.00    
> > 0.00  _IO_str_init_static 0.09    144.52     0.13    92006     0.00    
> > 0.00  time
> > ...
> > Is it ok with memmove ?
>
> Vitaly, what do you think about these?

Did you run fsck some times during last days and you had the 
same low speed, right?

memmove is called when an item is removed and when an objectid 
is marked as used in objectid map. Backtraces say that it is 
the second case here, strange. Could you run reiserfsck again, 
wait for such a low speed and look at map->m_page_count and 
map->m_used_slots_count from mark_objectid_really_used.

And it is strange also that there are so many wrong tails. 
Which kernels did you use before? Which kernel do you think 
you used when the most amount of files were created? 

Ok, that snapshot of the fs, Oleg asked you for, would give
us some answers, at lest about map size.

-- 

Thanks,
Vitaly Fertman


