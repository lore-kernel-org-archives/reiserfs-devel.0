From: Christian Placzek <kris@cp-data.de>
Subject: Re: reiserfs3 rebuild-tree successful but no files - SOLVED
Date: Fri, 11 Feb 2005 09:07:52 +0100
Message-ID: <200502110907.53717.kris@cp-data.de>
References: <200502110838.56864.kris@cp-data.de> <1108108482.3899.55.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23377-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1108108482.3899.55.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, "E.Gryaznova" <grev@namesys.com>, reiserfs-list@namesys.com

On Friday 11 February 2005 08:54, you wrote:
> Hello
>
> On Fri, 2005-02-11 at 10:38, Christian Placzek wrote:
> > On Thursday 10 February 2005 16:25, you wrote:
> > > On Thursday 10 February 2005 18:02, Christian Placzek wrote:
> > >
> > > what if you zero the first 64K with
> > >  dd conv=notrunc if=/dev/zero of=<device> bs=4096 count=16
> > > can you mount it now? (rebuild-tree should already complete by the
> > > mount time).
> >
> > Hurray, this is the trick! I don't understand why, but I can see hundreds
> > of directories and thousends of files. Thanks a lot!!!
> >
> > > do you have anything related in the syslog about the mount time?
> >
> > This is the first time 'dmesg' gives an output:
> >
> > ReiserFS: sdc5: found reiserfs format "3.6" with standard journal
> > ReiserFS: sdc5: using ordered data mode
> > ReiserFS: sdc5: journal params: device sdc5, size 8192, journal first
> > block 18, max trans len 1024, max batch 900, max commit age 30, max trans
> > age 30 ReiserFS: sdc5: checking transaction log (sdc5)
> > ReiserFS: sdc5: Using r5 hash to sort names
> >
> >
> >
> > Could you give me a technical describtion why this worked?
>
> am I correct that
> mount /dev/sdc5 /mnt mounted it as ext
> mount /dev/sdc5 /mnt -t reiserfs refused to mount with "mount: wrong fs
> type, bad option, bad superblock on /dev/loop/0, or too many mounted
> file systems"
> and after dd conv=notrunc if=/dev/zero of=/dev/sdc5 bs=4096 count=16
> mount /dev/sdc5 /mnt mounts reiserfs?
Yes, you are right.

Thanks
  Kris

