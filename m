From: Dan Oglesby <d.oglesby@insightbb.com>
Subject: Re: ReiserFS v3 + millions of files?
Date: Tue, 28 Oct 2003 08:50:59 -0600
Message-ID: <3F9E8253.4020203@insightbb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

> Dan Oglesby writes:
>  > On Monday 27 October 2003 5:42 am, you wrote:
>  > > Dan Oglesby writes:
>  > >  > Greetings...
>  > >  >
>  > >  > Long time ReiserFS user, first time I've had a problem.  Signed up for
>  > >  > the mailing list last week, and was surprised to see so little traffic
>  > >  > (might be a good thing?).
>  > >  >
>  > >  > I'm running Red Hat 7.3 using a Red Hat 2.4.20 kernel.  The system has a
>  > >  > RAID-5 array via 3Ware 7500 controller, and three Western Digital 120GB
>  > >  > "Special Edition" hard drives.  The array is one filesystem, ReiserFS. 
>  > >  > The operating system, swap, and other files are stored on a hard drive
>  > >  > that is on the primary IDE controller off of the motherboard.
>  > >  >
>  > >  > The system is a single board computer, with a P4 3.06 GHz hyperthreaded
>  > >  > processor (kernel is SMP enabled), 512MB of RAM, and contains a mix of
>  > >  > ReiserFS and EXT2 filesystems on the primary drive (ReiserFS only on the
>  > >  > array).  No NFS.
>  > >  >
>  > >  > The array is used to store what will basically amount to more than one
>  > >  > million files with an average size of sixty kilobytes.
>  > >  >
>  > >  > During simulations for file writes, I'm seeing write performance begin
>  > >  > to drop dramatically after 800,000 files have been stored on the
>  > >  > filesystem.
>  > >
>  > > Reiserfs (both v3 and v4) stores directory entries (names within
>  > > directory) sorted by a hash of the file name. If files are created in
>  > > the "random" order, that is, if hashes of names aren't more or less
>  > > monotonic, reiserfs will have to modify the same block many times during
>  > > insertion of large number of files. As blocks with names stop fitting
>  > > into memory this means that the same block has to be fetched many times
>  > > from the disk.
>  > >
>  > > To confirm that this is really what the cause of your problem, please
>  > > answer following questions:
>  > >
>  > > 1. are all your files in the same directory?
>  > 
>  > For now, yes.
>  > 
>  > > 2. how names of files are generated?
>  > 
>  > Filenames are very long, based on site ID, internal codes, date and time.  A 
>  > generic example would be:
> 
> [I would prefer to have this discussion continued on the our mailing
> list (Reiserfs mail-list <Reiserfs-List@Namesys.COM>), so if you don't
> object, please CC reply there.]

Sorry about that.  I must have missed the headers on one of my replies.

> 
>  > 
>  > 		siteID.1234.4321.20031028123456789.ext
> 
> I wasn't precise enough in forming the question. How file names are
> changing through time? That is, how these sequences of digits above
> depend on time? I can guess that "20031028" is a date, but what about
> other parts?
> 

Basically, the siteID doesn't change, and I don't believe the next two 
sections ("1234.4321" in the example above) don't change much either. 
The only part of the filename that changes constantly is the date/time 
section, just before the end.

> Can you modify file name patterns so that name's initial prefix
> increases (in lexicographical order) through time? Like this:
> 
> YYYYMMDDHHmmss.sequential-no.siteID.rest.ext
> 
> this should get rid of, or at least alleviate the problem you have
> described.
> 

I don't see why that would be a problem.  I'll present this option to 
the developers today, and will hopefully be testing very soon.

>  > 
>  > Most files are that size or several characters longer.
>  > 	
>  > > 3. what hash are using on reiserfs (default is r5).
>  > >
>  > 
>  > Default (r5).
>  > 
>  > > Reiserfs has another problem due to its limited capability of handling
>  > > hash collisions in file names. Reiser4 scales much better in this
>  > > respect, and generally, works fine with scores of millions of files in
>  > > one directory.
>  > >
>  > 
>  > Sounds like you guys/gals are going to have another person willing to run the 
>  > current incarnation of Reiser4 on a test machine in the very near future.
> 
> Reiser4 is not yet ready for production. Only use it to manipulate data
> that can be recovered by other mean

I know Reiser4 isn't ready for production, but I wouldn't mind checking 
out the performance differences on a test machine.

Thanks for the info...  I'll see what happens when I apply your theory 
to one of our test machines.

--Dan

