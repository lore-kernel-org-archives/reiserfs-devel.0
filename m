From: Horst Simon <hsimon@optusnet.com.au>
Subject: Re: Zero Bit found
Date: Tue, 27 Jul 2004 09:02:54 +1000 (EST)
Message-ID: <6166426.1090882974723.SLOX.WebMail.wwwrun@neptune.hsc-consulting.com.au>
References: <6913951.1090812351701.SLOX.WebMail.wwwrun@neptune.hsc-consulting.com.au> <200407261415.24890.vitaly@namesys.com>
Reply-To: hsimon@optusnet.com.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19829-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407261415.24890.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: hsimon@optusnet.com.au, reiserfs-list@namesys.com

On Jul 26, 2004 08:15 PM, Vitaly Fertman <vitaly@namesys.com> wrote:

> On Monday 26 July 2004 07:25, Horst Simon wrote:
> > Hi,
> >
> > I recently added a 200GB Seagate IDE drive to my system on a
> > build-in
> > promise controller on an ASUS A7V, updated BIOS which supports large
> > disk drives.
> > The O/S is United Linux 1.0 with the latest patches and the kernel
> > version is
> > 2.4.21 with latest United Linux patches. The reiserfs is 3.6. During
> > the
> > initial
> > setup and first reboot no reiserfsck errors are report. After
> > writing
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
> > What is this ZERO BIT, is this a serious problem? What could be
> > wrong
> 
> zero bit is not serious, but the message 'The on-disk and the correct
> bitmaps
> differ. ' points to another more serious problem. --fix-fixable is
> supposed to
> fix them both (and as I have just tested, it does) -- this is not good
> that these
> problems arrear again and again.
> 
> > bad BIOS, reiserfs, etc.?
> 
> could you umount the fs, run reiserfsck --check on it, then if it
> finds these
> corruptions fix them with fix-fixable and reiserfsck --check again to
> be
> sure all of them are fixed?
> 
> the problem could in your hardware also. we deal with such problems 
> under the terms of our support page (www.namesys.com/support.html) 
> -- visit it please.
> 
> -- 
> Thanks,
> Vitaly Fertman
> 

Thanks for the information, I will try your suggestions coming weekend.
I also
noticed that this problems occur only after writing to the disk. 

Regards,
Horst

