From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs messages on root partition at system boot time
Date: Thu, 19 Dec 2002 19:15:01 +0300
Message-ID: <20021219191501.A6977@namesys.com>
References: <0E18D85A21D2874080456C3B8A12E83E01009F9C@cof110avexu4.global.avaya.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <0E18D85A21D2874080456C3B8A12E83E01009F9C@cof110avexu4.global.avaya.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Sewell, Cassandra D (Cassandra)" <csewell@avaya.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Dec 19, 2002 at 09:04:34AM -0700, Sewell, Cassandra D (Cassandra) wrote:
> I am seeing the following messages on a system I have at boot time.  This system 
> is running the 2.2.17 kernel w/ RFS 3.5.32.  I am awaiting delivery of the harddrive & 

version 3.5.32 is way too old, there are never versions available.

> Dec 31 19:35:32 **** kernel: Using r5 hash to sort names 
> Dec 31 19:35:32 **** kernel: ReiserFS version 3.5.32 
> Dec 31 19:35:32 **** kernel: attempt to access beyond end of device 
> Dec 31 19:35:32 **** kernel: 03:0c: rw=0, want=65, limit=0 
> Dec 31 19:35:32 **** kernel: dev 03:0c blksize=1024 blocknr=64 sector=128 size=1024 count=1 

Hm, this device is of zero size. Very strange.

> Dec 31 19:35:32 **** kernel: attempt to access beyond end of device 
> Dec 31 19:35:32 **** kernel: 03:0d: rw=0, want=65, limit=0 
> Dec 31 19:35:32 **** kernel: dev 03:0d blksize=1024 blocknr=64 sector=128 size=1024 count=1 

One more zero-sized partition.

> Dec 31 19:35:32 **** kernel: attempt to access beyond end of device 
> Dec 31 19:35:32 **** kernel: 03:0e: rw=0, want=65, limit=0 
> Dec 31 19:35:32 **** kernel: dev 03:0e blksize=1024 blocknr=64 sector=128 size=1024 count=1 

And third zero sized partition.

> Dec 31 19:35:32 **** kernel: Using r5 hash to sort names 
> Dec 31 19:35:32 **** kernel: ReiserFS version 3.5.32 
> Dec 31 19:35:32 **** kernel: reiserfs_read_super: can't find a reiserfs filesystem on dev 03:0b. 
> Dec 31 19:35:32 **** kernel: reiserfs_read_super: try to find super block in old location 
> Dec 31 19:35:32 **** kernel: reiserfs_read_super: can't find a reiserfs filesystem on dev 03:0b. 

Hm, hard to tell about this one.
What does reiserfsck (pick latest one!) says about /dev/hda11?

> Dec 31 19:35:32 **** kernel: Checking ReiserFS transaction log (device 03:05) ... 
> Dec 31 19:35:32 **** kernel: Replayed 127 transactions in 3 seconds 
> Dec 31 19:35:32 **** kernel: Using r5 hash to sort names 
> Dec 31 19:35:32 **** kernel: ReiserFS version 3.5.32 

This one mounted ok.

So it seems that several extended partitions are corrupted
(or just missed - you have not posted relevant part of the log).
These are /dev/hda12 /dev/hda13 /dev/hda14.

Bye,
    Oleg
