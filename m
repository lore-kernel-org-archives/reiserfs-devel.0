From: Cliff White <cliffw@osdl.org>
Subject: fsck.reiser4 error
Date: Thu, 14 Nov 2002 08:43:42 -0800
Message-ID: <200211141643.gAEGhgS09039@mail.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


This happens every time:
# fsck.reiser4 /dev/hdb1

Will check consistency of the filesystem on (/dev/hdb1).
Will use (default40) profile.
Information: Continue?                                                        
(Yes/No): Yes
##########
reiserfsck --check started at Thu Nov 14 03:55:03 2002
##########
umka-360: Assertion (format != NULL) at format.c:227 in function              
reiser4_format_get_len() failed.
(Ignore/Cancel): i
Segmentation fault
-----------------------
Kernel is 2.5.47 + latest reiser4 snapshot.
System is VALinux 2x 800MHZ Intel Xeon
256 MB memory 
Base distro is RH 7.3
reiserfsprogs is from snapshot.

cliffw

