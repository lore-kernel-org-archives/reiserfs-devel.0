From: nickyt44@optonline.net
Subject: After `quotacheck` ReiserFS Root Filesystem Won't Mount Read-Write
Date: Mon, 16 Aug 2004 20:12:29 -0400
Message-ID: <22c16c22abfc.22abfc22c16c@optonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-20344-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-language: en
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi All,

I hope someone can help me to fix my broken system.  I'm using Libranet 
2.8.1 (debian-based) with kernel 2.4.26. It's a dual-boot (grub 
bootloader) with Win XP.  I'm pretty sure I know what happened and why, 
I just don't know how to resolve it.

I installed quotacheck, after googling and reading a popular sys admin 
book, on my system.  It never worked.  I started doing additional 
research on why it wasn't working and after a couple of days, my system 
refused to boot.  During the boot sequence it complained about 
`reiserfs_getopt:  unknown option "usrquota"`.  Of course, I'd edited my 
/etc/fstab directory to explicitly include that option as follows:
#<device>   <mount point>   <type>      <options>            <dump>   <pass>
/dev/hde2            /               reiserfs       defaults,usrquota     0               1    


Now that the `usrquota` option is choking my system, I want to edit it 
out...but I can't because the root (/) filesystem will only mount 
read-only.  Which brings me to the crux of the matter:  if I can't 
re-edit the /etc/fstab file to eliminate the offending option, and I 
can't force reiserfs to mount properly as a read-write root filesystem, 
how do I recover my system? 

I've been googling for the last 2 weeks and have found a variety of 
combinations of the `mount` command, none of them works.  I've tried 
`mount / -o remount,rw` `mount -o remount,rw /dev/hde2`  `mount 
/dev/hde2 -t reiserfs remount,rw` and `mount -n -o remount,rw /`...all 
to no avail.  I invariably get the following message:  
`reiserfs_getopt:  unknown option "usrquota"
mount:  / not mounted already or bad option`.  I've tried using a 
knoppix live cd to edit the /etc/fstab directory, but the /etc/fstab 
shown when I cd to /etc/fstab is one created by knoppix and not the 
/etc/fstab on my root /dev/hde2.

How do I force reiserfs to mount read-write in order to edit the 
/etc/fstab file?  Although I have a recent backup of my Libranet system, 
I'm hoping not to do a reinstall.  TIA.
Nick


