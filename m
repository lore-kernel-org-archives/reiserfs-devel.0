From: Jason Holt <jason@lunkwill.org>
Subject: RE: Write-once file system
Date: Fri, 27 Jun 2003 17:09:19 +0000 (UTC)
Message-ID: <Pine.LNX.4.44.0306271700140.3922-100000@potato.zayda.com>
References: <12C7D768CC8ED4118A9200508BEEC6FB033776CC@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <12C7D768CC8ED4118A9200508BEEC6FB033776CC@zanexch.zantaz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fong Vang <FVang@Zantaz.com>
Cc: 'Oleg Drokin' <green@namesys.com>, 'Hans Reiser' <reiser@namesys.com>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>


On Fri, 27 Jun 2003, Fong Vang wrote:

> I don't think turning the write option off during write is a good idea.  All
> file systems running reiserfs should make the file write-once.  File systems
> that do need to be rewriteable will use ext3 or something else (that's how
> we do it now anyway).
> 
> Could it done in such a way that even root can't write (not even when using
> block devices)?
[...]

The trick is that root controls the kernel, and the kernel talks directly to
the hardware.  That's all a block device is - (mostly) direct hardware access.

So what you're asking for is something beyond root's control that can tell him
"no" when he asks to write to an immutable file.

Hardware would be one such option - a disk which knows what has been written
and will refuse to write over it.

A separate machine would be another, serving up a write-once filesystem over a
network.

It might even be possible to have two virtual machines on the same box.  
User-mode linux, for instance, lets you create a virtual linux box on a
machine - you have root on the virtual machine, but not necessarily on the
real one.  Obviously, somebody else will have to be the "real" root, and
they'd be able to access the real block devices.  And of course, anybody that
has physical access to a box can almost certainly gain root on it.

					-J

