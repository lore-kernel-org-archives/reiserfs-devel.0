From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfs3 rebuild-tree successful but no files
Date: Thu, 10 Feb 2005 18:25:06 +0300
Message-ID: <200502101825.06588.vitaly@namesys.com>
References: <200502082321.07706.kris@cp-data.de> <420B6B35.2000607@namesys.com> <200502101603.00268.kris@cp-data.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502101603.00268.kris@cp-data.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Placzek <kris@cp-data.de>
Cc: reiserfs-list@namesys.com

On Thursday 10 February 2005 18:02, Christian Placzek wrote:
> On Thursday 10 February 2005 15:09, you wrote:
> > Hello.
> >
> > Christian Placzek wrote:
> > >On Wednesday 09 February 2005 13:01, Vladimir Saveliev wrote:
> > >>Hello
> > >>
> > >>On Wed, 2005-02-09 at 12:04, Christian Placzek wrote:
> > >>>On Wednesday 09 February 2005 09:47, you wrote:
> > >>>>Hello
> > >>>>
> > >>>>On Wed, 2005-02-09 at 01:21, Christian Placzek wrote:
> > >>>>>Hello,
> > >>>>>
> > >>>>>a friend of mine shredded his data (70GB) when he tried to undelete
> > >>>>>an accidentally deleted file. He normally works with windoze.
> > >>>>>Therefore he didn't know he couldn't undelete a file on a reiserfs
> > >>>>>partition with ext2 undelete tool %-(
> > >>>>>When he called me it was already too late. He had overwritten the
> > >>>>>superblock :-(
> > >>>>>
> > >>>>>I'm still trying to rescue the data. I can see them in the image
> > >>>>>using grep or hexedit. But nothing I tried has been successful. My
> > >>>>>first steps were unmounting the partition, taking an image and
> > >>>>>working with a copy of this image using a loop back device.
> > >>>>>
> > >>>>>All files have been retrieved but were removed by reiserfsck --check
> > >>>>>although the last output says that directories and files have been
> > >>>>>linked (see below). I tried with many combinations nearly all
> > >>>>>parameters of reiserfsck: --fix-fixable --no-journal-available -S
> > >>>>> ...
> > >>>>
> > >>>>have you tried
> > >>>>reiserfsck --rebuild-tree -S
> > >>>>?
> > >>>>If not, run it on newly created copy of shredded device.
> > >>>
> > >>>Yes, I did. The output of reiserfsck --rebuild-tree gave other numbers
> > >>> of linked directories/files. But I can't see them.
> > >>>
> > >>>>Did you look at lost+found?
> > >>>
> > >>>Shure, see below.
> > >>
> > >>can you do
> > >>debugreiserfs -p -S /dev/shredded | bzip2 -c > meta.bz2
> > >
> > >Okay, I've done two versions, one with and one without '-S'. I applied
> > > the following commands to the image copy (the image itself is
> > > untouched, I always worked with fresh copies):
> > >
> > ># reiserfsck -y /dev/loop/0 --rebuild-sb
> > ># reiserfsck -y /dev/loop/0 --check
> > ># reiserfsck -y /dev/loop/0 --rebuild-tree
> >
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Sorry, do I understand correctly that you tried to mount  /dev/loop/0
> > with  -t reiserfs option  after __this__ reiserfsck --rebuild-tree? Not
> > after the following ones?
>
> Let me explain my mode of operation: I make a copy of the original image
> taken of the harddrive. Then I use 'losetup' or 'mount -o loop' in order to
> mount the image as device. Next I perform different operations using
> 'reiserfsck'. Above you see _one_ possiblity. Then I mount the image as
> filesystem using 'mount -o ro /dev/loop/0 /mnt/temp1/', and, as I described
> below, I get no directories or files. Mounting with '-t reiserfs' always
> result in following output:
>
> mount: wrong fs type, bad option, bad superblock on /dev/loop/0,
>        or too many mounted file systems

after rebuilding the tree, does 'reiserfsck --check <device>' see these files?
do you have a reiserfs support in the kernel?

what if you zero the first 64K with 
	dd conv=notrunc if=/dev/zero of=<device> bs=4096 count=16 
can you mount it now? (rebuild-tree should already complete by the mount time).

do you have anything related in the syslog about the mount time?

-- 
Thanks,
Vitaly Fertman

