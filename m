From: Bernd Schubert <bernd-schubert@web.de>
Subject: filesystem corruption ?
Date: Thu, 20 Mar 2003 17:25:13 +0100
Sender: Bernd Schubert <Bernd.Schubert@tc.pci.uni-heidelberg.de>
Message-ID: <200303201725.14039.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13305-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

we just encountered serious problems on our '/' reiserfs partition. 
To short it up, before the full problem description comes, 
"reiserfsck{3.6.3,4,5pre2} --check" doesn't find any problems.

Well, in detail this means that some binaries suddenly became corrupted. For 
example running gdb gives:

gdb: Symbol `emacs_ctlx_keymap' has different size in shared object, consider 
re-linking
Illegal instruction

We use this filesystem a nfs-root-fs to several clients (exported as 
read-only), so we are lucky, since we regularly backup the whole partition. 
We have a backup from this Morning and another one from Monday. Based on 
comparing the output of md5sum we can't find any problems between the version 
from monday and the version of this morning, *but* there are differences for 
some binaries in /usr/bin, such as gdb, between the backup of this Morning 
and the Current files.
(Well, to say the truth there also some more difference between the monday's 
backup, the backup of this Morning and the Current version, but these are, of 
course, only difference we caused ourselves by doing updates and kernel 
compilations)

We currently have remounted '/' (hda5) read-only and have run several versions 
of reiserfsck (including the current 3.6.5pre2), so 'reiserfsck --check 
/dev/hda5', but it doesn't find any problems.

Do you have any ideas whats going wrong and what we can do?


Thanks in advance,
	Bernd


PS: a detailed system description:
		- Athlon 2000+ with 3GB ECC RAM (ECC is enabled in the bios, memtest86 also 
reports enabled ECC)
		- 80GB Western Digital harddisk on /dev/hda
		- (cdwriter on /dev/hdc)
		- kernel is 2.4.20 
		- '/' is on hda5; '/etc' and '/var' are on extra partitions
		- '/home' is mounted from another server
		
During the noon/afternoon I repompiled a new kernel for another system in 
'/usr/src', so probably the main writing access during this day.
