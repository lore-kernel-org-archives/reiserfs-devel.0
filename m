From: Mark Knudson <mrk@rochester.rr.com>
Subject: Re: Emergency: Is there a way to fix a partition table
Date: Tue, 28 Sep 2004 17:22:32 -0400
Message-ID: <4159D618.30206@rochester.rr.com>
References: <231dafb504092622352b9c17d2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <231dafb504092622352b9c17d2@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Dark Shadow wrote:
> I don't have a backup of the partition table and was wondering if
> there was a way to auto scan and have it come up with one. It had 2
> partitions both reiserfs v3 and fully functioning Linux installs
> 
> I have made a dd image of the entire drive to work with
> 
> This is very important that I get it fixed since even though I have a
> day old backup I got a couple files I really don't want to lose (9gb
> of tv capturecard captures)and I need the system fully functioning in
> a day
> 
> 
> current output of table from fdisk
> 
> Command (m for help): p
> 
> Disk /dev/hda: 40.0 GB, 40020664320 bytes
> 240 heads, 63 sectors/track, 5169 cylinders
> Units = cylinders of 15120 * 512 = 7741440 bytes
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/hda1   ?       21975      164058  1074152739    0  Empty
> Partition 1 does not end on cylinder boundary.
> /dev/hda2   ?      168574        9274   943175203   be  Solaris boot
> Partition 2 does not end on cylinder boundary.
> /dev/hda3   ?      201952       44474   956950144    0  Empty
> Partition 3 does not end on cylinder boundary.
> /dev/hda4   ?           1           1           0   4f  QNX4.x 3rd part
> Partition 4 does not end on cylinder boundary.
> 
> Partition table entries are not in disk order
> 

About a year ago I trashed my partition table.
I used a program called testdisk that searched the disk and 
reconstructed a new one for me. Check out the following link.

http://www.cgsecurity.org/index.html?testdisk.html





