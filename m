From: Oleg Drokin <green@namesys.com>
Subject: Re: 2GB limit won't go away
Date: Mon, 10 Jun 2002 08:58:22 +0400
Message-ID: <20020610085822.A10921@namesys.com>
References: <1023708533.4654.301.camel@xserver> <20020609183534.GC14168@turbolinux.com> <1023754229.4654.1831.camel@xserver> <20020609231608.B8386@namesys.com> <1023780454.3999.52.camel@xserver>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1023780454.3999.52.camel@xserver>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Worley <chrisw@lnxi.com>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Jun 11, 2002 at 01:27:27AM -0600, Chris Worley wrote:

> I do an initrd, to load lvm modules and register the lvm devices... so I
> changed the linuxrc in the initrd to mount my root fs with the "conv"
> option from within my Linuxrc:
> 	/bin/mount -o conv /dev/worley/newsys /mnt
> 	/bin/umount /dev/worley/newsys

That would work.

> It fed back the message:
> 	reiserfs: converting 3.5.x filesystem to the new format

That confirms that everything went fine.

> But, I'm still not able to create large files:
> 	# dd if=/dev/zero of=./test.bigfile bs=1024 count=5242880
> 	dd: writing `./test.bigfile': File too large
> 	2097153+0 records in
> 	2097152+0 records out
> 	# ls -l ./test.bigfile
> -rw-r--r--    1 root     root     2147483648 Jun 09 01:17 ./test.bigfile

Is this file located on the converted volume (/dev/worley/newsys)?
Would following sequence of commans help?
rm -rf ./test.bigfile ; dd if=/dev/zero of=./test.bigfile bs=1024 count=5242880

Bye,
    Oleg
