From: Chris Mason <mason@suse.com>
Subject: Re: 3.6.25 - Journal replayed back to 3 weeks ago
Date: Thu, 15 Jan 2004 09:53:47 -0500
Message-ID: <1074178426.29550.19.camel@tiny.suse.com>
References: <1073933244.2405.44.camel@neilvaiogt.superbase.co.uk>
	 <1073934293.32706.861.camel@tiny.suse.com>
	 <1074144196.2397.38.camel@neilvaiogt.superbase.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16524-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1074144196.2397.38.camel@neilvaiogt.superbase.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Neil Robinson <neilr@superbase.co.uk>
Cc: reiserfs-list@namesys.com

On Thu, 2004-01-15 at 00:23, Neil Robinson wrote:
> Chris,
> 
> I haven't heard anything since my response, so just in case it wasn't
> complete enough:
> 
> uname -a results:
> 
> 2.4.20-gentoo-r9 #1 Sat Dec 6 03:17:43 GMT 2003 i686 Intel(R) Pentium(R)
> 4 CPU 2.66GHz GenuineIntel GNU/Linux
> 
> This is running in a vmware workstation 4.0 Windows XP host. It is set
> up with 3 MAX 4GB emulated SCSI drives and 1 emulated MAX 2GB FAT32 IDE
> hard drive.
> 
> sda1 is ext2 on /boot
> sda2 is swap on swap
> sda3 is reiserfs on /
> sdb1 is reiserfs on /home
> sdc1 is reiserfs on /var/tmp/portage
> hda1 is vfat on /work

Ok, please tell me more about the vmware setup.  Is are the vmware
drives configured to do copy on write?

-chris


