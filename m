From: Neil Robinson <neilr@superbase.co.uk>
Subject: Re: 3.6.25 - Journal replayed back to 3 weeks ago
Date: Thu, 15 Jan 2004 05:23:16 +0000
Message-ID: <1074144196.2397.38.camel@neilvaiogt.superbase.co.uk>
References: <1073933244.2405.44.camel@neilvaiogt.superbase.co.uk>
	 <1073934293.32706.861.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16523-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1073934293.32706.861.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris,

I haven't heard anything since my response, so just in case it wasn't
complete enough:

uname -a results:

2.4.20-gentoo-r9 #1 Sat Dec 6 03:17:43 GMT 2003 i686 Intel(R) Pentium(R)
4 CPU 2.66GHz GenuineIntel GNU/Linux

This is running in a vmware workstation 4.0 Windows XP host. It is set
up with 3 MAX 4GB emulated SCSI drives and 1 emulated MAX 2GB FAT32 IDE
hard drive.

sda1 is ext2 on /boot
sda2 is swap on swap
sda3 is reiserfs on /
sdb1 is reiserfs on /home
sdc1 is reiserfs on /var/tmp/portage
hda1 is vfat on /work

Ciao, Neil

On Mon, 2004-01-12 at 19:04, Chris Mason wrote:
> On Mon, 2004-01-12 at 13:47, Neil Robinson wrote:
> > Hi,
> > 
> > this morning when I started up my notebook (running Windows XP) with a
> > VMware session running Gentoo, the boot sequence claimed that the
> > reiserfs drives had not been cleanly umounted (not true, I powered down
> > the usual way on Friday evening -- su to root and then issued the
> > poweroff command). It then replayed the journals of the two partitions
> > using reiserfs. When it finished and booted, it was as if my entire
> > machine had stepped back in time by 3 weeks or so (to around the 23rd of
> > December). Since then I had installed and built openoffice, emacs, and
> > numerous other bits and pieces. I also lost all of the email that was
> > living in the courier-imap server.
> > 
> > I am *very* concerned about this behaviour. I have successfully
> > restarted, booted, etc. literally dozens of times since mid-December. I
> > have now just installed a software RAID using RAID 5 on Gentoo and using
> > reiserfs for a fairly large system (250GB on 8 SCSI U160 drives) with an
> > available hot spare and a tape backup unit. Losing a few weeks of
> > relatively insignificant changes is nothing compared with possibly
> > losing the contents of my company's master file server. Can anyone tell
> > me why reiserfs rolled back all the way to mid-December in spite of
> > numerous reboots and how I can avoid a rerun of this scenario *ever*
> > again. Is ther some way to tell it to commit its changes that I am not
> > doing and should be aware of?
> 
> That's not supposed to happen.  Lets start with details about which
> version of the kernel you were using.
> 
> -chris
> 
> 
> 

