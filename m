From: Chris Worley <chrisw@lnxi.com>
Subject: Re: 2GB limit won't go away
Date: 10 Jun 2002 08:05:54 -0600
Message-ID: <1023717954.6272.17.camel@localhost.localdomain>
References: <1023708533.4654.301.camel@xserver>
	<20020609183534.GC14168@turbolinux.com>
	<1023754229.4654.1831.camel@xserver> <20020609231608.B8386@namesys.com>
	<1023780454.3999.52.camel@xserver>  <20020610085822.A10921@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10708-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020610085822.A10921@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sun, 2002-06-09 at 22:58, Oleg Drokin wrote: 
> > -rw-r--r--    1 root     root     2147483648 Jun 09 01:17 ./test.bigfile
> 
> Is this file located on the converted volume (/dev/worley/newsys)?
> Would following sequence of commans help?
> rm -rf ./test.bigfile ; dd if=/dev/zero of=./test.bigfile bs=1024 count=5242880

Everything but /boot is on that volume (and /boot is mounted ro):

# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/worley/newsys    78763672  73604064   5159608  94% /
/dev/hda1                19976     18114       831  96% /boot
shmfs                   514732         0    514732   0% /dev/shm

And deleting it first doesn't help.

I'm wondering if there is a kernel/reiser tools mismatch.  How could I verify what's in the kernel?

Thanks,

Chris

On Sun, 2002-06-09 at 22:58, Oleg Drokin wrote: 
> Hello!
> 
> On Tue, Jun 11, 2002 at 01:27:27AM -0600, Chris Worley wrote:
> 
> > I do an initrd, to load lvm modules and register the lvm devices... so I
> > changed the linuxrc in the initrd to mount my root fs with the "conv"
> > option from within my Linuxrc:
> > 	/bin/mount -o conv /dev/worley/newsys /mnt
> > 	/bin/umount /dev/worley/newsys
> 
> That would work.
> 
> > It fed back the message:
> > 	reiserfs: converting 3.5.x filesystem to the new format
> 
> That confirms that everything went fine.
> 
> > But, I'm still not able to create large files:
> > 	# dd if=/dev/zero of=./test.bigfile bs=1024 count=5242880
> > 	dd: writing `./test.bigfile': File too large
> > 	2097153+0 records in
> > 	2097152+0 records out
> > 	# ls -l ./test.bigfile
> > -rw-r--r--    1 root     root     2147483648 Jun 09 01:17 ./test.bigfile
> 
> Is this file located on the converted volume (/dev/worley/newsys)?
> Would following sequence of commans help?
> rm -rf ./test.bigfile ; dd if=/dev/zero of=./test.bigfile bs=1024 count=5242880
> 
> Bye,
>     Oleg
> 

