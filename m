From: Ookhoi <ookhoi@humilis.net>
Subject: Re: recovery of crashed reiserfs disk?
Date: Sat, 18 Jan 2003 08:09:41 +0100
Message-ID: <20030118080941.B5575@humilis>
References: <20030117221535.GA945@Kadath>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12431-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030117221535.GA945@Kadath>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois-Rene Rideau <fare@tunes.org>
Cc: reiserfs-list@namesys.com

Francois-Rene Rideau wrote (ao):
> I have at home a reiserfs partition that seems to be corrupted,
> on a physically damaged disk.

...

> hda: read_intr: error=0x40 { UncorrectableError }, LBAsect=223035648, sector=204472320
> end_request: I/O error, dev 03:04 (hda), sector 204472320
> hda: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }

...

>    Device Boot    Start       End    Blocks   Id  System
> /dev/hdc4         18417    238216 110779200   83  Linux

...

> * reiserfsck /dev/hdc4 screams the following:
> <--------reiserfsck 3.6.4, 2002-------->
> 
> Will read-only check consistency of the filesystem on /dev/hdc4
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
> ###########
> reiserfsck --check started at Fri Jan 17 19:47:07 2003
> ###########
> 
> The problem has occurred looks like a hardware problem.
> Check your hard drive for badblocks.
> 
> bread: Cannot read the block (15630336).
> 
> zsh: 980 abort      reiserfsck /dev/hdc4
> 
> * Indeed, if reiserfs is counting 4096-byte blocks, then 15630336 matches
>  LBA sector 143606016 (the first in the kernel error log), and
> 	dd if=/dev/hdc of=/dev/zero count=1 skip=143606016
>  reports an error, and so do nearby sectors from ...007 to ...023 (whereas
>  for instance the last sector in partition is 221558399 and works perfectly).
>  Ouch.

...
 
> * The disk is not quite full, and block 15630336 (60GB) is possibly beyond
>  the last data written to disk. Indeed, readable blocks around that place
>  seem to be consistently filled with zeros.
> 
> * So is there any chance that I may recover some data from the readable part
>  of the disk?
> 
> * If mirroring the "good" part could help, I've got another 120GB disk to do
>  it (that holds the backup), but all the data shuffling involved in trying is
>  heavy enough (and risky for the data, too) that I don't want to try without
>  hope from you -- also, if there is hope in such a thing, do you know where
>  to find a program that would indeed copy all the good sectors and skip over
>  the bad ones?

Dunno if you got an answer already. My mail is a bit slow atm.

I think you can copy your data to the 120GB disk, reiserfsck it, and
mount it. 

You can dd /dev/hdc4 with 

dd if=/dev/hdc4 of=/largedir/largefile conv=noerror

where /largedir is a directory on another disk.

If that doesn't work, you could try ddrescue:
http://www.garloff.de/kurt/linux/ddrescue/

After you created an image, attach it to a loop device, reiserfsck it,
mount it and hopefully recover your data.

Hope that helps.
