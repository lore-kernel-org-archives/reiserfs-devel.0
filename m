From: Steven Poulakos <poulakos@uiuc.edu>
Subject: Re: Fatal File System Corruption -Software RAID + NFS
Date: Mon, 17 Nov 2003 11:00:06 -0600
Message-ID: <3FB8FE96.2080203@uiuc.edu>
References: <3FB7AE00.4070409@uiuc.edu> <3FB7CFEB.9080705@g-house.de> <3FB8DF75.4020802@insightbb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB8DF75.4020802@insightbb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Oglesby <d.oglesby@insightbb.com>, Reiserfs Mailinglist <reiserfs-list@namesys.com>

Dan Oglesby wrote:

> Christian Kujau wrote:
>
>> Steven Poulakos wrote:
>> [...]
>>
>>> Here are snippets of the errors that just repeat over and over...
>>>
>>> Nov  9 06:47:34 ctdev kernel: hdc: status error: status=0x58 { 
>>> DriveReady SeekComplete DataRequest }
>>> Nov  9 06:47:34 ctdev kernel:
>>> Nov  9 06:47:34 ctdev kernel: hdc: status error: status=0x58 { 
>>> DriveReady SeekCo
>>
>>
>>
>> hardware errors, i'd say :-(
>> try to dd / dd_rescue to a working disk, then go on with newest 
>> reiserfsprogs or /bin/cat...
>>
>> Christian.
>> -
>
>
> I saw these types of errors on my software RAID-5 array when I first 
> brought it online.  The array is made up of four 20GB hard drives from 
> four different manufacturers, two drives to an IDE channel.  Some of 
> the drives didn't want to play nice when sharing the IDE channel.
>
> Using hdparm, I found that not all drives were enabling DMA or 32-bit 
> transfers, so I forced all of the hard drives to run 32-bit with DMA. 
> This solved the problem.
>
> Another interesting thing I found (while I'm talking about my goofy 
> array) was that the system performed MUCH better when I disabled write 
> caching on all of the hard drives.
>
> The filesystem is ReiserFS 3.6, of course.
>
> --Dan

Christian above suggested that I'm experiencing hardware problems.  I'm 
now wondering if the problem is with my PCI bus speed, which is running 
at 33MHz.   Since I'm using a Promise Ultra100Tx2 controller card, it 
might not be able to operate fast enough to support UDMA 5.  Is this 
correct? 

Here are some additional specs:
Asus P2B Motherboard (33MHz PCI bus)
Pentium 350
384 MB PC100 memory
I also have one AGP video card in use and two NICs on the PCI bus

Is a 33MHz bus sufficient for running the hard drives in UDMA 5 mode?  
Would you recommend that I upgrade to a 66MHz PCI bus motherboard?  The 
other system specs (from the previous email) are below.

Steve

More system specs:
Debian (latest unstable)
2.4.22 Kernel  (not patched in any way)
running NFS (from the kernel), which serves home directories to 3 
workstations
Software RAID 1
-2, mirrored 80gig (7200RPM) IBM hard drives
-Each drive is connected to its own channel on a Promise Ultra ATA/100 
Controller (Ultra100 Tx2) card (PCI)  (using ATA 100 cables)
-the two drives are called hda and hdc (contain 3 mirrored RAID partitions)

