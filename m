From: Newton Hammet <newton@hammet.net>
Subject: [Fwd: Re: [alg] reiserfs and filesystem labels]
Date: 16 Mar 2003 14:36:23 -0600
Message-ID: <1047846988.2691.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello Reiserfs people,

   I am trying to build a system with all filesystems including the swap
partition hopefully being labeled filesystems. My goal is a bootable
backup drive that can be booted from any ide channel or slot on the
system (all fs's being labeled).

   ext3 is no problem.  I can create labeled filesystems all day
long and mount them via:

mount LABEL=root_0035 /mnt/bkup

for example will find the partition labeled 'root_0035' regardless
of what disk it is on or which partition it happens to be.

However when I create a reiserfs filesystem in the following manner:

/sbin/mkreiserfs --label bigfs_0035 /dev/hdg8

and attempt a mount in the following manner:mount: no such partition
found


mount -L bigfs_0035 /mnt/bkup
				-or-
mount LABEL=bigfs_0035 /mnt/bkup

I get the following message:

mount: no such partition found

I checked out the partition in the following manner:
dd if=/dev/hdg8|strings -td -n 8 |grep boot_0035
  65636 bigfs_0035
  77924 bigfs_0035
  94308 bigfs_0035
 106596 bigfs_0035
 118884 bigfs_0035
 131172 bigfs_0035


Note that I do a similar protocol for ext3 filesystems, exact same
mount command format and have no problem.

Here is some other background information that might help :::

rpm -qa|grep -E 'reiserfs|mount|kernel'

kernel-2.4.18-14
kernel-utils-2.4-8.13
kernel-pcmcia-cs-3.1.31-9
kernel-doc-2.4.18-14
kernel-source-2.4.18-14
kernel-debug-2.4.18-14
mount-2.11r-10
reiserfs-utils-3.6.2-2
kernel-uml-2.4.18-14

My distro is RedHat 8.0. 

I will continue to research this on my own but if any of you have
seen this before or have not and know of something either obvious or
not that I am missing let me know.  It may be an actual bug and I
simply need a fix for it.(i.e., bug in mount, and/or reiserfs-utils)

Let me know if you need more information from me. If there is already
a fix for this problem please let me know or point me in the right direction
for getting the appropriate fix.

Regards, Newton


