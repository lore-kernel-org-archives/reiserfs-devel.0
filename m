From: Soeren Sonnenburg <kernel@nn7.de>
Subject: Re: trouble with reiserfs on ppc vs-3050:
	wait_buffer_until_released ...
Date: 25 Apr 2003 11:01:02 +0200
Message-ID: <1051261262.3495.24.camel@localhost>
References: <1051258287.5564.1.camel@fortknox>
	 <200304251241.49707.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13809-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304251241.49707.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, 2003-04-25 at 10:41, Vitaly Fertman wrote:
> Hi, 
> 
> On Friday 25 April 2003 12:11, Soeren Sonnenburg wrote:
> > Hi...
> >
> > I suddenly have a file which when I access it using gvim gives
> >
> > vs-3050: wait_buffer_until_released: nobody releases buffer (dev 03:07,
> > size 4096, blocknr 2031616, count 3, list 0, state 0x10019, page
> > c0add66540, (UPTODATE, CLEAN, UNLOCKED)). Still waiting (570000000)
> > JDIRTY !WAIT
> >
> > and makes the whole machine hang...
> >
> >
> > Ideas what I could do about it ?
> 
> Probably it is due to fs corruption, interesting if the block #2031616 is free 
> in the bitmap. Could you run 
>     debugreiserfs -1 2031616 /dev/xxx


[10:59][root@no:~/reiserfsprogs-3.6.6/debugreiserfs]# debugreiserfs -1 2031616 /
dev/hda7
<--------debugreiserfs 3.6.4, 2002-------->

2031616 is free in ondisk bitmap
Looks like unformatted
[10:59][root@no:~/reiserfsprogs-3.6.6/debugreiserfs]# fdisk -l 
/dev/hda
        #                    type name                  length   base      ( size )  system
/dev/hda1     Apple_partition_map Apple                     63 @ 1         ( 31.5k)  Partition map
/dev/hda2         Apple_Bootstrap bootstrap               1600 @ 64        (800.0k)  NewWorld bootblock
/dev/hda3         Apple_UNIX_SVR2 swap                 2097152 @ 1664      (  1.0G)  Linux swap
/dev/hda4         Apple_UNIX_SVR2 spare                2097152 @ 2098816   (  1.0G)  Linux native
/dev/hda5         Apple_UNIX_SVR2 root                27261376 @ 4195968   ( 13.0G)  Linux native
/dev/hda6               Apple_HFS MacOS X             41943040 @ 31457344  ( 20.0G)  HFS
/dev/hda7         Apple_UNIX_SVR2 home                43809856 @ 73400384  ( 20.9G)  Linux native

Block size=512, Number of Blocks=117210240
DeviceType=0x0, DeviceId=0x0


