From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Fri, 23 Apr 2004 16:54:06 +0400
Message-ID: <200404231653.51012.vitaly@namesys.com>
References: <200404201733.51809.rmeijer@internet.gr> <200404231303.50547.vitaly@namesys.com> <20040423102712.GA3900@raptus.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040423102712.GA3900@raptus.homelinux.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com

On Friday 23 April 2004 14:27, Domenico Andreoli wrote:
> hi,
>
> On Fri, Apr 23, 2004 at 01:03:50PM +0400, Vitaly Fertman wrote:
> > > Yes, it was done. But probably it is broken now due to lots of last
> > > changes like new plugins, plugin inheritance, interface changes etc.
>
> i was unable to make it work, but this is probably a problem i have
> with stage1_5.
>
> i usually use this command in grub shell to install stuff:
>
> grub> install (hd0,6)/boot/stage1 d (hd0) (hd0,6)/boot/stage2 p
> (hd0,6)/etc/grub.conf
>
> probably with reiser4_stage1_5 it should be:
>
> grub> install (hd0,6)/boot/stage1 d (hd0) (hd0,6)/boot/reiser4_stage1_5 p
> (hd0,6)/boot/stage2 (hd0,6)/etc/grub.conf
>
> but i get a "Error 16: Inconsistent filesystem structure"

Is root set correctly?

does it work with the stage2 ?

check info grub please for things like:
*Caution3:* You must specify the option `--stage2' in the grub
     shell, if you cannot unmount the filesystem where your stage2 file
     resides. The argument should be the file name in your operating
     system.

did you try 'setup' command?

could also be a problem in progs.

> > It seems Hans asks why reiser4 support is not included into the
> > grub yet. The patch for the grub is in the reiser4progs package,
> > but IIRC will not be included into the grub untill reiser4 ships.
> > Yura, did you get this answer?
>
> the most recent patch for grub i found is in snapshot 2004.03.26 and is
> a separate diff. is it really supposed to be in reiser4progs tarball? i
> didn't find it in latest 2004.04.21 :/

I mean reiser4progs bk repository. As there are still many changes that 
break the grub support, it is released separately with the progs package
where it works. And later it is supposed to be included into the grub.

-- 
Thanks,
Vitaly Fertman

