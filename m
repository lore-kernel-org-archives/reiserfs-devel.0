From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Fri, 23 Apr 2004 12:27:12 +0200
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040423102712.GA3900@raptus.homelinux.org>
References: <200404201733.51809.rmeijer@internet.gr> <40880F5C.6080207@namesys.com> <1082703897.3616.9.camel@firefly> <200404231303.50547.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200404231303.50547.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

hi,

On Fri, Apr 23, 2004 at 01:03:50PM +0400, Vitaly Fertman wrote:
> > Yes, it was done. But probably it is broken now due to lots of last
> > changes like new plugins, plugin inheritance, interface changes etc.

i was unable to make it work, but this is probably a problem i have
with stage1_5.

i usually use this command in grub shell to install stuff:

grub> install (hd0,6)/boot/stage1 d (hd0) (hd0,6)/boot/stage2 p (hd0,6)/etc/grub.conf

probably with reiser4_stage1_5 it should be:

grub> install (hd0,6)/boot/stage1 d (hd0) (hd0,6)/boot/reiser4_stage1_5 p (hd0,6)/boot/stage2 (hd0,6)/etc/grub.conf

but i get a "Error 16: Inconsistent filesystem structure"


> It seems Hans asks why reiser4 support is not included into the 
> grub yet. The patch for the grub is in the reiser4progs package, 
> but IIRC will not be included into the grub untill reiser4 ships. 
> Yura, did you get this answer?

the most recent patch for grub i found is in snapshot 2004.03.26 and is
a separate diff. is it really supposed to be in reiser4progs tarball? i
didn't find it in latest 2004.04.21 :/

thanks
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
