From: Oleg Drokin <green@namesys.com>
Subject: Re: mkreiserfs -s 1024 makes unmountable partitions
Date: Mon, 27 Jan 2003 09:59:57 +0300
Message-ID: <20030127095957.A22720@namesys.com>
References: <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu> <20030126181816.GA1274@Kadath>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12495-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030126181816.GA1274@Kadath>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois-Rene Rideau <fare@tunes.org>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Jan 26, 2003 at 07:18:16PM +0100, Francois-Rene Rideau wrote:

> Hi! No hard disk crash today (I'm just disabling the DMA )-" )
> However, I've tried to make small reiserfs partitions,
> and was annoyed at the journal taking a significant size of the disk:
> 32MB is 50% of my 64MB /boot partition, and 40% of the whole
> of my server's 80MB harddisk.
> I saw that mkreiserfs had an option -s to select the size of the journal,
> and tried to use it to make a 4MB journal:
> 	mkreiserfs -s 1024 /dev/hdc1
> However, whereas mkreiserfs didn't complain, the resulting partition
> was unmountable by linux. In the syslogs, the kernel complains:
> read_super_block: can't find a reiserfs filesystem on (dev 16:01, block 128, size 512)
> read_super_block: can't find a reiserfs filesystem on (dev 16:01, block 16, size 512)

You need journal relocation patches from Chris Mason.
ftp://ftp.suse.com/pub/people/mason/patches/datalogging

> I there a way to make a reiserfs partition with a small journal?

Sure. You just did it. ;)
Not you need in-kernel support to be able to mount it.
Ir You can use 2.5 kernels (note these are not recommended for productional environment
of course)

> Would a small kernel patch do it?

Sure.

> In any case, I think that it is a bug that mkreiserfs doesn't check
> the consistency of its parameters with what the kernel is able to handle.

No, that's not a bug. mkreiserfs cannot know if you are just making a filesystem
and planning to reboot into proper kernel later (or even move the disk to other system).
Also it cannot detect if your current kernel have any patches applied or not.

Bye,
    Oleg
