From: "John P. New" <jnew@hazelden.ca>
Subject: Re: Procedure to recover a bad superblock
Date: 18 Aug 2003 07:43:48 -0400
Message-ID: <1061207028.3736.17.camel@headoffice.hazelden.ca>
References: <1061131936.3001.8.camel@headoffice.hazelden.ca>
	 <20030818061941.GC16183@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15359-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030818061941.GC16183@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Oleg,

Thanks for the response.

As for what ide devices I have below the softraid, I'm not sure what you
mean. I have a CD/RW on hda and a Colorado Travan tape drive on hdb, and
other, non-RAID partitions on hde and hdg, if that's what you mean.

I ran reiserfsck --rebuild-sb /dev/md1, and it asked me what block size
to use. I looked at /var/log/messages, and the first boot after the
power outage log reads:

Aug 16 21:09:27 headoffice kernel: read_super_block: can't find a
reiserfs filesystem on (dev 09:01, block 16, size 4096)
Aug 16 21:09:27 headoffice kernel: read_super_block: can't find a
reiserfs filesystem on (dev 09:01, block 2, size 4096)

In more recent boots (and when I try a manual mount), it reads:

Aug 17 10:28:31 headoffice kernel: read_super_block: can't find a
reiserfs filesystem on (dev 09:01, block 64, size 1024)
Aug 17 10:28:31 headoffice kernel: read_super_block: can't find a
reiserfs filesystem on (dev 09:01, block 8, size 1024)

In other words, different block sizes. for the same device. Should I be
concerned, and what value should I use for reiserfsck?

John


On Mon, 2003-08-18 at 02:19, Oleg Drokin wrote:
> Hello!
> 
> On Sun, Aug 17, 2003 at 10:52:16AM -0400, John P. New wrote:
> 
> > Aug 16 21:09:23 headoffice kernel: Using r5 hash to sort names
> > Aug 16 21:09:23 headoffice kernel: ReiserFS version 3.6.25
> > Aug 16 21:09:23 headoffice kernel: reiserfs: checking transaction log
> > (device 09:01) ...
> > Aug 16 21:09:23 headoffice kernel: reiserfs: replayed 4 transactions in
> > 1 seconds
> > Aug 16 21:09:23 headoffice kernel: attempt to access beyond end of
> > device
> > Aug 16 21:09:23 headoffice kernel: 09:01: rw=0, want=1370749188,
> > (=0x51b3f904), limit=59447552
> 
> Hm, so you had valid superblock, but the copy in journal was not valid,
> do you have some kind of IDE drives with write cache turned on below
> your softraid?
> 
> > reiserfs_open: the reiserfs superblock cannot be found on /dev/md1.
> > Failed to open the filesystem.
> > If the partition table has not been changed, and the partition is
> > valid  and  it really  contains  a reiserfs  partition,  then the
> > superblock  is corrupted and you need to run  --rebuild-sb.
> > Aborted (core dumped)
> > So, I guess I have a bad superblock on md0. I assume my next step would
> > be:
> > reiserfsck --rebuild-sb /dev/md1
> 
> Yes.
> It will ask you few questions and then will create new superblock.
> 
> > Is there anything I should do to protect my data before I run this
> 
> Well, you may create copy of entire device with dd, if you want.
> 
> > command, and is there a possibiltity of file corruption at this point,
> > or is this a fairly safe step?
> 
> If only superblock is corrupted, that should be pretty safe.
> 
> Bye,
>     Oleg

