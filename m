From: Russell Coker <russell@coker.com.au>
Subject: Re: Write-once file system
Date: Sat, 28 Jun 2003 04:03:01 +1000
Message-ID: <200306280403.01755.russell@coker.com.au>
References: <Pine.LNX.4.44.0306271700140.3922-100000@potato.zayda.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0306271700140.3922-100000@potato.zayda.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Holt <jason@lunkwill.org>, Fong Vang <FVang@Zantaz.com>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

On Sat, 28 Jun 2003 03:09, Jason Holt wrote:
> On Fri, 27 Jun 2003, Fong Vang wrote:
> > I don't think turning the write option off during write is a good idea. 
> > All file systems running reiserfs should make the file write-once.  File
> > systems that do need to be rewriteable will use ext3 or something else
> > (that's how we do it now anyway).
> >
> > Could it done in such a way that even root can't write (not even when
> > using block devices)?
>
> [...]
>
> The trick is that root controls the kernel, and the kernel talks directly
> to the hardware.  That's all a block device is - (mostly) direct hardware
> access.
>
> So what you're asking for is something beyond root's control that can tell
> him "no" when he asks to write to an immutable file.

Another option is to use a security system such as SE Linux to limit the 
access given to the root account.

In SE Linux a daemon running as root generally has very little access to the 
system, and a UID=0 user who is in the user_t domain gets less access than a 
non-root user on a non-SE system.

Go to my SE Linux web page (below) and read about my "play machine".

SE Linux works well on ReiserFS.  I don't use ReiserFS on my play machine 
however because it can only boot from Ext2, Ext3, or XFS.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

