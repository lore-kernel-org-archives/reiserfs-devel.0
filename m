From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 bug in 2.6.16-rc2-mm1
Date: Wed, 22 Feb 2006 14:02:13 +0300
Message-ID: <1140606133.12162.65.camel@tribesman.namesys.com>
References: <20060210142215.GA1714@deprez-aerts.dyndns.org>
	 <200602162317.32054.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
	 <fdc23ba20602170843u333d1328kbd658812692a3ea3@mail.gmail.com>
	 <1140533847.12162.28.camel@tribesman.namesys.com>
	 <fdc23ba20602211758n6e853298i7b406a3e3a6d55d8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <fdc23ba20602211758n6e853298i7b406a3e3a6d55d8@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Cohorn <elotemuygrande@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2006-02-21 at 19:58 -0600, John Cohorn wrote:
> First off, thank you for taking the time to respond. 
> 
> Basically any heavy activity on the partition seems to trigger it.
> Here's a short transcript:
> 
> dually ~ # cat /proc/version
> Linux version 2.6.16-rc2-mm1 (root@localhost) (gcc version 3.3.6
> (Gentoo 3.3.6, ssp-3.3.6-1.0, pie-8.7.8)) #7 SMP PREEMPT Thu Feb 16
> 21:19:53 Local time zone must be set--
> dually ~ # mkfs.reiser4 --version
> mkfs.reiser4 1.0.5
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing
> governed by 
> reiser4progs/COPYING. 
> dually ~ # mkfs.reiser4 /dev/sdb1 --yes
> dually ~ # mount /dev/sdb1 /data1 
> dually ~ # klogd -d -f ~/kernel.log
> dually ~ # cd /data1
> dually data1 # cp -ra /usr/src/linux-2.6.16-rc2-mm1/ .
> dually data1 # tar cf linux.bz2 linux-2.6.16-rc2-mm1/
> 
> ...after about half a minute of activity I receive the message which
> I've attached as a small JPEG 
> "reiser4 panicked cowardly: reiser4[tar(4078)] commit_current_atom
> (fs/reiser4/txnmgr.c:1130) [zam-597]:". 

Would you please try your test on ide disk?

> I can't see whether it was line 1130 or  1138.  I'll take a quick look
> myself, but I'm completely unfamiliar with reiser4 sources and the
> kernel sources in general. 
> 
> After this my system is completely locked up. When I mount the
> partition after restarting it no longer contains any files. I have few
> or no problems when creating, mounting, and working on reiser4
> partitions when booted from the System recovery liveCD so it must be
> something in the latest sources or in my kernel configuration

IIRC, there were changes (not in reiser4) which caused kernel to notice
i/o errors on SCSI devices where older kernels did not see any problems.

> (which is 100% stable for everything else under reiser3, but I haven't
> bothered to perfect yet). 
> 
> Apologies about the JPEG, I could not figure out how to get the kernel
> output logged into a file(maybe it freezes before the file can flush
> to disk, i dunno). If you know of a way, I welcome instruction.
> 

reiserfs-list@namesys.com does not accept binary attachments. Please
send the image to zam@namesys.com and vs@namesys.com

You should setup either serial or netconsole to catch kernel output.
Please look at instructions:
linux/Documentation/serial-console.txt
linux/Documentation/networking/netconsole.txt


