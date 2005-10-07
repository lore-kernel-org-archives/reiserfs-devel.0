From: Steve Jacobson <steve@sourcelabs.com>
Subject: Building Reiser4 - Symbol problem
Date: Fri, 07 Oct 2005 16:48:26 -0700
Message-ID: <4347094A.3090801@sourcelabs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030801090004070600060905"
Return-path: <reiserfs-list-return-26425-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------030801090004070600060905
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm having a problem loading Reiser4 on my centOS4 box.  The following
message shows up in the system logs when I run "modprobe reiser4":
reiser4: Unknown symbol find_get_pages_tag

My build, etc... process is:

1) Start with clean install of centOS 4.1 x86_64 version
2) Install kernel sources from centOS distro
3) Patch sources:
   a) in /usr/src/linux-2.6.9-11.EL
   b) run: patch -p0 < reiser4-for-2.6.9-4
NOTE - is this my complete problem right here?   Are the differences
between 2.6.9-11 and 2.6.9-4 significant enough to account for this?
4) make menuconfig - enabling reiser4 as a module
5) make
6) make binrpm-pkg
7) Install the resultant RPM
8) run mkinitrd /boot/initrd-2.6.9-11.ELcustom.img 2.6.9011.ELcustom
9) Update grub.conf:
   title CentOS-4 x86_64 Resier (2.6.9-11.ELcustom)
        root (hd0,0)
        kernel /vmlinuz-2.6.9-11.ELcustom ro root=LABEL=/1
        initrd /initrd-2.6.9-11.ELcustom.img
10) reboot, and select the custom kernel
11) Run mkfs.reiser4
12) run modprobe reiser4, or just try to mount the new file system


Any thoughts?  Has anyone had any success using Resier4 on centOS 4.1? 
If so, did you follow this process, or another?

thanks!

-Steve J

-- 
Steve Jacobson
Support Manager
SourceLabs, Inc.
steve@sourcelabs.com
(206) 322-0099 x110


--------------030801090004070600060905--
