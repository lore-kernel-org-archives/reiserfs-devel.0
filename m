From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Subject: RE: Problem with reiserfs volume
Date: Tue, 5 May 2009 21:04:49 -0500
Message-ID: <20090506020455984.ECK17490@cdptpa-omta04.mail.rr.com>
References: <4A00CE75.4020109@fatooh.org>
Reply-To: <lrhorer@satx.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4A00CE75.4020109@fatooh.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


> I might not have been clear on this before: reading the bitmap data is
> slow because it is distributed every 128 MB across the filesystem; this
> means that in order to read lots of bitmaps, the disk spends most of its
> time seeking rather than reading. For me, that's what was causing the
> disk to "buzz", and that's why dstat showed read rates of only 400-600
> KB/sec.

Yeah, but reads and writes worked just fine: up to 450 Mbps.  Appending to
an existing file (or writing several GB to a file once the create was done)
ran like a racehorse on one or several files without ever a burp.  Reading
could be accomplished flat-out no matter what, but with total disk activity
well in excess of 500Mbps, everything would suddenly halt if a file was
created on an intermittent basis.  Perhaps one create in five or so would
trigger the issue if high volumes of data were being read and / or written,
except when a resync was under way, in which case almost every file create
would generate a pause.  During normal operation the pause would almost
always last exactly 40 seconds.  During resync, the pause lasted as much as
20 minutes.

> I just ran a quick test on my single-disk reiserfs and calculated the
> average seek rate:
> 
> fs_size = 242341144 KB
> bitmap_spacing = 128 MB = 131072 KB
> num_bitmaps = fs_size / bitmap_spacing = 1849
> bitmaps_read_time = 15.5 sec   (from debugreiserfs -m)
> bitmap_read_rate = num_bitmaps / bitmaps_read_time = 119 bitmaps/sec
> seek_rate = bitmap_read_rate = 119 seeks/sec  (seek to every bitmap)
> 
> That's a lot of seeking!

No question, but under ordinary read and write loads, the system handled the
situation with aplomb.  Create ten 20 byte files over a period of 30
minutes, however, and it would halt perhaps 3 - 5 times.  Under light loads,
perhaps 1 in 10 times, although sometimes even with heavy loads I would
create 30 or 40 files or more with no symptoms.  During a resync, however, a
halt was all but guaranteed with every creation.

 
> Having the bitmaps spread out among several disks of a RAID probably
> wouldn't help. Reiserfs doesn't try to read the bitmaps in parallel;
> that would be bad unless it knew the RAID layout. So, each disk would
> just be idle when it wasn't its turn to seek and read another bitmap.

With 400+ Mbps of data being read and written, the discs weren't idle very
much.

 
> Remember how in the old days (before 2.6.19, I think) large reiserfs
> filesystems took forever to mount?

I have only been using reiserfs for a short time.

> > It still doesn't quite explain to me how a high read rate strictly at
> the
> > drive level (e.g. ckarray) causes severe problems at the FS level, while
> an
> > idle system did not exhibit nearly the frequency of problems nor did the
> > hang last even a fraction as long (40 seconds vs. 20 minutes).
> 
> 20 minutes sounds excessive, even when competing with a resync. I
> couldn't say, and can't test it here.

More to the point, reads and writes didn't have any problem competing with
the resync.  When accessing a file for either read or write, the data
transfer would begin in earnest within 2 or 3 seconds, with other activity
continuing unabated. An ls would return in a fraction of a second.  Once the
halt occurred, however, an ls would not return until the event had resolved.

> > Except this happened without any file writes or reads other than the
> file
> > creation itself and with no disk activity other than the array re-sync.
> 
> I remember even 0-byte files taking a long time to write. My guess would
> be that reiserfs doesn't know the file will end up being empty when the
> file is created, or perhaps it tries to find some contiguous space
> anyway so the file can be appended to without excessive fragmentation.

So why didn't it happen when appending data to an existing file?  Once a
file was created, large or small, I could write freely to it over and over,
either appending data or writing over data.


