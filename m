From: Dan Oglesby <d.oglesby@insightbb.com>
Subject: Re: Fatal File System Corruption -Software RAID + NFS
Date: Mon, 17 Nov 2003 08:47:17 -0600
Message-ID: <3FB8DF75.4020802@insightbb.com>
References: <3FB7AE00.4070409@uiuc.edu> <3FB7CFEB.9080705@g-house.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB7CFEB.9080705@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Christian Kujau wrote:
> Steven Poulakos wrote:
> [...]
> 
>> Here are snippets of the errors that just repeat over and over...
>>
>> Nov  9 06:47:34 ctdev kernel: hdc: status error: status=0x58 { 
>> DriveReady SeekComplete DataRequest }
>> Nov  9 06:47:34 ctdev kernel:
>> Nov  9 06:47:34 ctdev kernel: hdc: status error: status=0x58 { 
>> DriveReady SeekCo
> 
> 
> hardware errors, i'd say :-(
> try to dd / dd_rescue to a working disk, then go on with newest 
> reiserfsprogs or /bin/cat...
> 
> Christian.
> -

I saw these types of errors on my software RAID-5 array when I first 
brought it online.  The array is made up of four 20GB hard drives from 
four different manufacturers, two drives to an IDE channel.  Some of the 
drives didn't want to play nice when sharing the IDE channel.

Using hdparm, I found that not all drives were enabling DMA or 32-bit 
transfers, so I forced all of the hard drives to run 32-bit with DMA. 
This solved the problem.

Another interesting thing I found (while I'm talking about my goofy 
array) was that the system performed MUCH better when I disabled write 
caching on all of the hard drives.

The filesystem is ReiserFS 3.6, of course.

--Dan

