From: Oleg Drokin <green@namesys.com>
Subject: Re: Procedure to recover a bad superblock
Date: Mon, 18 Aug 2003 10:19:41 +0400
Message-ID: <20030818061941.GC16183@namesys.com>
References: <1061131936.3001.8.camel@headoffice.hazelden.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15355-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1061131936.3001.8.camel@headoffice.hazelden.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John P. New" <jnew@hazelden.ca>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Sun, Aug 17, 2003 at 10:52:16AM -0400, John P. New wrote:

> Aug 16 21:09:23 headoffice kernel: Using r5 hash to sort names
> Aug 16 21:09:23 headoffice kernel: ReiserFS version 3.6.25
> Aug 16 21:09:23 headoffice kernel: reiserfs: checking transaction log
> (device 09:01) ...
> Aug 16 21:09:23 headoffice kernel: reiserfs: replayed 4 transactions in
> 1 seconds
> Aug 16 21:09:23 headoffice kernel: attempt to access beyond end of
> device
> Aug 16 21:09:23 headoffice kernel: 09:01: rw=0, want=1370749188,
> (=0x51b3f904), limit=59447552

Hm, so you had valid superblock, but the copy in journal was not valid,
do you have some kind of IDE drives with write cache turned on below
your softraid?

> reiserfs_open: the reiserfs superblock cannot be found on /dev/md1.
> Failed to open the filesystem.
> If the partition table has not been changed, and the partition is
> valid  and  it really  contains  a reiserfs  partition,  then the
> superblock  is corrupted and you need to run  --rebuild-sb.
> Aborted (core dumped)
> So, I guess I have a bad superblock on md0. I assume my next step would
> be:
> reiserfsck --rebuild-sb /dev/md1

Yes.
It will ask you few questions and then will create new superblock.

> Is there anything I should do to protect my data before I run this

Well, you may create copy of entire device with dd, if you want.

> command, and is there a possibiltity of file corruption at this point,
> or is this a fairly safe step?

If only superblock is corrupted, that should be pretty safe.

Bye,
    Oleg
