From: Russell Coker <russell@coker.com.au>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 21:11:34 +1000
Message-ID: <200306052111.34179.russell@coker.com.au>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <200306052025.05910.russell@coker.com.au> <1054809506.1997.76.camel@wusel.schnulli.de>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14430-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1054809506.1997.76.camel@wusel.schnulli.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heinz-Josef Claes <hjclaes@web.de>
Cc: reiserfs-list@namesys.com

On Thu, 5 Jun 2003 20:38, Heinz-Josef Claes wrote:
> Am Don, 2003-06-05 um 12.25 schrieb Russell Coker:
> > On Thu, 5 Jun 2003 20:13, Heinz-Josef Claes wrote:
> > > My question also was about hardware or software raid. If I'm using
> > > software raid, a hardware raid 1 for the OS is not a too bad idea.
> >
> > Booting from software RAID-1 is easy to setup.  I've done it with both
> > SCSI and IDE software RAID.
>
> Perhaps I'm not up to date, but as far as I know rebooting with a broken
> boot disk needs a bios which can switch automatically to the other disk
> of the raid 1. If you have lots of machines (and which are standing
> outside) this is an advantage.

That can be done, but it depends on the error.  If the hard drive is totally 
dead then many BIOSes will handle this for even IDE disks (and I expect every 
SCSI sytem to handle it).  If the hard drive has a bad sector as part of the 
boot process then it probably won't work.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

