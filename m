From: Fong Vang <FVang@Zantaz.com>
Subject: RE: Write-once file system
Date: Fri, 27 Jun 2003 09:07:53 -0700
Message-ID: <12C7D768CC8ED4118A9200508BEEC6FB033776CA@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14737-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Oleg Drokin' <green@namesys.com>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

it should be mandantory.  root should not be able to change it.

-----Original Message-----
From: Oleg Drokin [mailto:green@namesys.com]
Sent: Friday, June 27, 2003 8:46 AM
To: Fong Vang
Cc: 'reiserfs-list@namesys.com'
Subject: Re: Write-once file system


Hello!

On Fri, Jun 27, 2003 at 08:43:06AM -0700, Fong Vang wrote:
> We rely heavily on reiserfs for some of our critical file systems.  I'm
just
> wondering what work would be involved and how difficult it would be to add
> an option (perhaps at mount time) to reiserfs that will allow a file to be
> written only once, i.e. once a file is created it should not be allowed to
> be modified or deleted (including the inode).  We may consider paying for
> this modification.

Is the extended attributes support (man chattr) does what you want by any
chance?

Bye,
    Oleg


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
