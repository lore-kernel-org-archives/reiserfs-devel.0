From: Horst Simon <hsimon@optusnet.com.au>
Subject: Re: Zero Bit found
Date: Tue, 10 Aug 2004 23:13:16 +1000
Message-ID: <200408102313.16186.hsimon@optusnet.com.au>
References: <6913951.1090812351701.SLOX.WebMail.wwwrun@neptune.hsc-consulting.com.au> <200407261415.24890.vitaly@namesys.com>
Reply-To: hsimon@optusnet.com.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20124-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407261415.24890.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, 26 Jul 2004 08:15 pm, Vitaly Fertman wrote:
> On Monday 26 July 2004 07:25, Horst Simon wrote:
> > Hi,
> >
> > I recently added a 200GB Seagate IDE drive to my system on a build-in
> > promise controller on an ASUS A7V, updated BIOS which supports large
> > disk drives.
> > The O/S is United Linux 1.0 with the latest patches and the kernel
> > version is
> > 2.4.21 with latest United Linux patches. The reiserfs is 3.6. During the
> > initial
> > setup and first reboot no reiserfsck errors are report. After writing
> > data to the disk I get now following reiserfsck messages during each
> > boot:
> >
> >  ZERO BIT FOUND IN ON-DISK BITMAP AFTER THE LAST VALID BIT
> > Switching to --fix-fixable mode
> > Checking
> >
> > It displays directory paths which it is checking and after finishing
> > following message is displayed:
> >
> > The on-disk and the correct bitmaps differ. Will be fixed later
> >
> > No corruption found
> >
> > What is this ZERO BIT, is this a serious problem? What could be wrong
>
> zero bit is not serious, but the message 'The on-disk and the correct
> bitmaps differ. ' points to another more serious problem. --fix-fixable is
> supposed to fix them both (and as I have just tested, it does) -- this is
> not good that these problems arrear again and again.
>
> > bad BIOS, reiserfs, etc.?
>
> could you umount the fs, run reiserfsck --check on it, then if it finds
> these corruptions fix them with fix-fixable and reiserfsck --check again to
> be sure all of them are fixed?
>
> the problem could in your hardware also. we deal with such problems
> under the terms of our support page (www.namesys.com/support.html)
> -- visit it please.
I finally got around to do your suggestions I moved the drive to an other 
Motherboard and following are the output of reiserfsck

1. reiserfsck --check
###########
reiserfsck --check started at Tue Aug 10 23:02:06 2004
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Checking Semantic tree:
finished
1 found corruptions can be fixed when running with --fix-fixable
###########
reiserfsck finished at Tue Aug 10 23:03:08 2004
###########

2. reiserfsck --fix-fixable
###########
reiserfsck --fix-fixable started at Tue Aug 10 23:07:17 2004
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps differs. 
Will be fixed later.
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
        Leaves 20287
        Internal nodes 123
        Directories 2064
        Other files 22888
        Data block pointers 15971390 (0 of them are zero)
        Safe links 0
###########
reiserfsck finished at Tue Aug 10 23:08:35 2004
###########

3. reiserfsck --check


-- Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
###########
reiserfsck --check started at Tue Aug 10 23:09:20 2004
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Checking Semantic tree:
finished
1 found corruptions can be fixed when running with --fix-fixable
###########
reiserfsck finished at Tue Aug 10 23:10:22 2004
###########

The reiserfsck is version 3.6.9 O/S SLOX 4.1 (United Linux) Kernel 2.4.21-238
It happens only on the new Seagate 200GB IDE disk drive on different 
controllers (motherboards).

Regards
Horst Simon

  Horst Simon
  HSC-Consulting Pty. Ltd.
  Tel: +61(0)3 9553-1624
  Fax: +61(0)3 9553-1624
  hsimon@optusnet.com.au
  --------------------------------------------------------------
  This message was sent by
  KMail 1.6.2 Using KDE 3.2.2 & SuSE Linux 9.1

