From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Error in reiserfsck 3.6.19
Date: Fri, 19 Aug 2005 18:57:42 +0400
Message-ID: <200508191857.42370.vitaly@namesys.com>
References: <b73471a5050819011424c46437@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25574-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b73471a5050819011424c46437@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Adam McLellan <alphanos@gmail.com>

On Friday 19 August 2005 12:14, Adam McLellan wrote:
> Unless I'm doing something wrong, there is an error in reiserfsck
> 3.6.19.  It's actually kind of a humourous error; it doesn't divide
> correctly :-).  I've been going through a somewhat lengthly process to
> diagnose the problem with my reiserfs filesystem, and finally got to
> the point where I'm ready to rebuild the superblock.  Here's the
> output:
> 
> 
> ==> root@0[knoppix]# reiserfsck --rebuild-sb /dev/md0
> ==> reiserfsck 3.6.19 (2003 www.namesys.com)
> ==> 
> ==> *************************************************************
> ==> ** If you are using the latest reiserfsprogs and  it fails **
> ==> ** please  email bug reports to reiserfs-list@namesys.com, **
> ==> ** providing  as  much  information  as  possible --  your **
> ==> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ==> ** messages  (including version),  the reiserfsck logfile, **
> ==> ** check  the  syslog file  for  any  related information. **
> ==> ** If you would like advice on using this program, support **
> ==> ** is available  for $25 at  www.namesys.com/support.html. **
> ==> *************************************************************
> ==> 
> ==> Will check superblock and rebuild it if needed
> ==> Will put log info to 'stdout'
> ==> 
> ==> Do you want to run this program?[N/Yes] (note need to type Yes if
> you do):Yes
> ==> 
> ==> reiserfs_open: the reiserfs superblock cannot be found on /dev/md0.
> ==> 
> ==> what the version of ReiserFS do you use[1-4]
> ==>         (1)   3.6.x
> ==>         (2) >=3.5.9 (introduced in the middle of 1999) (if you use
> linux 2.2, choose
> ==> this one)
> ==>         (3) < 3.5.9 converted to new format (don't choose if unsure)
> ==>         (4) < 3.5.9 (this is very old format, don't choose if unsure)
> ==>         (X)   exit
> ==> 1
> ==> 
> ==> Enter block size [4096]:
> ==> 16384

blocksize cannot be larger than page size.

> ==> rebuild_sb: wrong block size specified, only divisible by 1024 are
> supported
> ==> currently

not clear message, within 512-8192 region.

> ==> 
> ==> root@0[knoppix]#
> 
> So far as I know, 1024 * 16 = 16384.  I'm currently running on a
> Knoppix 3.9 CD, using the included reiserfsprogs package.  It uses the
> 2.6.11 linux kernel.  My system doesn't have any stability issues that
> should cause it to divide incorrectly :-).  Since this appears to be
> an interface error rather than an operation error, I don't think my
> kernel modules are relevant, but a log of sorts listing all of the
> steps I've taken to diagnose my problems since they started can be
> found at http://forums.gentoo.org/viewtopic-t-371570.html.  It
> contains a lot of information about my current setup, but much of the
> early text refers to attempts to check for hardware problems and to
> fix a software raid problem.
> If/when I can get past this error message, I hope I am correct in
> assuming the the program shouldn't have any trouble actually
> performing the superblock rebuild with a block size of 16384?  

you are right, it is not a problem for progs. however, recovery 
with the wrong blocksize will make more harm than good. if not 
sure about blocksize (or partition start), make a raw backup of the 
device (dd, dd_rescue) before rebuilding. then proceed with the 
wanted blocksize (512-8K, probably the default is the correct one)
and rebuild the journal header if needed.

> I've 
> been running this filesystem for two years with that block size, and
> am not ready to give up the data on it just yet :-).
> Thanks for any help with this problem, and also for the wonderul file
> system :-).
> Alphanos
> 
> 

-- 
Thanks,
Vitaly Fertman
