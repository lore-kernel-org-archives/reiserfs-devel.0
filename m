From: Jamie Lokier <jamie@shareable.org>
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Thu, 2 Sep 2004 17:11:30 +0100
Message-ID: <20040902161130.GA24932@mail.shareable.org>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <1094118362.4847.23.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1094118362.4847.23.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Alan Cox wrote:
> On Mer, 2004-09-01 at 21:50, Linus Torvalds wrote:
> > and quite frankly, I think you can do the above pretty much totally in
> > user space with a small library and a daemon (in fact, ignoring security
> > issues you probably don't even need the daemon). And if you can prototype
> > it like that, and people actually find it useful, I suspect kernel support
> > for better performance might be possible.
> 
> Gnome already supports this in the gnome-vfs2 layer. "MC" has supported
> it since the late 1990's.

Firstly, if I have to do it from a Gnome program, about the only
program where looking in a tar file is visibly useful is Nautilus.
Ironically, clicking on a tar file in Nautilus doesn't work, despite
having a dependency on gnome-vfs2. :/

Secondly, no, Gnome and MC don't support entering a container file,
letting you make changes in it, and remembering those changes to
_lazily_ regenerate the container file when you need it linearized,
possibly months later or never, by some unrelated program.

Thirdly, you must be referring to the Gnome versions of Bash, Make,
GCC, coreutils and Perl which I haven't found.  Perhaps we have a
different idea of what "supports this" means :)

uservfs, which is based on gnome-vfs and getting a bit rusty due to
disuse, does try to solve the last problem.  Unfortunately it needs
further work to have a nicer interface, and the second problem is
still not solved by gnome-vfs.

-- Jamie
