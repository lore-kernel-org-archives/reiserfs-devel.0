From: "Jake Hawkes" <jake@infinitylimited.net>
Subject: Re: shrink reiserfs
Date: Fri, 28 Jan 2005 08:52:57 -0700 (MST)
Message-ID: <33095.1.0.10.1.1106927577.squirrel@www.infinitylimited.net>
References: <17956.62.135.89.53.1106495294.squirrel@mail.infinitylimited.net>
       <20050123171105.GG10921@backtop.namesys.com>   
    <18298.62.135.89.53.1106502596.squirrel@mail.infinitylimited.net>   
    <20050123190735.GH10921@backtop.namesys.com>   
    <18682.62.135.89.53.1106507496.squirrel@mail.infinitylimited.net>   
    <20050123194918.GI10921@backtop.namesys.com>   
    <20050123212315.GK10921@backtop.namesys.com>
    <18958.62.135.89.53.1106517199.squirrel@mail.infinitylimited.net>
    <41F64DA7.2070502@nauticom.net>
Reply-To: jake@infinitylimited.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-23228-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41F64DA7.2070502@nauticom.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chet Hosey <chosey@nauticom.net>
Cc: reiserfs-list@namesys.com

Chet Hosey said:
> A quick perusal of GNU parted's manual gives me the impression that it
> can move partitions about the disk:
>
> http://www.gnu.org/software/parted/manual/html_chapter/parted_2.html#SEC20
>
> I've not used parted, but rather than dropping $25 on PartitionMagic on
> Amazon (or much more in a retail outlet), you could give it a shot.
>
> If you try it, it might be nice if you let all us (and those searching
> the archives) how it went
>
>

It seems that it doesn't want to try to move a reiser partition.  Oh well.

I took David Masover's suggestion, and did some fancy footwork.

First thing I did was realise what hda1 was used for.  this was the table
before I started messing around:

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1               1           6       48163+   6  FAT16
/dev/hda2   *           7        2074    16611210    7  HPFS/NTFS
/dev/hda3            2437        2439       24097+  83  Linux [boot-ext3]
/dev/hda4            2440        4398    15735667+  83  Linux [ reiser ]

I had a look on hda1 and realised it was a "special" Dell system recovery
partition, with various diagnostic programs on it.  And it had free space
- so it became my boot partition.

So, I deleted hda3, shrank hda4 as far as possible, created a new hda3
*after* hda4, dd'd hda4 -> hda3.

Some advice for those wanting to do this again:

 - reboot after every step, to check that you haven't messed something up,
especially if after writing a new partition, fdisk say "Kernel will
continue to use old partition table".

 - do one thing at a time, dont try to do too many steps at once.  You
will not save time in the long run.

 - always have an alternative boot media handy (I use the gentoo live CD)

 - be very familiar (ie, dont rely on man pages or web pages) with your
tools, especially resize_reiserfs, grub, mount etc

 - dont do what I did and gamble that your laptop battery will have enough
juice to do all the steps, especially if you are in Frankfurt airport
with no power outlets :)

End Result: good so far.  I haven't completely finished yet, still to do
are finalising the grub install, and creating the new FAT partition to
share data between windows and linux.

Thanks for the advice guys!

-Jake
