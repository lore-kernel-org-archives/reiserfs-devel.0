From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Subject: RE: Problem with reiserfs volume
Date: Mon, 11 May 2009 11:37:23 -0500
Message-ID: <20090511163720091.PLD17201@cdptpa-omta01.mail.rr.com>
References: <4A0278C0.5050709@fatooh.org>
Reply-To: <lrhorer@satx.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4A0278C0.5050709@fatooh.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

> >> I might not have been clear on this before: reading the bitmap data is
> >> slow because it is distributed every 128 MB across the filesystem; this
> >> means that in order to read lots of bitmaps, the disk spends most of
> its
> >> time seeking rather than reading. For me, that's what was causing the
> >> disk to "buzz", and that's why dstat showed read rates of only 400-600
> >> KB/sec.
> >
> > Yeah, but reads and writes worked just fine: up to 450 Mbps.
> 
> I mean, above, that read rates would fall to 400-600 KB/sec when the
> filesystem was busy reading bitmap data.

	Well, first of all, it would drop to more like 4KBps, not 400KBps.

> That at least roughly
> corresponds to what you wrote on 2009-04-28: "The reads at the array
> level would fall to zero on 5 of the 10 drives, while the other 5 would
> report a very low level of read activity, but not zero."
> 
> > Appending to
> > an existing file (or writing several GB to a file once the create was
> done)
> > ran like a racehorse on one or several files without ever a burp.
> Reading
> > could be accomplished flat-out no matter what, but with total disk
> activity
> > well in excess of 500Mbps, everything would suddenly halt if a file was
> > created on an intermittent basis.
> 
> That's just like what was happening to me. The filesystem would drop
> everything else it was doing and read bitmaps for a while.
> 
> >> Having the bitmaps spread out among several disks of a RAID probably
> >> wouldn't help. Reiserfs doesn't try to read the bitmaps in parallel;
> >> that would be bad unless it knew the RAID layout. So, each disk would
> >> just be idle when it wasn't its turn to seek and read another bitmap.
> >
> > With 400+ Mbps of data being read and written, the discs weren't idle
> very
> > much.
> 
> Except that when the filesystem is busy reading bitmaps, it isn't doing
> anything else.... :)

Are you saying it doesn't read the bitmaps during reads and writes?


> >>> Except this happened without any file writes or reads other than the
> >> file
> >>> creation itself and with no disk activity other than the array re-
> sync.
> >> I remember even 0-byte files taking a long time to write. My guess
> would
> >> be that reiserfs doesn't know the file will end up being empty when the
> >> file is created, or perhaps it tries to find some contiguous space
> >> anyway so the file can be appended to without excessive fragmentation.
> >
> > So why didn't it happen when appending data to an existing file?  Once a
> > file was created, large or small, I could write freely to it over and
> over,
> > either appending data or writing over data.
> 
> I don't know how appends or overwrites are handled. The scheme for
> finding free space may differ.

Yes, of course that's true, but I wouldn't think it would be so by design.
It also doesn't explain why the event was more likely during heavy activity.

