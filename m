From: Oleg Drokin <green@namesys.com>
Subject: Re: Safely spinning down SCSI ReiserFS disk
Date: Mon, 28 Apr 2003 09:31:50 +0400
Message-ID: <20030428053150.GA22902@namesys.com>
References: <20030426211638.GA690@cthulhu.gerg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030426211638.GA690@cthulhu.gerg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Ward <gward@python.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Apr 26, 2003 at 05:16:38PM -0400, Greg Ward wrote:

> >From searching the list archives, I know I'm not the only one who wants
> to do this, but I'm having problems that might be ReiserFS-related.
> Specifically, it looks like ReiserFS is trying to write journal data to
> the disk after it's spun down, even though I run /bin/sync before the
> spindown.

By running /bin/sync you seem to access /bin/sync and force atime update on the
/bin/sync

Why don't you just rely on apm --suspend thing that is supposed to spin-down
everything by itself after OS is sleeping?

>   * create a ramdisk with a few minimal tools -- mainly the
>     scsi-spin binary from scsitools 0.3-2 (Debian package)
>   * write a script in the ramdisk that runs
>       sync
>       scsi-spin --force --down /dev/sda
>       sleep 5
>       scsi-spin --force --up /dev/sda
>   * sync and chroot to the ramdisk and run that script in it
> The disk spins down fine, and then comes back up -- but any process that
> tries to access the disk blocks forever, and there's a "kernel bug" dump
> on my console.  At that point I have to reboot -- good thing I built the
> "Magic SysRq key" feature into my kernel, since I can't even run the
> "reboot" binary!

Well, what's the BUG message? We cannot tell you what it means before you
give us this information.

> Is this sort of behaviour expected?  Is there anything more I should be

I don't even know what part of the kernel emits this BUG for you.

> doing to safely spin down the disk containing ReiserFS filesystems?

To safely spin-down the fisk with reiserfs you need to make sure nobody writes/accesses to
the fs when the disk is spun-down (this is only if you want the disk to stay spun-down).
Also when disk spins-up, it must be functional in order to continue the work.
(I believe these requirements are the same for any FS, anyway)

> Would it be useful if I provided that "kernel bug" dump?  (Maybe I can
> write it to my IDE disk before rebooting... hmmm...)

Yes, that might shed some light on what's going on.

Bye,
    Oleg
