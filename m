From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 metas/bmap problem
Date: Thu, 29 Jul 2004 12:07:05 +0400
Message-ID: <4108B029.4030008@namesys.com>
References: <Pine.GSO.4.44L.0407281754290.11129-100000@unix2.cc.ksu.edu> <20040729012549.GE1439@schnapps.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040729012549.GE1439@schnapps.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Matt Stegman <matts@ksu.edu>, reiserfs-list@namesys.com

Andreas Dilger wrote:
> On Jul 28, 2004  18:26 -0500, Matt Stegman wrote:
> 
>>I'm finally taking the time to start testing reiser4, and I'm running into
>>something odd.  Some of the time, reiser4 doesn't report a file's blocks
>>until I run 'sync'.  This shows up in metas/bmap as many blocks are
>>reported as 0.
>>
>># dd if=/dev/zero of=/mnt/reiser4/file bs=1M count=50
>>50+0 records in
>>50+0 records out
>># chmod +x /mnt/reiser4/file
>># grep '^0$' /mnt/reiser4/file/metas/bmap | wc -l
>>1792
>># sleep 100
>># grep '^0$' /mnt/reiser4/file/metas/bmap | wc -l
>>1792
>># sync
>># grep '^0$' /mnt/reiser4/file/metas/bmap | wc -l
>>0
>>
>>I tried waiting to see if it gets written out in the background
>>asynchronously.  As you can see, it still shows up after a couple minutes,
>>so it doesn't appear to get written until an actual 'sync' command is run.
>>But it shows up inconsistently - many files don't show this.
> 
> 
> I believe one of the speedups of reiser4 is that it doesn't actually write
> data to disk for minutes at a time, vs. 5s or so for most other filesystems.
> 

The reason is actially that reiser4 does block allocation of flush. As for frequency of flushing - it is tunable via mount option.

> The ext3_bmap() function flushes all file data to disk when called, and it
> would be prudent to do the same with reiser4, since bmap users tend to be
> important and not speed critical (e.g. lilo) and failing to do so can mean
> not booting later.
> 

reiser4 should do the same, i agree. However, reiser4 has another feature we call relocation (flush may allocate another disk blocks for a file if it finds it 
more optimal) which is undesirable for bmapped files.
We will probably have to invent some woraround for that.

> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://members.shaw.ca/adilger/             http://members.shaw.ca/golinux/
> 


