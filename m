From: Chris Mason <mason@suse.com>
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary
	additional namespace to ReiserFS
Date: Wed, 28 Apr 2004 08:45:21 -0400
Message-ID: <1083156321.30344.162.camel@watt.suse.com>
References: <1082750045.12989.199.camel@watt.suse.com>
	 <408E9F42.2080804@namesys.com> <20040427190439.A20646@infradead.org>
	 <200404281022.36081.christian.mayrhuber@gmx.net>
	 <20040428094435.GE29226@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18271-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040428094435.GE29226@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus TXrnqvist <mjt@nysv.org>, reiser@namesys.com
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com

On Wed, 2004-04-28 at 05:44, Markus TXrnqvist wrote:
> On Wed, Apr 28, 2004 at 10:22:36AM +0200, Christian Mayrhuber wrote:
> 
> >I wonder if Novell/SuSE would take over full Reiserfs3 maintainership as
> >namesys is now concentrating on the next big step: Reiser4.
> 
> This would be an EXCELLENT idea; something that a SuSEist should take
> seriously if reading this list.
> 
SUSE has been a major reiserfs v3 contributor for a long time, in code,
testing and userbase.  My goal here is not to change our working
relationship with namesys, only to convince Hans that he needs to
rethink the way v3 has been maintained.

Hans, linux gets new production users every day.  Those wanting a stable
FS won't pick v4 yet, it takes a while to shake out those last stubborn
bugs.  Keep v3 as a viable alternative to ext3, and these people are
going to be first in line as v4 proves itself.

> This is not an easy point, because xattrs might win in this competition
> because people are used to it, they are lazy, they would use xattrs on
> Reiser4 because they don't want to learn anything new. The power that is,
> that writes xattrs support, would quite effectively pave the road to hell.
> 
> >I like the filesystem namespace very much and I guess I'm not alone, because  
> >procfs, sysfs, etc. are there. It even follows the the tradition of unix in 
> >accessing devices as special files.
> >Hans should win such a discussion hands down ;-)

Getting change in the linux kernel is easy.  Develop and test a good
system, discuss that system with everyone, build a framework so the rest
of the kernel can take advantage (keeping userland compatibility in
mind).

There's a difference between developing code that goes on top of the
kernel and developing code that integrates with the kernel.  namesys
hasn't quite figured out the latter yet.  When they do, everything will
get easier.

(as a side note, the v3 xattr patch implements each xattr as a file ;-)

-chris


