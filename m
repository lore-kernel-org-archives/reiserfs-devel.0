From: Christian Placzek <kris@cp-data.de>
Subject: Re: reiserfs3 rebuild-tree successful but no files - SOLVED
Date: Fri, 11 Feb 2005 08:38:56 +0100
Message-ID: <200502110838.56864.kris@cp-data.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "E.Gryaznova" <grev@namesys.com>
Cc: reiserfs-list@namesys.com

On Thursday 10 February 2005 16:25, you wrote:
> On Thursday 10 February 2005 18:02, Christian Placzek wrote:
> > On Thursday 10 February 2005 15:09, you wrote:
> > > Hello.
> > >
> > > Christian Placzek wrote:
> > > >On Wednesday 09 February 2005 13:01, Vladimir Saveliev wrote:
> > > >>Hello
> > > >>
> > > >>On Wed, 2005-02-09 at 12:04, Christian Placzek wrote:
> > > >>>On Wednesday 09 February 2005 09:47, you wrote:
> > > >>>>Hello
> > > >>>>
> > > >>>>On Wed, 2005-02-09 at 01:21, Christian Placzek wrote:
> > > >>>>>Hello,
> > > >>>>>
> > > >>>>>a friend of mine shredded his data (70GB) when he tried to
> > > >>>>> undelete an accidentally deleted file. He normally works with
> > > >>>>> windoze. Therefore he didn't know he couldn't undelete a file on
> > > >>>>> a reiserfs partition with ext2 undelete tool %-(
> > > >>>>>When he called me it was already too late. He had overwritten the
> > > >>>>>superblock :-(
> > > >>>>>
> > > >>>>>I'm still trying to rescue the data. I can see them in the image
> > > >>>>>using grep or hexedit. But nothing I tried has been successful. My
> > > >>>>>first steps were unmounting the partition, taking an image and
> > > >>>>>working with a copy of this image using a loop back device.
> > > >>>>>
> > > >>>>>All files have been retrieved but were removed by reiserfsck
> > > >>>>> --check although the last output says that directories and files
> > > >>>>> have been linked (see below). I tried with many combinations
> > > >>>>> nearly all parameters of reiserfsck: --fix-fixable
> > > >>>>> --no-journal-available -S ...
> > > >>>>
> > > >>>>have you tried
> > > >>>>reiserfsck --rebuild-tree -S
> > > >>>>?
> > > >>>>If not, run it on newly created copy of shredded device.
> > > >>>
> > > >>>Yes, I did. The output of reiserfsck --rebuild-tree gave other
> > > >>> numbers of linked directories/files. But I can't see them.
> > > >>>
> > > >>>>Did you look at lost+found?
> > > >>>
> > > >>>Shure, see below.
> > > >>
> > > >>can you do
> > > >>debugreiserfs -p -S /dev/shredded | bzip2 -c > meta.bz2
> > > >
> > > >Okay, I've done two versions, one with and one without '-S'. I applied
> > > > the following commands to the image copy (the image itself is
> > > > untouched, I always worked with fresh copies):
> > > >
> > > ># reiserfsck -y /dev/loop/0 --rebuild-sb
> > > ># reiserfsck -y /dev/loop/0 --check
> > > ># reiserfsck -y /dev/loop/0 --rebuild-tree
> > >
> > > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > Sorry, do I understand correctly that you tried to mount  /dev/loop/0
> > > with  -t reiserfs option  after __this__ reiserfsck --rebuild-tree? Not
> > > after the following ones?
> >
> > Let me explain my mode of operation: I make a copy of the original image
> > taken of the harddrive. Then I use 'losetup' or 'mount -o loop' in order
> > to mount the image as device. Next I perform different operations using
> > 'reiserfsck'. Above you see _one_ possiblity. Then I mount the image as
> > filesystem using 'mount -o ro /dev/loop/0 /mnt/temp1/', and, as I
> > described below, I get no directories or files. Mounting with '-t
> > reiserfs' always result in following output:
> >
> > mount: wrong fs type, bad option, bad superblock on /dev/loop/0,
> >        or too many mounted file systems
>
> after rebuilding the tree, does 'reiserfsck --check <device>' see these
> files?

Yes, see my original email from 08.02.2005 23:21. The original output has a
length of about 13000 lines. A extract looks like this:

...
rebuild_semantic_pass: The entry [741258 1025777] ("www.firstname.de.ico") in
directory [296134 741258] points to nowhere - is removed
rewrite_file: 2 items of file [741258 1041142] moved to [741258 93475]
The entry [741258 1041142] ("deltab.de.ico") in directory [296134 741258]
updated to point to [741258 93475]
rewrite_file: 2 items of file [741258 1041137] moved to [741258 93569]
The entry [741258 1041137] ("www.bild.t-online.de.ico") in directory [296134
741258] updated to point to [741258 93569]
...

The last lines:

...
Flushing..finished
        Objects without names 18403
        Empty lost dirs removed 384
        Dirs linked to /lost+found: 2174
                Dirs without stat data found 83
        Files linked to /lost+found 16229
        Objects having used objectids: 49
                files fixed 47
                dirs fixed 2
Pass 4 - finished   done 1476, 37 /sec
        Deleted unreachable items 716
Flushing..finished
Syncing..finished
###########
reiserfsck finished at Tue Feb  8 17:40:05 2005
...

Most of the files were removed by 'reiserfsck --check <device>'.

> do you have a reiserfs support in the kernel?

Sure, one of my data partition is reiserfs:

...
root@marvin:~ 0$ # debugreiserfs -J /dev/hda7
debugreiserfs 3.6.19 (2003 www.namesys.com)


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x307 of format 3.6 with standard journal
Count of blocks on the device: 4393769
...

> what if you zero the first 64K with
>  dd conv=notrunc if=/dev/zero of=<device> bs=4096 count=16
> can you mount it now? (rebuild-tree should already complete by the mount
> time).

Hurray, this is the trick! I don't understand why, but I can see hundreds of
directories and thousends of files. Thanks a lot!!!

> do you have anything related in the syslog about the mount time?

This is the first time 'dmesg' gives an output:

ReiserFS: sdc5: found reiserfs format "3.6" with standard journal
ReiserFS: sdc5: using ordered data mode
ReiserFS: sdc5: journal params: device sdc5, size 8192, journal first block
18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
ReiserFS: sdc5: checking transaction log (sdc5)
ReiserFS: sdc5: Using r5 hash to sort names



Could you give me a technical describtion why this worked?

Again, thank you very much!

Kris
