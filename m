From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Subject: RE: Problem with reiserfs volume
Date: Tue, 5 May 2009 03:43:47 -0500
Message-ID: <20090505084353762.EEUS22077@cdptpa-omta02.mail.rr.com>
References: <49FE2EB6.9060002@fatooh.org>
Reply-To: <lrhorer@satx.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49FE2EB6.9060002@fatooh.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

> >> If the array wasn't
> >> doing anything but the individual drives were, that would indicate a
> >> lower-level problem than the filesystem;
> >
> > It could, yes.  In fact, it is not unlikely to be and interaction
> failure
> > between the file system and the RAID device management system (/dev/md0,
> or
> > whatever).
> >
> >> unless I'm missing something,
> >> the filesystem can't do anything to the individual drives without it
> >> showing up as read/write from/to the array device.
> >
> > I don't know if that's true or not.  Certainly if the FS is RAID aware,
> it
> > can query the RAID system for details about the array and its member
> > elements (XFS, for example does just this in order to automatically set
> up
> > stripe width dur8ing format).
> 
> For XFS, this appears to be done by mkfs.xfs via a GET_ARRAY_INFO ioctl
> on the md block device. See the xfsprogs source, libdisk/md.c,
> md_get_subvol_stripe().
> 
> > There's nothing to prevent the FS from
> > issuing command directly to the drive management system (/dev/sda,
> /dev/sdb,
> > etc.).
> 
> That seems to me like it would be opening a can of worms.

It surely would.  'Doesn't necessarily mean someone didn't.  I have an idea,
though...

> >> Did you ever test with dstat and debugreiserfs like I mentioned earlier
> >> in this thread?
> >
> > Yes to the first and no to the second.  I must have missed the reference
> in
> > all the correspondence.  'Sorry about that.
> 
> That's ok.
> 
> >>>> It would always be the same 5 drives which dropped to zero
> >>>> and the same 5 which still reported some reads going on.
> >> I did the math and (if a couple reasonable assumptions I made are
> >> correct), then the reiserfs bitmaps would indeed be distributed among
> >> five of 10 drives in a RAID-6.
> >>
> >> If you're interested, ask, and I'll write it up.
> >
> > It's academic, but I'm curious.  Why would the default parameters have
> > failed?
> 
> It's not exactly a "failure"--it's just that the bitmaps are placed
> every 128 MB, and that results in a certain distribution among your disks.

This triggered a thought.  When I built the array, it was physically in a
termporary configuration, so that while /dev/sda was drive 0 in the array
and /dev/sdj was drive 9 in the array when it was built, the drives were
moved in a piecemeal fashion to the new chassis, so that the order was
something like /dev/sdf, /dev/sdg, /dev/sdh, /dev/sdi, /dev/sdj, /dev/sda,
/dev/sde, /dev/sdd, /dev/sdc, /dev/sb, or something like that.  This
shouldn't create a problem, as md handles RAID assembly based upon the drive
superblock, not the udev assignment.  Is it possible the re-arrangement
caused a failure of the bitmap somehow?

It still doesn't quite explain to me how a high read rate strictly at the
drive level (e.g. ckarray) causes severe problems at the FS level, while an
idle system did not exhibit nearly the frequency of problems nor did the
hang last even a fraction as long (40 seconds vs. 20 minutes).
 
> That means each subsequent bitmap will be 6 stripes later within the
> stripe layout pattern: 0,6,2,8,4,...
> 
> The first chunk is chunk "a", so, for each of those stripes, find which
> disk chunk "a" is on in the layout table above. That yields disks
> A,E,I,C,G: five disks out of the ten, just like you reported.

Yeah, that's about right.

> 
> 
> (Hopefully I didn't screw up too much of that.)
> 
> >>>> During a RAID resync, almost every file create causes a halt.
> >> Perhaps because the resync I/O caused the bitmap data to fall off the
> >> page cache.
> >
> > How would that happen?  More to the point, how would it happen without
> > triggering activity in the FS?
> 
> That was sort of a speculative statement, and I can't really back it up
> because I don't know the details of how the page cache fits in, but IF
> the data read and written during a resync gets cached, then the page
> cache might prefer to retain that data rather than the bitmap data.
> 
> If the bitmap data never stays in the page cache for long, then a file
> write would pretty much always require some bitmaps to be re-read.

Except this happened without any file writes or reads other than the file
creation itself and with no disk activity other than the array re-sync.


