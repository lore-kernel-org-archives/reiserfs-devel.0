From: Fong Vang <FVang@Zantaz.com>
Subject: reiserfs errors
Date: Mon, 8 Sep 2003 09:36:09 -0700
Message-ID: <3F5CAFF9.9020205@zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15595-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Could someone tell me what these error messages mean (these messages 
appear on the console and in /var/log/messages)?

    Aug 30 15:49:51 fongtest kernel: is_leaf: free space seems wrong: 
level=1, nr_items=58, free_space=12 rdkey
    Aug 30 15:49:51 fongtest kernel: vs-5150: search_by_key: invalid 
format found in block 15395. Fsck?
    ...
    ...
    Aug 30 15:49:51 fongtest kernel: vs-5150: search_by_key: invalid 
format found in block 15395. Fsck?
    Aug 30 15:49:51 fongtest kernel: vs-13070: reiserfs_read_inode2: i/o 
failure occurred trying to find stat data of [6 86762 0x0 SD]
    Aug 30 15:49:51 fongtest kernel:  [6 86779 0x0 SD]
    ...

It doesn't say which device is giving this error message.

This is the system configuration:

    Dual 2.4 Intel Xeon Processors (on SuperMicro motherboard)
    RedHat Linux 7.1
    RedHat's 2.4.18-24.7.xsmp kernel
    ReiserFS version 3.6.25


Any help would be appreciated.




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
