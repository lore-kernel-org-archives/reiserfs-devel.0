From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Mon, 2 Aug 2004 21:02:41 +0200
Message-ID: <200408022102.41838.christian.mayrhuber@gmx.net>
References: <410D96DC.1060405@namesys.com> <200408021112.08981.christian.mayrhuber@gmx.net> <87r7qpo3dj.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19921-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87r7qpo3dj.fsf@uhoreg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 02 August 2004 19:29, Hubert Chan wrote:
> >>>>> "Christian" == Christian Mayrhuber <christian.mayrhuber@gmx.net>
> >>>>> writes:
>
> Christian> Linux VServer might be a project that already tries to
> Christian> accomplish this task.
>
> After poking around the linux-veserver.org page, it sounds like Linux
> VServer is completely different from what Hans/Namesys is trying to do.
> Linux VServer still uses chroot.  From what I understand about views,
> you don't need to set up a chroot; applications run under the same
> filesystem as everything else.  You just need to, for example, say that
> apache is allowed to read from /etc/apache/*, /var/www, /usr/lib, etc.,
> and is allowed to write to /var/log/apache/*.  Then, even though apache
> is running under the same filesystem, it won't even be able to see, say
> /etc/passwd.
Yes, you are right, after reading Hans writeup on the homepage it's clear to 
me. Views will be definitely very handy. Process Oriented Security seems to 
be a rather complicated task to administer - it reads like tripwire 
configuration.

The vserver project has similiar goals:
 - ease administration
 - higher security

chroot() + a marker is still used, because there is nothing better available 
today ...
Process separation is accomplished by attaching a context number to every 
process. Processes with a higher context number than 1 are jailed in their 
root directory. The network interfaces, process RAM, CPU and disk quota usage 
is also bound to the same number.
You can give a "view" to the world outside the chroot() jail by using
"mount --bind" in the pre-start phase of the vserver.

The views and process oriented security concepts seem to be orthogonal to 
linux vserver.

-- 
lg, Chris

