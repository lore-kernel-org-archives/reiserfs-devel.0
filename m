From: Fong Vang <FVang@Zantaz.com>
Subject: RE: Write-once file system
Date: Fri, 27 Jun 2003 10:21:34 -0700
Message-ID: <12C7D768CC8ED4118A9200508BEEC6FB033776CE@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14748-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Jason Holt' <jason@lunkwill.org>
Cc: 'Oleg Drokin' <green@namesys.com>, 'Hans Reiser' <reiser@namesys.com>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Physical access to the machine is a separate issue which we're already
addressing with biometrics and other measures.

Could root be disabled completely?  I haven't tried this before so I don't
know what impact disabling root on the system would do.

-----Original Message-----
From: Jason Holt [mailto:jason@lunkwill.org]
Sent: Friday, June 27, 2003 10:09 AM
To: Fong Vang
Cc: 'Oleg Drokin'; 'Hans Reiser'; 'reiserfs-list@namesys.com'
Subject: RE: Write-once file system



On Fri, 27 Jun 2003, Fong Vang wrote:

> I don't think turning the write option off during write is a good idea.
All
> file systems running reiserfs should make the file write-once.  File
systems
> that do need to be rewriteable will use ext3 or something else (that's how
> we do it now anyway).
> 
> Could it done in such a way that even root can't write (not even when
using
> block devices)?
[...]

The trick is that root controls the kernel, and the kernel talks directly to
the hardware.  That's all a block device is - (mostly) direct hardware
access.

So what you're asking for is something beyond root's control that can tell
him
"no" when he asks to write to an immutable file.

Hardware would be one such option - a disk which knows what has been written
and will refuse to write over it.

A separate machine would be another, serving up a write-once filesystem over
a
network.

It might even be possible to have two virtual machines on the same box.  
User-mode linux, for instance, lets you create a virtual linux box on a
machine - you have root on the virtual machine, but not necessarily on the
real one.  Obviously, somebody else will have to be the "real" root, and
they'd be able to access the real block devices.  And of course, anybody
that
has physical access to a box can almost certainly gain root on it.

					-J


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
