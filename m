From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: reiser4 disk formats (was http://www.namesys.com/snapshots/2004.08.09-internal.testing/)
Date: Mon, 16 Aug 2004 01:27:51 +0200
Message-ID: <20040815232751.GA3627@raptus.homelinux.net>
References: <20040813171827.GA15303@raptus.homelinux.net> <200408151524.34396.vitaly@namesys.com> <20040815225501.GA8679@raptus.homelinux.net> <200408160113.38791.frbiscani@jumpy.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20311-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408160113.38791.frbiscani@jumpy.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, Aug 16, 2004 at 01:13:38AM +0200, Francesco Biscani wrote:
> Hi,
> 
> On Monday 16 August 2004 00:55, Domenico Andreoli wrote:
> > so the most safe catch-all command sequence should be simply
> >
> >   1. fsck.reiser4 device
> >      - do also whatever fsck says is required to bring the fs
> >        consistent. most probably it will say to use --build-sb and
> >        then --fix.
> >   2. debugfs.reiser4 -C device
> >   3. fsck.reiser4 device
> >      - do again whatever fsck says, most probably --fix is required.
> >
> > this should bring the fs from whatever disk format it is in to the
> > latest one and this *should* happen without data loss. am i right?
> 
> I may be wrong here, but as far as I remember reiser4progs 1.x give errors if 
> used on old disk formats. If you try to --fix these errors _before_ changing 
> format you may lose data. So the best sequence would be:
> 
> 1. fsck.reiser4 --fix device 
>      (with reiser4progs < 1.x)
> 2. upgrade to reiser4progs 1.x
> 3. debugfs.reiser4 -C device
> 4. fsck.reiser4 --fix device
> 
> This way you fix all real errors (possibly) present _before_ converting the 
> layout, and you avoid the (false) errors reported by reiser4progs 1.x on old 
> disk layouts. Can someone confirm?
> 

i'm talking about a message to be put in the reiser4progs 1.0.0 package.
when the user reads the message she will not have any older version
around. so this sequence dosen't suit my needs :(

if you are right about fixing things before debugfs.reiser4 may loose
data, then the right sequence is the one from Vitaly.

what is confusing me is Vitaly saying:

"The converter (debugfs.reiser4 -C) is supposed to be run on consistent
 fs of course, so probably it is worth to check/fix it with the current
 reiser4progs before any update."

probably with "... any update." he meant also the update of the
reiser4progs package to 1.0.0, doesn't him?

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
