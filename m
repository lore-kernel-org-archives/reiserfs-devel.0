From: Fong Vang <FVang@Zantaz.com>
Subject: RE: Write-once file system
Date: Fri, 27 Jun 2003 10:07:05 -0700
Message-ID: <12C7D768CC8ED4118A9200508BEEC6FB033776CD@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Andreas Dilger' <adilger@clusterfs.com>
Cc: 'Hans Reiser' <reiser@namesys.com>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

this doesn't seem to work on kernel 2.4.20.  I did a chattr +i on file but
rm -rf (as root) on the file deletes it.


-----Original Message-----
From: Andreas Dilger [mailto:adilger@clusterfs.com]
Sent: Friday, June 27, 2003 10:01 AM
To: Fong Vang
Cc: 'Hans Reiser'; 'reiserfs-list@namesys.com'
Subject: Re: Write-once file system


On Jun 27, 2003  09:07 -0700, Fong Vang wrote:
> Once the write to the file is CLOSED the file should not be modifiable in
> any way.  It should not be writeable by root.  Ideally, this should be
> across reboot and across kernel.  The current requirement is that as long
as
> the modified kernel/reisefs is being used then it should NOT be modifiable
> (if a kernel allowing modification is used then it could allow
> modifications).

Sounds like "immutable" (chattr +i) support is what you want.  It looks
like reiserfs already supports this.  Even root can not overwrite or delete
an immutable file, but could disable the immutable flag first (chattr -i)
before doing so.  Regular users can never disable the immutable flag once
set without the CAP_LINUX_IMMUTABLE capability.  However, it looks like
the reiserfs code has a bug there - any user can clear the immutable flag
(see ext[23]_ioctl() for proper permission check).

In BSD (AFAIK), removing the immutable flag requires that you be booted
into runlevel 1 (single user) but in Linux it can currently be done at any
time, although I imagine it would be pretty easy to fix that.

You should be able to set the immutable flag on a directory and have it
inherited by all files created in that directory.

> Fong Vang wrote:
> >We rely heavily on reiserfs for some of our critical file systems.  I'm
> >wondering what work would be involved and how difficult it would be to
add
> >an option (perhaps at mount time) to reiserfs that will allow a file to
be
> >written only once, i.e. once a file is created it should not be allowed
to
> >be modified or deleted (including the inode).  We may consider paying for
> >this modification.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/


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
