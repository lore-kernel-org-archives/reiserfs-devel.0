From: Fong Vang <FVang@Zantaz.com>
Subject: RE: Write-once file system
Date: Fri, 27 Jun 2003 09:53:21 -0700
Message-ID: <12C7D768CC8ED4118A9200508BEEC6FB033776CC@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14744-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Oleg Drokin' <green@namesys.com>
Cc: 'Hans Reiser' <reiser@namesys.com>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

I don't think turning the write option off during write is a good idea.  All
file systems running reiserfs should make the file write-once.  File systems
that do need to be rewriteable will use ext3 or something else (that's how
we do it now anyway).

Could it done in such a way that even root can't write (not even when using
block devices)?

-----Original Message-----
From: Oleg Drokin [mailto:green@namesys.com]
Sent: Friday, June 27, 2003 9:20 AM
To: Fong Vang
Cc: 'Hans Reiser'; 'reiserfs-list@namesys.com'
Subject: Re: Write-once file system


Hello!

On Fri, Jun 27, 2003 at 09:07:05AM -0700, Fong Vang wrote:
> Once the write to the file is CLOSED the file should not be modifiable in
> any way.  It should not be writeable by root.  Ideally, this should be
> across reboot and across kernel.  The current requirement is that as long
as
> the modified kernel/reisefs is being used then it should NOT be modifiable
> (if a kernel allowing modification is used then it could allow
> modifications).

So basically do you think it would be better for you to have "write-once
flag" in superblock
that will make all files to be unwritable (except newly created ones) as
opposed to a simple
mount option that you'd use for filesystems with non-changeable files?
(you need to mark filesystems that are in write-once mode somehow, because I
think
you do not need all reiserfs filesystems to be run in this mode, right?)
Also concerning the "root should not be able to change the files", root
will be able to overwrite files by using block devices if he'd want to.

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
