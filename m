From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Bad block 0 error
Date: Mon, 21 Jun 2004 15:50:40 +0400
Message-ID: <40D6CB90.7070100@namesys.com>
References: <59446.170.148.10.46.1087810034.squirrel@170.148.10.46>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19283-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <59446.170.148.10.46.1087810034.squirrel@170.148.10.46>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: alistair@inrevo.com
Cc: reiserfs-list@namesys.com

Hello

Alistair McDonald wrote:
> I had a hard drive failure. I have replaced the hard drive with a new
> software RAID1 setup ( previously, the drive was used as a normal block
> device, /dev/hdh1).
> 
> I am getting an error running reiserfsck:
> 
> =============================reiserfsck output begins
> altair root # reiserfsck /dev/md0
> reiserfsck 3.6.17 (2003 www.namesys.com)
> 
> *************************************************************
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
> 
> Will read-only check consistency of the filesystem on /dev/md0
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
> ###########
> reiserfsck --check started at Mon Jun 21 10:03:30 2004
> ###########
> Replaying journal..
> Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
> Checking internal tree..
> 
> Bad root block 0. (--rebuild-tree did not complete)
> 
> Aborted
> 
> =============================reiserfsck output ends
> 
> 
> A little googling suggsted using the debugreiserfs command, but the output
> seems normal to me:
> 
No, it is not. You see: tree height is supposed to be not more than 5. 
You have 65535. Root block is block 0 which should never happen. So, you 
have to run reiserfsck --rebuild-tree

> =============================debugreiser output begins
> altair root # debugreiserfs /dev/md0
> debugreiserfs 3.6.17 (2003 www.namesys.com)
> 
> 
> Filesystem state: consistent
> 
> Reiserfs super block in block 16 on 0x900 of format 3.6 with standard journal
> Count of blocks on the device: 61277904
> Number of bitmaps: 1871
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
> blocks):
> 61277904
> Root block: 0
> Filesystem marked as cleanly umounted
> Tree height: 65535
> Hash function used to sort names: "r5"
> Objectid map size 2, max 972
> Journal parameters:
>         Device [0x0]
>         Magic [0x0]
>         Size 8193 blocks (including 1 for journal header) (first block 18)
>         Max transaction length 1024 blocks
>         Max batch size 900 blocks
>         Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x0:
> sb_version: 2
> inode generation number: 0
> UUID: f486260e-f7ca-4bff-a783-63b4bda0b315
> LABEL:
> Set flags in SB:
> 
> =============================debugreiser output ends
> 
> 
> Here is the history of the data:
> 
> the old partition was on an IDE hard drive. It reported errors after boot
> (lost the output, I'm afraid) and reiserfsck could not recover the data.
> Not suprising if the hard drive was bad.
> 
> I installed linux software RAID-1, using /dev/hde1 and /dev/hdg1 making
> /dev/md0, a RAID-1 set. I used dd_rescue to copy all the data from
> /dev/hdh to /dev/md0 - only(!) around 150 errors were reported in copying
> the whole ~250Gb data. The orignal drive and the new RAID volume are the
> same size, using the same drive type, in fact, so I thought that a
> straight dd_rescue would be OK.
> 
> I then used reiserfsck on /dev/md0, resulting in the above outputs.
> 
> So, could I ask for help:  (A) was it valid to dd_rescue the old drive (I
> still have the old drive and can re-do any retrieval commands) 

yes. dd_rescue is the right tool.
please keep old drive, until you have have data back
(B) what
> are the chances of recovering my data, and (C) how I can go about it?
> 

please try
reiserfsck --rebuild-tree /dev/md0
amd let us know its result

> system details:
> 2.6.6 kernel from development sources (effectively a vanilla 2.6.6 kernel,
> I believe). The system WAS running 2.4.23 until after the disk failure
> 
> reiserfstools 3.6.17 (was 3.4.14 until I was unable to recover the data
> with reiserfsck).
> 
> Alistair


