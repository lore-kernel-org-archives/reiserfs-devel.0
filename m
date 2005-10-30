From: Michael James <Michael.James@csiro.au>
Subject: Re: Reiser4 SCSI Bug?
Date: Mon, 31 Oct 2005 09:36:03 +1100
Message-ID: <200510310936.04490.Michael.James@csiro.au>
References: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Steve Olivieri <steve86@wpi.edu>

On Sat, 29 Oct 2005 03:49 am, Steve Olivieri wrote:
> Greetings!
> 
> I have a Maxtor Atlas II 15k, 147GB SCSI hard disk
> and an LSI Logic LSI21320 Ultra320 SCSI Host Bus Adapter
> for PCI-X (though it's running in a PCI slot).
> I have partitioned it and installed a temporary Gentoo 
> system with the reiserfs filesytem.
> My boot partition uses ext2.
> These partitions seem perfectly stable.
> I have booted this temporary system multiple times
> and I have attempted to use it to install a permanent 
> system with the reiser4 filesystem.
> 
> After making the fileystems on each partition and mounting them, I was
> able to download two tarballs (the stage and portage snapshot).  While
> extracting the first, the terminal seems to hang.
> 
> I switched to another terminal to see what was wrong.
> Everything works great until I try to do anything at all
> on a reiser4 partition.  Then, this terminal also hangs.
> Repeat until I'm out of terminals. 

There seems to be a complete incompatibility
 between reiser4 and LSI fusion drivers.

I tried to get a reiser4 data partition on Dell Blade servers
 (PE1655MC) with the same results you had.
(Search the archives for "Suse9.3")
Lots of people reporting, "It works fine."
 and my reiser4 wouldn't accept data.
The suggestion then was, "Try a different disk controller."
But the blades don't even have the possibility,
 so I went back to reiserfs 3.6.

I haven't heard any news to suggest it's worth trying again yet.

michaelj

-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166

No matter how much you pay for software,
 you always get less than you hoped.
Unless you pay nothing, then you get more.
