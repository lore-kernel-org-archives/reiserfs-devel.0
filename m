From: Christer Weinigel <christer@weinigel.se>
Subject: Re: silent semantic changes with reiser4
Date: 01 Sep 2004 01:19:00 +0200
Sender: wingel@zoo.weinigel.se
Message-ID: <m3acwa99qz.fsf@zoo.weinigel.se>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl>
	<Pine.LNX.4.58.0408311252150.2295@ppc970.osdl.org>
	<20040831203226.GB16110@elf.ucw.cz>
	<Pine.LNX.4.58.0408311336580.2295@ppc970.osdl.org>
	<20040831205422.GD16110@elf.ucw.cz>
	<Pine.LNX.4.58.0408311357550.2295@ppc970.osdl.org>
	<20040831220726.GB16428@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21189-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040831220726.GB16428@elf.ucw.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Pavel Machek <pavel@ucw.cz> writes:

> Okay, that does work, it just is not really nice. Just as reserving
> fixed ammount of space for disk cache is bad, reserving fixed ammount
> of space for ccache (and similar) is bad. When there are few of such
> caches, balancing between them starts to matter...

So try to convince them to use the same cache daemon or the same
shared cache manager library then.  It isn't all that different from
implementing a kernel interface that everyone is supposed to use.

A cache manager daemon could sit and watch the free space on the disk
every other second and start deleting the cached files (according to
some LCU heuristics or whatever) whenever free space is getting low.

To see if the original file is newer than the cached file, good old
mtime can be used.  

I can't remember who right now, but someone mentioned a few problems
with timestamps:

1. The resolutions is too low in current kernels, but that just means
   that someone(tm) needs to implement nanosecond timestamps in the
   kernel and for the filesystems.

2. Even nanosecond timestams may become to coarse in the future.  One
   way of getting around this is to keep track of the latest timestamp
   written and make sure the next timestamp is one higher than the
   latest one.  This way timestamps are always increasing, and I doubt
   that we can have modifications each nanosecond for a long time with
   the hardware available for the next ten years.

3. If time goes backwards beacuse somebody changes the clock, the
   caching (or makefile rules) can get confued.  This is a hard one,
   but I actually we can use the doctors response "don't do that
   then".  With NTP we can guarantee a monotonically increasing clock.

I belive the kernel could give some assistance to make it easier to
see if a file has been modified, I remember that a few suggestions
were thrown around the last time Samba and dcache aliases were
discussed on l-k.  I definitely belive that kind of infrastructure
belongs in the kernel.  But the cache manager itself, no.

  /Christer

-- 
"Just how much can I get away with and still go to heaven?"

Freelance consultant specializing in device driver programming for Linux 
Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
