From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: The argument for fs assistance in handling archives (was:
	silent semantic changes with reiser4)
Date: Thu, 02 Sep 2004 10:46:05 +0100
Message-ID: <1094118362.4847.23.camel@localhost.localdomain>
References: <20040826150202.GE5733@mail.shareable.org>
	 <200408282314.i7SNErYv003270@localhost.localdomain>
	 <20040901200806.GC31934@mail.shareable.org>
	 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21269-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Mer, 2004-09-01 at 21:50, Linus Torvalds wrote:
> and quite frankly, I think you can do the above pretty much totally in
> user space with a small library and a daemon (in fact, ignoring security
> issues you probably don't even need the daemon). And if you can prototype
> it like that, and people actually find it useful, I suspect kernel support
> for better performance might be possible.

Gnome already supports this in the gnome-vfs2 layer. "MC" has supported
it since the late 1990's.


