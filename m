From: Fong Vang <FVang@Zantaz.com>
Subject: File system corruption!
Date: Thu, 19 Feb 2004 17:33:08 -0800
Message-ID: <12C7D768CC8ED4118A9200508BEEC6FB03377A50@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Currently, we have a couple of hundred systems with this configuration (per
server):

* RedHat Linux 7.1
* Linux 2.4.20 kernel (from RedHat).  ReiserFS version 3.6.25
* Dual Xeon processors on SuperMicro motherboards
* 4 GB of RAM
* ~1 TB of storage allocated to ReiserFS (8 drives in RAID-10 configuration)

Although most of the systems are performing without hiccups, we've had 2-3
systems loosing the ~1TB ReiserFS file system after a reboot.  3ware reports
all drives are performing optimally.  Mounting the ~1TB ReiserFS file system
is successful but the file system is blank (the actual file system is empty,
not the mount point).  Anyone has any idea how this could happen?

I'm just wondering how many places ReiserFS store the meta data (superinode,
inode, etc.)?

Any help is appreciated.


This e-mail has been captured and archived by the ZANTAZ Digital Safe(tm)
service.  For more information, visit us at www.zantaz.com. 
IMPORTANT: This electronic mail message is intended only for the use of the
individual or entity to which it is addressed and may contain information
that is privileged, confidential or exempt from disclosure under applicable
law.  If the reader of this message is not the intended recipient, or the
employee or agent responsible for delivering this message to the intended
recipient, you are hereby notified that any dissemination, distribution or
copying of this communication is strictly prohibited.  If you have received
this communication in error, please notify the sender immediately by
telephone or directly reply to the original message(s) sent.  Thank you.
