From: Fong Vang <FVang@Zantaz.com>
Subject: RE: Write-once file system
Date: Fri, 27 Jun 2003 09:07:05 -0700
Message-ID: <12C7D768CC8ED4118A9200508BEEC6FB033776C9@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14736-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Hans Reiser' <reiser@namesys.com>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Once the write to the file is CLOSED the file should not be modifiable in
any way.  It should not be writeable by root.  Ideally, this should be
across reboot and across kernel.  The current requirement is that as long as
the modified kernel/reisefs is being used then it should NOT be modifiable
(if a kernel allowing modification is used then it could allow
modifications).

-----Original Message-----
From: Hans Reiser [mailto:reiser@namesys.com]
Sent: Friday, June 27, 2003 8:49 AM
To: Fong Vang
Cc: 'reiserfs-list@namesys.com'
Subject: Re: Write-once file system


Fong Vang wrote:

>We rely heavily on reiserfs for some of our critical file systems.  I'm
just
>wondering what work would be involved and how difficult it would be to add
>an option (perhaps at mount time) to reiserfs that will allow a file to be
>written only once, i.e. once a file is created it should not be allowed to
>be modified or deleted (including the inode).  We may consider paying for
>this modification.
>
>
>
>This e-mail has been captured and archived by the ZANTAZ Digital Safe(tm)
>service.  For more information, visit us at www.zantaz.com. 
>IMPORTANT: This electronic mail message is intended only for the use of the
>individual or entity to which it is addressed and may contain information
>that is privileged, confidential or exempt from disclosure under applicable
>law.  If the reader of this message is not the intended recipient, or the
>employee or agent responsible for delivering this message to the intended
>recipient, you are hereby notified that any dissemination, distribution or
>copying of this communication is strictly prohibited.  If you have received
>this communication in error, please notify the sender immediately by
>telephone or directly reply to the original message(s) sent.  Thank you.
>
>
>  
>
Do you intend to first write it, and then indicate that it should no 
longer be modifiable?  Or do you want it to be unmodifiable as it is 
being appended to?  Do you want it to be safe from root?  Do you want it 
to be safe from rebooting to a new kernel?

-- 
Hans



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
