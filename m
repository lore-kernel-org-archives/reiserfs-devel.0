From: Fong Vang <FVang@Zantaz.com>
Subject: root access complains about permission
Date: Thu, 11 Sep 2003 11:04:06 -0700
Message-ID: <3F60B916.6040408@zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15634-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Any thoughts as to why permission would be denied for root when 
accessing a file on a ReiserFS file system?  Here's a sample output

[root@sc15-172-31 log]# id

uid=0(root) gid=0(root)
groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel)
[root@sc15-172-31 /root]# cd /var/log
[root@sc15-172-31 log]# ls
ls: wtmp: Permission denied
ls: messages: Permission denied
ls: messages.1: Permission denied
ls: messages.2: Permission denied
ls: messages.3: Permission denied
ls: maillog: Permission denied
ls: spooler.1: Permission denied
ls: secure.4: Permission denied
ls: secure: Permission denied
ls: maillog.2: Permission denied
ls: maillog.3: Permission denied


kernel is 2.4.19.  Reiserfs ver 3.6.25.  File system is mounted 
read-write.  No ACL.  This is a production system that's been up for 2-3 
months.  Any help would be appreciated.


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
