From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiserfs3 rebuild-tree successful but no files
Date: Thu, 10 Feb 2005 11:50:04 +0300
Message-ID: <1108025403.395.345.camel@tribesman.namesys.com>
References: <200502082321.07706.kris@cp-data.de>
	 <200502091004.33754.kris@cp-data.de>
	 <1107950476.9024.205.camel@tribesman.namesys.com>
	 <200502100754.56823.kris@cp-data.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502100754.56823.kris@cp-data.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Placzek <kris@cp-data.de>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-02-10 at 09:54, Christian Placzek wrote:
> On Wednesday 09 February 2005 13:01, Vladimir Saveliev wrote:
> > Hello
> >
> > On Wed, 2005-02-09 at 12:04, Christian Placzek wrote:
> > > On Wednesday 09 February 2005 09:47, you wrote:
> > > > Hello
> > > >
> > > > On Wed, 2005-02-09 at 01:21, Christian Placzek wrote:
> > > > > Hello,
> > > > >
> > > > > a friend of mine shredded his data (70GB) when he tried to undelete
> > > > > an accidentally deleted file. He normally works with windoze.
> > > > > Therefore he didn't know he couldn't undelete a file on a reiserfs
> > > > > partition with ext2 undelete tool %-(
> > > > > When he called me it was already too late. He had overwritten the
> > > > > superblock :-(
> > > > >
> > > > > I'm still trying to rescue the data. I can see them in the image
> > > > > using grep or hexedit. But nothing I tried has been successful. My
> > > > > first steps were unmounting the partition, taking an image and
> > > > > working with a copy of this image using a loop back device.
> > > > >
> > > > > All files have been retrieved but were removed by reiserfsck --check
> > > > > although the last output says that directories and files have been
> > > > > linked (see below). I tried with many combinations nearly all
> > > > > parameters of reiserfsck: --fix-fixable --no-journal-available -S ...
> > > >
> > > > have you tried
> > > > reiserfsck --rebuild-tree -S
> > > > ?
> > > > If not, run it on newly created copy of shredded device.
> > >
> > > Yes, I did. The output of reiserfsck --rebuild-tree gave other numbers of
> > > linked directories/files. But I can't see them.
> > >
> > > > Did you look at lost+found?
> > >
> > > Shure, see below.
> >
> > can you do
> > debugreiserfs -p -S /dev/shredded | bzip2 -c > meta.bz2
> Okay, I've done two versions, one with and one without '-S'. I applied the 
> following commands to the image copy (the image itself is untouched, I always 
> worked with fresh copies):
> 
> # reiserfsck -y /dev/loop/0 --rebuild-sb
> # reiserfsck -y /dev/loop/0 --check
> # reiserfsck -y /dev/loop/0 --rebuild-tree
> # debugreiserfs -p /dev/loop/0 | bzip2 -c > meta.bz2
> # reiserfsck -y /dev/loop/0 --rebuild-tree -S
> # debugreiserfs -p /dev/loop/0 | bzip2 -c > meta-S.bz2
> 
> Use ftp://80.133.138.104:12121 user: marc pw: tukli
> 
ok.

> Lena gave me another hint:
> >> Sorry, but what does df  -T say?
> >> Does it say that  reiserfs filesystem is mounted on /mnt/temp1?
> >>
> >> Thanks,
> >> Lena.
> > No, it replied:
> > # /dev/loop/0   ext2    69529276        20  65997368   1% /mnt/temp1
> >
> > If I force mount with -t reiserfs it says:
> > root@marvin:/home/kris 0$ # mount -o ro -t reiserfs /dev/loop/0 /mnt/temp1/
> > mount: wrong fs type, bad option, bad superblock on /dev/loop/0,
> >       or too many mounted file systems
> >

Yes, so, were you able to mount the filesystem eventually?


