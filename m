From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: Compile probs with yesterday's auto-snapshot
Date: Wed, 11 Aug 2004 07:03:07 +0200
Message-ID: <20040811070307.517e8cb4.reiser4@blinkenlights.ch>
References: <20040810192756.67EC115C33@mail03.powweb.com>
	<20040810205022.GT1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20169-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040810205022.GT1284@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> I'm still using lilo, bugger me, and some time ago I made a separate
> /boot with ReiserFS so I can't even help with grub testing :P

Just give grub a try with a Reiser4 enabled Boot Floppy

I uploaded stage1 and stage2:
http://blinkenlights.ch/reiser4/builds/20040810/grub20040810/


-> Create the bootfloppy
     # dd if=stage1 of=/dev/fd0 bs=512 count=1
     1+0 records in
     1+0 records out
     # dd if=stage2 of=/dev/fd0 bs=512 seek=1
     153+1 records in
     153+1 records out
     #

-> Reboot from floppy and boot:
grub> root (hd0,0)                   #HDNUM,PARTITION
grub> kernel /boot/bla root=/dev/bla #load the kernel image, you can use
                                     #<TAB>, btw;)
grub>boot                            #Boot :)
