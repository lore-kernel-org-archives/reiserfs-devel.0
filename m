From: Oleg Drokin <green@namesys.com>
Subject: Re: Can resize_reiserfs do non-destructive resizing??
Date: Mon, 18 Nov 2002 11:19:32 +0300
Message-ID: <20021118111932.E3827@namesys.com>
References: <200211172140.49258.bestb@sympatico.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12010-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200211172140.49258.bestb@sympatico.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruce <bestb@sympatico.ca>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Nov 17, 2002 at 09:40:49PM -0500, Bruce wrote:

> I have a desktop machine that was running Debian 3.0, installed on a 40Gig 
> harddrive (single partition hda2 + swap hda1) formatted with reiserfs; the 
> drive had about 10gig data on it. I wanted to test out Mandrake 9.0, and 
> understood that the diskdrake program would handle resizing of the existing 
> reiser partition (using resize_reiserfs, I assume). The diskdrake program 
> suggested I backup as a precaution, but did not indicate that the resizing 
> would be destructive.

resize_reiserfs is a non-destructive resizer.

> I let it resize the existing partition to 20Gig. It seemed to work, and 
> Mandrake installed without any problems. However, since then I have not been 
> able to access the Debian partition - can't boot from it, can't mount it, 
> nothing. Trying to boot from that partition results in:
>  attempt to access beyond end of device
>  03:02 rw=0 want 21364740 limit 21310191
>  reiserfs_read_super: unable to read bitmap
>  kernel panic....

Well, that means that the size of your debian partition is 10655092 megabytes,
but reiserfs filesystem is expecting the partition to be 10682370 megabytes
(as written in superblock).
You might try to use reiserfsck --rebuild-sb followed by subsequent
reiserfsck --rebuild-tree to bring reiserfs superblock data back in sync
with partition table. That will be dangerous if beginning of partition have
changed its location since mkfs time, though.

> Is this a problem with diskdrake's handling of resize_reiserfs?? 
> resize_reiserfs itself??

Hard to tell actually. Looks like filesystem have the size
changed, but partition table was not adjusted accordingly. Note
that resize_reiserfs does not touch partition tables at all.

> It could also be due to physical problems with the hard drive, which had 
> reported bad blocks some time ago. Is this more likely the cause of the 
> problem??

Well, it does not look like hard drive problem.

Bye,
    Oleg
