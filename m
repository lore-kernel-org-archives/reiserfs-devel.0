From: "Joel Heenan" <joel.heenan@gmail.com>
Subject: Re: fsck.reiserfs --rebuild-tree out of disk space aborted
Date: Fri, 4 Aug 2006 09:53:18 +1000
Message-ID: <843700460608031653s23053b67p47e691d4064bac7a@mail.gmail.com>
References: <843700460607201709i44c2d1f4i846a0cb716c80234@mail.gmail.com>
	 <1153492956.6271.37.camel@tribesman.namesys.com>
	 <843700460607211537o70d9b179o1c7448e47ef5d829@mail.gmail.com>
	 <1153825325.6292.59.camel@tribesman.namesys.com>
	 <843700460607250441m44ea8786r75d0cd0858fac0b2@mail.gmail.com>
Reply-To: joelh@planetjoel.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29468-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <843700460607250441m44ea8786r75d0cd0858fac0b2@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Thanks Vladimir, this fixed the problem.

Joel

On 7/25/06, Joel Heenan <joel.heenan@gmail.com> wrote:
> On 7/25/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
> > Hello
> >
> > On Sat, 2006-07-22 at 08:37 +1000, Joel Heenan wrote:
> > > On 7/22/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
> > > > hello
> > > >
> > > > On Fri, 2006-07-21 at 10:09 +1000, Joel Heenan wrote:
> > > > > Hi,
> > > > >
> > > > > I can home about two weeks ago and found my media box locked up. I was
> > > > > able to discover that it had filled up its /dev/md2 partition (mounted
> > > > > on /home) which surprised me because it is 550 gigs. Perhaps mythtv
> > > > > went nuts and used it all up. It was only a temporary thing I was
> > > > > going to move mythtv to another partition anyway and boy I wish I had
> > > > > now :-P.
> > > > >
> > > > > Anyway I rebooted and the fsck said I had to run rebuild-tree. So I
> > > > > ran that and a few days later it said "out of disk space, aborted". I
> > > > > can't mount the partition it says "No folder found I believe". I tried
> > > > > it a few times with both the reiserfsprogs from etch:
> > > > >
> > > > > ii  reiserfsprogs                    3.6.19-2
> > > > > User-level tools for ReiserFS filesystems
> > > > >
> > > > > and the latest ones downloaded from the website (3.6.19). I am
> > > > > currently trying it with the -S option.
> > > > >
> > > > there is no need to use -S in your case.
> > > >
> > > > > I'm running a custom 2.6.12 kernel which is basically the same as the
> > > > > default debian one except it includes some drivers for my dvico fusion
> > > > > tv tuner.
> > > > >
> > > > > I read that the best way to fix this problem is to dd to a bigger
> > > > > partition but there is really no easy way for me to do that - it will
> > > > > probably involve me purchasing 2x300gig partitions, raiding them, then
> > > > > performing the restore.
> > > > >
> > > > > Please let me know if there is a way I can fix this without going to a
> > > > > bigger partition.
> > > > >
> >
> > You can configure linear raid of the /dev/md2 and some additional
> > device, which does not have to be very big. 100 mb should be enough and
> > should not be hard to allocate for spare.
> >
> > Than you can have something like:
> > raiddev /dev/md3
> >         raid-level      linear
> >         nr-raid-disks   2
> >         chunk-size      32
> >         persistent-superblock 0
> >         device          /dev/md2
> >         raid-disk       0
> >         device          /dev/spare
> >         raid-disk       1
> >
> >
> > IMPORTANT NOTE: persistent-superblock has to be set to 0.
> >
> > Than you should run
> > reiserfsck --rebuild-sb /dev/md3
> > and answer n to "Did you use resizer(y/n)[n]:"
> > and answer y to "Is this ok ? (y/n)[n]:"
> >
> > Than run reiserfsck --rebuild-tree. There should be no problem with lack
> > of disk space.
>
> Hey Vladimir,
>
> Thanks... I followed your instructions exactly. I thought about doing
> something similar but wasn't sure about how to go about it.
>
> After I answered y to is this ok? it said "The fs may still be
> unconsistent. Run reiserfsck --check.". I did that and it said it was
> still messed up (as I expected). Its currently doing a rebuild-tree.
>
> Greatly appreciate your help. Lets see how it goes :-)
>
> Joel
> >
> > > > > Here is output of the fsck:
> > > > >
> > > > > """
> > > > > fsck.reiserfs --rebuild-tree /dev/md2
> > > > > reiserfsck 3.6.19 (2003 www.namesys.com)
> > > > >
> > > > > *************************************************************
> > > > > ** Do not  run  the  program  with  --rebuild-tree  unless **
> > > > > ** something is broken and MAKE A BACKUP  before using it. **
> > > > > ** If you have bad sectors on a drive  it is usually a bad **
> > > > > ** idea to continue using it. Then you probably should get **
> > > > > ** a working hard drive, copy the file system from the bad **
> > > > > ** drive  to the good one -- dd_rescue is  a good tool for **
> > > > > ** that -- and only then run this program.                 **
> > > > > ** If you are using the latest reiserfsprogs and  it fails **
> > > > > ** please  email bug reports to reiserfs-list@namesys.com, **
> > > > > ** providing  as  much  information  as  possible --  your **
> > > > > ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> > > > > ** messages  (including version),  the reiserfsck logfile, **
> > > > > ** check  the  syslog file  for  any  related information. **
> > > > > ** If you would like advice on using this program, support **
> > > > > ** is available  for $25 at  www.namesys.com/support.html. **
> > > > > *************************************************************
> > > > >
> > > > > Will rebuild the filesystem (/dev/md2) tree
> > > > > Will put log info to 'stdout'
> > > > >
> > > > > Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
> > > > > Replaying journal..
> > > > > Reiserfs journal '/dev/md2' in blocks [18..8211]: 0 transactions replayed
> > > > > ###########
> > > > > reiserfsck --rebuild-tree started at Mon Jul 17 21:41:44 2006
> > > > > ###########
> > > > >
> > > > > Pass 0:
> > > > > ####### Pass 0 #######
> > > > > Loading on-disk bitmap .. ok, 116676032 blocks marked used
> > > > > Skipping 11771 blocks (super block, journal, bitmaps) 116664261 blocks
> > > > > will be read
> > > > > 0%....20%....block 85875092: The number of items (256) is incorrect,
> > > > > should be (1) - corrected
> > > > > block 85875092: The free space (1) is incorrect, should be (208) - corrected
> > > > > pass0: vpf-10110: block 85875092, item (0): Unknown item type found
> > > > > [33488896 65537 0x100 ??? (15)] - deleted
> > > > >                                                    left 0, 15065 /seccseccccc
> > > > > 108413 directory entries were hashed with "r5" hash.
> > > > >         "r5" hash is selected
> > > > > Flushing..finished
> > > > >         Read blocks (but not data blocks) 116664261
> > > > >                 Leaves among those 87768646
> > > > >                         - leaves all contents of which could not be
> > > > > saved and deleted 1
> > > > >                 Objectids found 108417
> > > > >
> > > > > Pass 1 (will try to insert 87768645 leaves):
> > > > > ####### Pass 1 #######
> > > > > Looking for allocable blocks .. finished
> > > > > 0%....20%....40%..Not enough allocable blocks, checking bitmap...there
> > > > > are 1 allocable blocks, btw
> > > > >
> > > >
> > > > I am working on a fix for this problem. But the above output looks
> > > > suspicious.
> > > >
> > > > What kind of files are there, would you describe?
> > >
> > > It is the /home folder on my media box. So it has around 10gigs of
> > > personal files (normal everyday file usage), and the rest is media.
> > > There is 40 gigs of mp3s. 100 gigs of avi files of different sizes but
> > > mostly large at least 100 megs or more.
> > >
> > > It also has 200 gigs of mythtv NUV files.
> > >
> > > My suspicion is that mythtv went nuts and began recording something
> > > and never closed the file and used up all the space. But really I
> > > don't know because it has been unusable since I found the problem.
> > >
> > > > Are they long? Did you mount reiserfs with any options?
> > >
> > > Some of the files are long, there would be some files that are 4 gigs
> > > in size. Sometimes mythtv makes very large files.
> > >
> > > I mounted reiserfs with "defaults"
> > >
> > > > Can you give me ssh access to the filesystem so that I could take a look
> > > > at it myself?
> > >
> > > The filesystem contains some sensitive data so I can't really do this
> > > I'm afraid. I'm happy to run any diagnostic tools you have or provide
> > > any more information.
> > >
> > > Joel
> > >
> >
> >
>
>
>
