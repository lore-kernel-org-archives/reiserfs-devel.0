From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 status (correction)
Date: Fri, 21 Jul 2006 17:40:18 -0500
Message-ID: <44C157D2.5060202@slaphack.com>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>	 <44C093D2.1040703@namesys.com>	 <1153514509.6659.41.camel@ipso.snappymail.ca>	 <44C141C4.1030802@slaphack.com> <1153517853.6659.56.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29117-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153517853.6659.56.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Benoit <ipso@snappymail.ca>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

Mike Benoit wrote:
> On Fri, 2006-07-21 at 16:06 -0500, David Masover wrote:
>> Mike Benoit wrote:
>>
>>> Tuning fsync will fix the last wart on Reiser4 as far as benchmarks are
>>> concerned won't it? Right now Reiser4 looks excellent on the benchmarks
>>> that don't use fsync often (mongo?), but last I recall the fsync
>>> performance was so poor it overshadows the rest of the performance. It
>>> would also probably be more useful to a much wider audience, especially
>>> if Namesys decides to charge for the repacker.
>> If Namesys does decide to charge for the repacker, I'll have to consider 
>> whether it's worth it to pay for it or to use XFS instead.  Reiser4 
>> tends to become much more fragmented than most other Linux FSes -- 
>> purely subjective, but probably true.
>>
> 
> I would like to see some actual data on this. I haven't used Reiser4 for
> over a year, and when I did it was only to benchmark it. But Reiser4
> allocates on flush, so in theory this should decrease fragmentation, not
> increase it. Due to this I question what you are _really_ seeing, or if
> perhaps it is a bug in the allocator? Why would XFS or any other
> multi-purpose file system resist fragmentation noticeably more then
> Reiser4 does.

Maybe not XFS, but in any case, Reiser4 fragments more because of how 
its journaling works.  It's the wandering logs.

Basically, when most Linux filesystems allocate space, they do try to 
allocate it contiguously, and it generally stays in the same place. 
With ext3, if you write to the middle of a file, or overwrite the entire 
file, you're generally going to see your writes be written once to the 
journal, and then again to the same place the file originally was.

Similarly, if you delete and then create a bunch of small files, you're 
generally going to see the new files created in the same place the old 
files were.

With Reiser4, wandering logs means that rather than write to the 
journal, if you write to the middle of the file, it writes that chunk to 
somewhere else on the disk, and somehow gets it down to one atomic 
operation where it simply changes the file to point to the new location 
on disk.  Which means if you have a filesystem that is physically laid 
out on disk like this (for simplicity, assume it only has a single file):

# is data
* is also data
- is free space

######*****########--------------

When you try to write in the middle (the '*' chars) -- let's say we're 
changing them to '%' chars, this happens:

######*****########%%%%%---------

Once that's done, the file is updated so that the middle of it points to 
the fragment in the new location, and the old location is freed:

######-----########%%%%%---------



Keep in mind, because of lazy writes, it's much more likely for the 
whole change to happen at once.  Here's another example:

#####------------

Let's say we just want to overwrite the file with another one of the 
same length:

#####%%%%%-------

then, commit the transaction:

-----%%%%%-------

You see the problem?  You've now split the free space in half. 
Realistically, of course, it wouldn't be by halves, but you're basically 
inserting random air holes all over the place, and your FS is becoming 
more like foam, taking up more of the free space, until you can no 
longer use the free space....  In the above example, if we then have to 
come write some huge file, it looks like this:

*****%%%%%*******

Split right in half.  Now imagine this effect multiplied by hundreds or 
thousands of files, over time...

This is why Reiser4 needs a repacker.  While it's fine for larger files 
-- I believe after a certain point, it will write twice, so looking at 
our first example:


######*****########--------------

Write to a new, temporary place:

######*****########%%%%%---------

Write back to the original place:

######%%%%%########%%%%%---------

Complete the transaction and free the temporary space:

######%%%%%########--------------


This technique is what other journaling filesystems use, and it also 
means that writing is literally twice as slow as on a non-journaling 
filesystem, or on one with wandering logs like Reiser4.  But, it's a 
practical necessity when you're dealing with some 300 gig MySQL database 
of which only small 10k chunks are changing.  Taking twice as long on a 
10k chunk won't kill anyone, but fragmenting your 300 gig database (on a 
320 gig partition) will kill your performance, and will be very 
difficult to defragment.

But on smaller files, it would be very beneficial if we could allow the 
FS to slowly fragment (to foam-ify, if you will) and defrag once a week. 
  The amount of speed gained in each write -- and read, if it's not 
getting too awful during that week -- definitely makes up for having to 
spend an hour or so defragmenting, especially if the FS can be online at 
the time.

And you can probably figure out an optimal time to wait before 
defragmenting, since your biggest fragmentation problems happen when the 
chunk of contiguous space at the end of the disk disappears, and all of 
your free space is scattered (fragmented) throughout the disk.

Anyway, that's why.  If you disable the wandering log behavior, your 
write performance drops in half.  If you don't have a repacker, your FS 
becomes very fragmented, very fast.

I apologize for my poor ASCII art, especially if I'm dead wrong...


> No Linux file system that I'm aware of has a defragmentor, but they DO
> become fragmented, just not near as bad as FAT32 used to when MS created
> their defragmentor. The highest "non-contiguous" percent I've seen with
> EXT3 is about 12%, FAT32 I have seen over 50%, and NTFS over 30%. In

I'd like to see some numbers on Reiser4, then.  Maybe a formal 
fragmentation benchmark?
