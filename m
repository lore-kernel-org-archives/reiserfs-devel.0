From: Oleg Drokin <green@namesys.com>
Subject: Re: Crashes with corruption of disk data
Date: Sun, 21 Jul 2002 22:26:35 +0400
Message-ID: <20020721222635.A22526@namesys.com>
References: <20020721001030.GM229@hvs.envisage.co.za>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11063-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020721001030.GM229@hvs.envisage.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hendrik Visage <hvisage@envisage.co.za>
Cc: reiserfs-list@namesys.com

Hello!

   This is a know issue.
   If you muck with FS data of mounted reiserfs filesystem, not using
   reiserfs in-kernel driver, you are asking for trouble.

Bye,
    Oleg   
On Sun, Jul 21, 2002 at 02:10:30AM +0200, Hendrik Visage wrote:
> 
> Hi there,
> 
>  I've came upon a crash situation (quite repeatable) with reiserfs,
> but NOT with ext2/3.
> 
> Using Vanilla 2.4.17 + XFS + EVMS-1.1.0-rc4
> 
> (1) using evmsn I created a logical volume, mkfs'd it, and
> mounted it. FS used was ext3 & reiserfs
> 
> (2) went into evmsn again & destroyed[b] the volume with a
>  unmkfs[a]
> 
> (3) forced exited evmsn 
> 
> (4) tried to access the "still" mounted fs & umount it
> 
> At this point, ext2/3 would let go of the mounted FS,
> however, reiserfs consistently crashed into the SGI/XFS
> Kernel debugger :(
> 
> I'm of believe that this would be seen as a non check of the
> validity of the underlying diskdata. I believe this test could
> be repeated with a dd if=/dev/zero of=/dev/mounted/reiser but haven't
> yet done so (sleep time), but would be able to report or help with
> finding the errors if it is seen as a bug, as I haven't seen documentation
> to the contrary.
> 
> Greetz
> Hendrik
> 
> Notes
> [a] because a miss assumption which are being fixed, this was
>  wrongly executed, but the "issue" still hold :(
> [b] it weren't actually destroyed, though the unmks were run,
>  as the kernel wouldn't let go of a mounted volume, thus the
> forced in (3)
