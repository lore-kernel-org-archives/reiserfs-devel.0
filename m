From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Tuning reiserfs
Date: Mon, 29 Mar 2004 16:35:50 +0400
Message-ID: <1080563749.16246.42.camel@tribesman.namesys.com>
References: <200403280055.10474.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17559-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403280055.10474.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: reiserfs-list@namesys.com

Hello

On Sun, 2004-03-28 at 03:55, Christian Iversen wrote:
> Hello all. 
> 
> I'm a happy user of reiserfs, which I find stable and fast. 
> 
> However, I'm curious as the wether reiserfs can be tuned to be even faster in 
> my situation. 
> 
> Nearly all files on my volume can be divided into two categories. Files in the 
> 5-10 MB range, and files in the 200-500 MB range. 
> 
> Especially "ls -l" on directories with many 200-500 MB files takes a 
> relatively "long" time (severeal seconds). 
> 

I am afraid there is nothing you can easily do to fix this. For the
fileset like yours reiserfs has to read one block to stat one file.
So, to ls -l 10000 files - 10000 blocks is to be read.

> Since I moved to a raid-5 array with same-model disks, this has been reduced 
> to about 1 second at the most. My interest is therefore acedemic. I really 
> don't need a faster fs :)
> 
> /proc/mdstat:
> 
> Personalities : [linear] [raid0] [raid1] [raid5] [raid6]
> md1 : active raid5 hda1[0] hdh1[7] hdg1[6] hdf1[5] hde1[4] hdd1[3] hdc1[2] 
> hdb1[1]
>       820527232 blocks level 5, 32k chunk, algorithm 2 [8/8] [UUUUUUUU]
> 
> fdisk -l /dev/hda:
> 
> Disk /dev/hda: 120.0 GB, 120034123776 bytes
> 255 heads, 63 sectors/track, 14593 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/hda1               1       14593   117218241   fd  Linux raid autodetect
> 
> Any ideas?

