From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Two possible bugs in V3 ReiserFS and 2.4.31 kernel??
Date: Tue, 23 Aug 2005 15:04:42 +0400
Message-ID: <430B02CA.5050209@namesys.com>
References: <20050822201535.GA15324@kaizen.mayo.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050822201535.GA15324@kaizen.mayo.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cris Rhea <crhea@mayo.edu>
Cc: reiserfs-list@namesys.com

Hello

Cris Rhea wrote:
> Background:
> 
> Dell 6600 (4 processor, 8GB memory) with RHAS3 loaded.
> Email product vendor suggests using ReiserFS V3 on mail spool directory
> for speed (many files in one directory).
> 
> Since RedHat does not support/include ReiserFS in their kernels, download
> and build the latest 2.4 kernel:
> 
> 	linux-2.4.31.tar.gz (ftp.kernel.org)
> 
>>From my reading, there are NO patches for ReiserFS...
> 
> Take current kernel config (RedHat's kernel-2.4.21-i686-smp.config) and 
> use it for the base for the 2.4.31 kernel (make oldconfig). Take defaults 
> (mostly "N") for all new features.  Reiserfs is a module. 
> 
> Download, compile, and install reiserfsprogs-3.6.19.tar.gz.
> 
> Upon reboot, reiserfs shows up in lsmod....
> 
> mkreiserfs -b 2048 /dev/sdc1  (sdc1 is a RAID-5 hardware LUN on the Dell
>                               PERC controller. Only one partition defined 
>                               [entire disk] as type 83.)
> Command completes successfully.
> 
> reiserfsck /dev/sdc1 also works successfully....
> 
> Mount via fstab or via: mount -t reiserfs /dev/sdc1 /var/spool/MHS1
> fails with:
> 
> mount: wrong fs type, bad option, bad superblock on /dev/sdc1,
>        or too many mounted file systems
> 
> Running the mkreiserfs without the "-b 2048" works fine (correctly mounts).
> 

Yes, please use always default block size.

> Second problem.... if one labels the filesystem during build
> (mkreiserfs -l "/var/spool/MHS1" /dev/sdc1), this fails to mount if you
> use the "LABEL=/var/spool/MHS1" option in /etc/fstab.  This is supposed to
> work on 3.6 per the FAQ.
> 

this works perfectly on 2.6.13-rc6-mm1. And probably on earlier 2.6 kernels.

> I didn't find much on the 'net other than patches/problems for early 
> 2.4 kernels. 
> 
> I'm having a hard time believing nobody has ever tried "-b 2048" on 
> V3 ReiserFS previously.... must be something hosed in the latest
> kernel.....

This is known reiserfs problem: no block sizes other than default one
