From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: reiserfsprogs-3.6.12 release
Date: Thu, 12 Feb 2004 15:31:44 +0100
Message-ID: <200402121526.51942.henning-04@die.informatik.uni-siegen.de>
References: <200402102010.04479.vitaly@namesys.com> <200402121317.53245.henning-04@die.informatik.uni-siegen.de> <200402121710.19639.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16778-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402121710.19639.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>

Am Donnerstag, 12. Februar 2004 15:10 schrieb Vitaly Fertman:
>
> so dev is devfs. ok, would you then
> 	stat ide/host0/bus1/target0/lun0/part7
> ?
>
> looks like rdev of the device file on devfs does not match to dev of its
> mount point.

This command gives me (after boot)

$ stat /dev/ide/host0/bus1/target0/lun0/part7
  File: ,,/dev/ide/host0/bus1/target0/lun0/part7"
  Size: 0               Blocks: 0          IO Block: 1024   blockorientierte 
Spezialdatei
Device: ah/10d  Inode: 646         Links: 1     Device type: 16,7
Access: (0600/brw-------)  Uid: (    0/    root)   Gid: (    0/    root)

$ rdev
/dev/ide/host0/bus1/target0/lun0/part7 /

Well, but why checks reiserfsprogs-3.6.11 this device without problems during 
the boot process?


Regards,

Henning

