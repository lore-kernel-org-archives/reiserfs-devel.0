From: Stefan Schweizer <sschweizer@gmail.com>
Subject: Re: Grub segfaults when trying to access reiser4
Date: Wed, 28 Jul 2004 23:45:43 +0200
Message-ID: <e79639220407281445f3cd00a@mail.gmail.com>
References: <e7963922040726145045bdb0cd@mail.gmail.com> <200407290039.46500.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19846-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407290039.46500.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Thank you for this patch now I get a little bit nearer, I can see the
content of directories but I cannot access more than one filesystem
level (like list /usr/src) or access files. It always segfaults if I
try to press tab.

grub> kernel (hd0,9
grub> kernel (hd0,0)/bin/
 Possible files are: [ arch awk basename bash bunzip2

grub> kernel (hd0,0)/bin/bas
 Possible files are: basename bash

grub> kernel (hd0,0)/bin/bas
 Possible files are: basename bash

grub> kernel (hd0,0)/bin/bashSegfault

On Thu, 29 Jul 2004 00:39:46 +0400, Vitaly Fertman <vitaly@namesys.com> wrote:
> 
> 
> On Tuesday 27 July 2004 01:50, Stefan Schweizer wrote:
> > Hi,
> >
> > I managed to patch grub with your reiser4 patches, but it does not
> > work. I can see the partition but I cannot access any files on it. If
> > I try it segfaults. What am I doing wrong or is this a known issue?
> >
> > grub> kernel (hd0,
> >  Possible partitions are:
> >    Partition num: 0,  Filesystem type is reiser4, partition type 0x83
> >    Partition num: 1,  Filesystem type unknown, partition type 0x82
> >    Partition num: 2,  Filesystem type unknown, partition type 0x83
> >    Partition num: 3,  Filesystem type is ext2fs, partition type 0x83
> >
> > grub> kernel (hd0,0)/Segmentation Fault
> > /home #
> >
> > (I only pressed [tab] and had to add the / manually before)
> >
> > Grub versions tested: 0.94, 0.95
> > Kernel Version: 2.6.8-rc2
> > Reiser4progs Version: 0.5.6
> > libaal Version: 0.5.3
> 
> would you try this patch please.
> 
> --
> Thanks,
> Vitaly Fertman
> 
> 
>
