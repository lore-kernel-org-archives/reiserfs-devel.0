From: Helge Hafting <helgehaf@aitel.hist.no>
Subject: Re: file as a directory
Date: Sun, 28 Nov 2004 19:53:34 +0100
Message-ID: <20041128185334.GA5329@hh.idb.hist.no>
References: <2c59f00304112205546349e88e@mail.gmail.com> <41A1FFFC.70507@hist.no> <20041125230937.GA2909@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22605-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041125230937.GA2909@elf.ucw.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Helge Hafting <helge.hafting@hist.no>, Amit Gud <amitgud1@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Fri, Nov 26, 2004 at 12:09:37AM +0100, Pavel Machek wrote:
> Hi!
> > >
> > You won't get .tar or .tar.gz support in the VFS, for a few simple reasons:
> > 1. .tar and .tar.gz are complicated formats, and are therefore better
> >   left to userland.  You can get some of the same effect by using a shared
> >   library that redefines fopen() and fread() though.  It'll work fine for
> >   the vast majority of apps that happens to use the C library.
> 
> It is not same effect -- with shared library you get no caching. And
> that hurts a lot.
> 
The compressed file is still cached, and the library can cache
file contents in a shared mapping.  It does not have to
be a per-process thing.

> >   It is hard to make a guaranteed bug-free decompressor that
> >   is efficient and works with a finite amount of memory.  The kernel
> >   needs all that - userland doesn't.
> 
> If you have bug in decompressor, you are screwed, anyway, because you
> get remote user exploit when mozilla gets the file from
> web. Oops. [Ok, you at least do not get remote root exploit, but...]
> 
I don't worry about mozilla exploits - you get those from
nasty webpages as well.  I worried about a decompressor
cras (or random memory overwrite).  A userland implementation
will crash that particular userland process, with no ill effects on 
the rest of the system. 

A kernelside crash is much worse - it can hang the kernel and/or
mess up any process.  As for exploits - an in-kernel exploit
is even worse than a root exploit.  There are plenty
of thing even root can't do - at least not in 
straightforward ways.  The kernel has no limitations
whatsoever for what may go wrong.

Helge Hafting
