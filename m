From: Fong Vang <FVang@Zantaz.com>
Subject: Write-once file system
Date: Fri, 27 Jun 2003 08:43:06 -0700
Message-ID: <12C7D768CC8ED4118A9200508BEEC6FB033776C7@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

We rely heavily on reiserfs for some of our critical file systems.  I'm just
wondering what work would be involved and how difficult it would be to add
an option (perhaps at mount time) to reiserfs that will allow a file to be
written only once, i.e. once a file is created it should not be allowed to
be modified or deleted (including the inode).  We may consider paying for
this modification.



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
